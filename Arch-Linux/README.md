# Senal's Arch Linux Configuration Scripts

My Configuration Scripts for Arch Linux

# Configuring `dwm`

> Configuring `DWM` is easy as 123. 

```shell
cd dwm
sudo make install
```

```shell
cd st
sudo make install
```

```shell
cd slstatus
sudo make install
```



# Configurating Virtualbox

> Configuring  `virtualbox` is easy as 123

```shell
sudo pacman -S virtualbox
```

```shell
cd /etc/modules-load.d
sudo touch virtualbox.conf
sudo nano virtualbox.conf
```

###### Inside `virtualbox.conf`

```shell
vboxdrv
```

###### Reload with Modprobe

```shell
sudo modprobe vboxdrv
```
