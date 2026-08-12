# Scripts

Standalone utility scripts. These are run ad-hoc, on demand — they are not part
of any machine's setup sequence (those live in the per-host folders at the repo
root and keep their `01-`, `02-` ordering prefixes).

Every script here is read-only: they report information and never delete files
or terminate processes.

| Script | Platform | What it does |
| --- | --- | --- |
| `find-large-files-macos.sh` | macOS | Lists the largest directories and files so you can decide what to remove manually. |
| `find-memory-hogs-macos.sh` | macOS | Shows top processes by memory and CPU, plus long-running processes that may be leaking. |

## Usage

```sh
./find-large-files-macos.sh           # scan $HOME (default)
./find-large-files-macos.sh /path     # scan a specific folder

./find-memory-hogs-macos.sh
```

Both accept environment variables to tune their output:

```sh
TOP_N=30 ./find-large-files-macos.sh            # more results (default 20 / 15)
MIN_FILE_SIZE=100M ./find-large-files-macos.sh  # only files above this size
MIN_MEMORY_MB=1000 ./find-memory-hogs-macos.sh  # only processes above this RSS
```
