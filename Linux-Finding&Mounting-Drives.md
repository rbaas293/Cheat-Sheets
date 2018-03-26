## Linux: Finding and Mounting Drives
**NOTE:** This example will be in the context of mounting a drive with multiple NFTS Partitions on it. replace anyting refering to windows with your context. 

1. Make directories to mount each partition to:
...* `sudo mkdir /mnt/windowsboot`
...* `sudo mkdir /mnt/windows2`

2. Commands to mount each partition to our newly created directories;
...* `sudo mount /dev/sda2/ /mnt/windowsboot/`
...* `sudo mount /dev/sda3/ /mnt/windows2/`

3. To check what you can see in the newly mounted drives:
...* `ls -la /mnt/windowsboot
...* `ls -la /mnt/windows2
