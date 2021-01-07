# PowerShell Cheat Sheet

### Variables
  * Always have a dollar sign ($) before them.
  * Example below:
  ```PowerShell
  $numberofcmdlets = (get-command).count
  ```

### cmdlet's:
  * **Write-Host** simply writes text to the screen of the machine hosting the PowerShell session. Example below:
  ```PowerShell
  Write-Host "Whatever text I want, as long as it is inside double quotes."
  ```
  * But you can integrate variables with `Write-Host`. You just call them with the dollar sign notation and work them right into your text. Example below:
  ```PowerShell
  Write-Host "There are $numberofcmdlets commands available for use on this system."
  ```
### Conditionals
**In PowerShell, your normal conditional symbols like `>, <, >=, <=, ==` are denoted in the _table_ below:**

Conditional | PS 
--- | --- 
*Greater Than* | `-gt` 
*Less Than* | `-lt`
*Greater Than or Equal* | `-ge`
*Less Than or Equal* | `-le` 
*Equal Too* | `-eq`
*Not Equal Too* | `ne`
*Case Sensitive Ex.* | `-Ceq`

**Other Comparison Operarators are:** 
```PowerShell
-Like -NotLike -Match -NotMatch -Contains -NotContains -In -NotIn -Replace
```
### Looping:
  * The **if/then** mechanism; in PowerShell lingo, this is called the "construct."
    * If I wanted to have PowerShell display whether 10 was greater than 5. Example below:
    
    ```PowerShell
    If (10 –gt 5)
     {
     Write-Host "Yes"
     }
     ```
   * A loop with an `elseif`:
    
```PowerShell
    If (10 –gt 11)
    {
    Write-Host "Yes"
    } elseif (11 –gt 10)
    {
    Write-Host "This time, yes"
    }elseif (20 –gt 40)
    {
    Write-Host "Third time was a charm"
    } else {
    Write-Host "You're really terrible at math, aren’t you?"
    }
```

### PATH
* These snippets provide a quick way to update your environment variables directly from your powershell console. Just copy paste these lines, or even better, add it to your profile as functions.

```Powershell
# refreshing env in current shell
$env:path = [System.Environment]::GetEnvironmentVariable("Path", "Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path", "User")

# adding path to env
# set path in the $_newPath variable, and it'll get set to your user environment path and persisted.
$_newPath=""; [System.Environment]::SetEnvironmentVariable("Path", [System.Environment]::GetEnvironmentVariable("Path", "User") + ";${_newPath}", "User")
```
### Delete any file 
```Powershell
function Remove-Any-File-Force ($Target) {
    if ( Test-Path -Path "$Target" ){
        & $env:SystemRoot\System32\ATTRIB.exe -S -H -R "$Target" >$null 2>$null
    } else {
        return
    }
    $TargetAttributes = (Get-Item -Path $Target -Force).Attributes.ToString()
    if ($TargetAttributes -match "ReparsePoint") {
        if ($TargetAttributes -match "Archive") {
            Remove-Item -Path "$Target" -Force
        } else {
            try {
                & $env:SystemRoot\System32\cmd.exe /c rmdir /Q "$Target" >$null 2>$null
            } catch {
                try {
                    [io.directory]::Delete("$Target")
                } catch {
                    Remove-Item -Path "$Target" -Force
                }
            }
        }    
    } else {
        if ($TargetAttributes -match "Directory") {
            Remove-Item -Path "$Target" -Force -Recurse
        } else {
            Remove-Item -Path "$Target" -Force
        }
    }
}
```


#### A good resource for PowerShell looping and other things can be found [here](http://www.computerperformance.co.uk/powershell/powershell_loops.htm).
