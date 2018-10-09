## Import of SDF files

* The operation of the `Baby-LIN-MB` system is basically defined by the SDF files available on the internal SD-card drive.
* These SDF files are typically created and prepared on a PC by the `LINWorks` software. When SDF configuration is done, the SDF file is transferred to the Baby-LIN-MB by means of a **FAT-formatted** USB stick.
* The *SDF files* to be transferred to the `Baby-LIN-MB` must be copied into a **specific sub-directory** on the USB stick as follows: `\BL-MB-01\database\`.
* Inserting a USB stick (`USB HOST` or `X3 USB1` or `X11 USB2`), which holds SDF files in the sub-directory "\BL-MB-01\database" and pressing the **green button**, will automatically start the SDF file copy process.
* During the copy operation the green LED flashes. After completion, the **green LED** will stay on permanent (may only be for a second), or the **red LED** will turn on, if any error occurred.
* If you transfer a file with the same name, as another file which is already on the internal SD-card, the file will be overwritten by the new file on the USB stick.
