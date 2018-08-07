# Cheatsheet for the silent installation of almost any windows package.

#### MSI

- Can manipulate using the ` msiexec` utility. 
	- To install this way you must be in a cmd or powershell. 
	- using the `/i` and `/qb` switches to install a selected msi file. Use the `/l*` switch to produce a log file. 
	- You can also provide named options (or "properties") at the end of the command line **but** which properties are supported depends on the package. For example, this command:

		```PowerShell
		msiexec /qb /l* perl-log.txt /i ActivePerl.msi PERL_PATH=Yes PERL_EXT=Yes
		```
		- The above command is how you install `ActiveState Perl` while instructing the MSI package to add `Perl.exe` to your **PATH** and to associate `.pl` files with it.
	- There is also a `REBOOT` property, which will suppress any _automatic reboot- the MSI package might try to perform. So in general, you'll want to use the `REBOOT=ReallySuppress` parameter at the end of your `msiexec` command.
- **_ITS TO BAD NO ONE USES MSI INSTALLERS VERY OFTEN._**

#### InstallShield

- Installers created by InstallShield recognize the `/r`, `/s`, `/sms`, `/f1`, and `/f2` switches. The installer itself is invariably named setup.exe.

- To preform a _Silent_ installation, you will need a `setup.iss` file in the same directory as the target .exe file.
	- Most installers do not come with such a file, so you will have to create it by adding the `/r` (or short for `record`) switch.
		- This will open the normal InstallShield GUI. Go through the dialogs and complete the installation. 
		- You must now go retrieve the newly created `setup.iss` in `C:\\Windows` directory and move it to your target .exe directory.
- Now that we have our `setup.iss` file, we can continue to install the program silently.
	- The `/s` switch is supposed to install it silently, but most the time it just forks a separate process and exits. this means it will return immediately and basically do nothing.
	- That leads us to use another switch called `/sms` which causes the installer to pause until the installation completes. 
	- A good rule of thumb would be to provide both the `/s` and `/sms` switches. 
	
- The `/f1filename` switch allows you to specify a fully-qualified _alternate name_ for the `setup.iss` file. Note that there must be no space between the `/f1` switch and the file name. This switch works both with `/r` to create the file and with `/s` to read it.
- The `/f2filename` switch specifies a log file. Once again, there must be no _space_ between the switch and the file name.
- **NOTE:** Many packages have "custom dialogs" which are not supported by `setup.iss`, which means the dialogs will always appear no matter what you do. For such packages, suggest doing what you can to deprive them of business.

#### Example:
To get to the folowing server adress in PowerShell, you may need to use this command: `net use R: \\RONALD-ANN\3rdParty`

```PowerShell
.\Solid_Edge_Free2D_ST10.exe /r /f1settings.iss
```

More info: http://unattended.sourceforge.net/installers.php