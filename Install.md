```sh
sudo pacman -S ncurses
sudo pacman -S libxcrypt-compat
sudo pacman -S ncurses5-compat-libs

cat /etc/default/grub
```
grub
```conf
#GRUB_CMDLINE_LINUX_DEFAULT="loglevel=3 quiet"
GRUB_CMDLINE_LINUX_DEFAULT="loglevel=3 quiet splash SYSTEMD_CGROUP_ENABLE_LEGACY_FORCE=1 systemd.unified_cgroup_hierarchy=0"
GRUB_CMDLINE_LINUX="SYSTEMD_CGROUP_ENABLE_LEGACY_FORCE=1 systemd.unified_cgroup_hierarchy=0"
```
```sh
sudo grub-mkconfig -o /boot/grub/grub.cfg
update-grub
```

grub
```conf
linux	/vmlinuz-linux root=UUID=eb0c500d-5511-4563-b74d-b89c5dc93875 rw SYSTEMD_CGROUP_ENABLE_LEGACY_FORCE=1 systemd.unified_cgroup_hierarchy=0 loglevel=3 quiet splash SYSTEMD_CGROUP_ENABLE_LEGACY_FORCE=1 systemd.unified_cgroup_hierarchy=0
```

```sh
cat /proc/cgroups
```