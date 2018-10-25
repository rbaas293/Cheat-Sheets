## RAID SSD SWAP TUTORIAL:

  - **Please remember to note down the Serial Number of each new drive.**

#### Process:

1.  Remove One of the SSDs.
2.  Replace that SDD with the NEW or Same size or larger SSD.
3.  Start the computer and continously press `Ctrl + I` to get to `Intel Rapid Storage Technology - Option ROM`.
4.  Select `1. Create RAID Volume`.
5.  Select The new SSD and then back at the main menu, choose `6. Exit`.
6.  Your Computer will now boot into windows. Once windows is ready, open `Intel Rapid Storage Technology`. At this point The degregated disk should be in the process of rebuilding.
7.  Let it rebuild.
8.  When the rebuild compleates, shutdown the computer and remove the old (smaller) SSD.
9.  Repeate _Step 3_.
10. Choose `3. Reset Disks to Non-RAID Volume`.
  - **NOTE:** You may see a dialog box warning you of data loss. This warning does not apply to RAID 1; you will still be able to access your data.

11. Press `Spacebar to select the only disk`.
12. Press `Enter` to compleate the selection.
13. Type `y` for yes to confirm again.
14. Now choose `6. Exit` and boot into windows.
15. Use `Disk Management` to resize the hard drive partition so that it uses the entire capacity of the hard drive.
  - `C:` **_Should be at least_** `200.00 GB.`
  - `D:` ****Should be the rest of the unallocated volume.**\***
  - **\*NOTE:** It is good practice to leave `~7%` of the total SSD volume unallocated. This prolongs the life of the SSD but is not required. Any unallocated space could be easily extend if need be.

16. At this point, restart the computer and boot into Windows.

17. Open `Intel Rapid Storage`.
18. Press `Create` Button.
19. Under `Select Controller` select `SATA` AND under `select Volume Type` select `Real-time data protection (RAID 1)` and hit `Next`.
20. Select both SATA drives under `select Array Disks`, keep everything else default.
21. Choose `Next`.
22. Select `Ceate Volume`.
23. It should now be migrating data.
24. Wait for it to compleate.
25. Done!
