from __future__ import annotations

import ipaddress
import re
import socket
from concurrent.futures import ThreadPoolExecutor, as_completed
from typing import Iterable

_MAC_RE = re.compile(r"^([0-9A-Fa-f]{2}[:-]){5}([0-9A-Fa-f]{2})$")


def normalize_mac(mac: str) -> str:
    raw = mac.strip().replace("-", ":").replace(".", ":")
    if not _MAC_RE.match(raw):
        raise ValueError(f"invalid MAC address: {mac}")
    parts = raw.split(":")
    return ":".join(p.zfill(2).lower() for p in parts)


def wake_on_lan(mac: str, broadcast: str = "255.255.255.255") -> None:
    hw = bytes(int(x, 16) for x in normalize_mac(mac).split(":"))
    payload = b"\xff" * 6 + hw * 16
    with socket.socket(socket.AF_INET, socket.SOCK_DGRAM) as sock:
        sock.setsockopt(socket.SOL_SOCKET, socket.SO_BROADCAST, 1)
        sock.sendto(payload, (broadcast, 9))


def tcp_reachable(ip: str, port: int, timeout: float = 0.45) -> bool:
    try:
        with socket.create_connection((ip, port), timeout=timeout):
            return True
    except OSError:
        return False


def reverse_hostname(ip: str) -> str:
    try:
        name, _, _ = socket.gethostbyaddr(ip)
        return name.split(".")[0]
    except OSError:
        return ""


def iter_subnet_hosts(cidr: str) -> Iterable[str]:
    network = ipaddress.ip_network(cidr, strict=False)
    if network.version != 4:
        raise ValueError("only IPv4 subnets are supported")
    if network.num_addresses > 4096:
        raise ValueError("subnet too large — use /24 or smaller")
    hosts = list(network.hosts())
    # Never sweep more than a /20 worth of addresses.
    if len(hosts) > 4094:
        raise ValueError("subnet too large")
    return (str(host) for host in hosts)


def discover_subnet(cidr: str, port: int, workers: int = 48) -> list[dict]:
    hits: list[dict] = []

    def probe(ip: str) -> dict | None:
        if not tcp_reachable(ip, port):
            return None
        return {
            "ip": ip,
            "reachable": True,
            "hostname": reverse_hostname(ip),
            "port": port,
        }

    with ThreadPoolExecutor(max_workers=workers) as pool:
        futures = {pool.submit(probe, ip): ip for ip in iter_subnet_hosts(cidr)}
        for future in as_completed(futures):
            row = future.result()
            if row:
                hits.append(row)

    hits.sort(key=lambda row: ipaddress.ip_address(row["ip"]))
    return hits