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
    
#### A good resource for PowerShell looping and other things can be found [here](http://www.computerperformance.co.uk/powershell/powershell_loops.htm).