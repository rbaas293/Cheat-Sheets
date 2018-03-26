## Linux: Finding and Mounting Drives
**NOTE:** This example will be in the context of mounting a drive with multiple NFTS Partitions on it. replace anyting refering to windows with your context. 

1. Check what your unmounted drive and its partitions are called:
   1. Its good practice to check what is already mounted: run `df -h`. 
   2. Next use, `fdisk -l`. It will list all detected drives with a bunch of details including partisions.
   3. The bes it prolly `lsblk`. Locate your NTFS partition(s) and note down there sda<#> or sdb<#>.

2. Make directories to mount each partition to:
   * `sudo mkdir /mnt/windowsboot`
   * `sudo mkdir /mnt/windows2`

3. Commands to mount each partition to our newly created directories:
   * `sudo mount /dev/sda2/ /mnt/windowsboot/`
   * `sudo mount /dev/sda3/ /mnt/windows2/`

4. To check what you can see in the newly mounted drives:
   * `ls -la /mnt/windowsboot`
   * `ls -la /mnt/windows2`
