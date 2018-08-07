
**Only with pro:** `choco download notepadplusplus.commandline --internalize --resources-location D:\choco-internal-packages\`

**For choosing a non-community source:** `choco install putty.install -source <repository>`

**Quick install test:** `choco install -fdv path/to/nuspec`

pack up package to specific directory: `choco pack -out D:\choco-internal-packages\` #pack it up to a .nupkg in specified folder

#### Only one that works rn to install from nupkg:

`choco install <package name> -s <your $pwd with .nupkg>`

#### Push to our Local Domain Server repository:

To map "O: Internal" server in PS, use the following one liner: `net use O: \\steve\Internal`
will be pushing .nupkg to `Env:$crepo` or... `"O:\info_tech\chocolatey-package-repository"`
to get the value of a system enviorment variable: `Get-ChildItem Env:$crepo`
**Format:**
```PowerShell
choco push [<path to nupkg>] [<options/switches>]
cpush [<path to nupkg>] [<options/switches>]
Write-Host
```
**Examples**:
* `choco push --source "O:\info_tech\chocolatey-package-repository"` if your .nupkg is in `$pwd`

* `choco push "C:\Users\ryanbaas\OneDrive - Signalysis, Inc\Documents\Projects\Choco Internal Packages\Trials\XMind\xmind.3.7.5.nupkg" --source "O:\info_tech\chocolatey-package-repository" [<options/switches>]`


Yes we support that through the use of install arguments - see Install Arguments
If you wanted to pass native argument to the installer, like the install directory, you would need to know the silent argument passed to that particular installer and then you would specify it on the command line or in the packages.config.
If it was an MSI, then usually you could pass -ia "INSTALLDIR=""D:\Program Files""" (for cmd.exe, it's different for PowerShell). See how to pass options/switches for specifics on passing quoted values through.
For example, Notepad++ uses the NSIS (NullSoft Scriptable Install System) installer. If we look at the silent options, we see that /D is how we influence the install directory. So we would pass choco install notepadplusplus.install -ia "'/D=E:\SomeDirectory\somebody\npp'" -note that we are looking at the specific package over the virtual (although you can do the same with notepadplusplus as well).
Is there a better way? Absolutely, see ubiquitous install directory switch!
