

```PowerShell
scoop install 7zip git openssh concfg

# back-up current console settings
concfg export console-backup.json

# use solarized color theme
concfg import solarized-dark

# You'll see this warning:
#     overrides in the registry and shortcut files might interfere with
#     your concfg settings.
#     would you like to search for and remove them? (Y/n):
# Enter 'n' if you're not sure yet: you can always run 'concfg clean' later

scoop install pshazz
```
## Scoop has a thing called buckets. These are essensialy additonal sources for more repositories. 
* you can add a bucket I found online, which includes vivaldi. To do the same past the following into `PowerShell`.
  - `scoop bucket add vivaldi https://github.com/simonwjackson/my-bucket`
  
## Below is the link to a repository that searches github for scoop buckets and then sorts them according to popularity.
  * https://github.com/tapanchandra/awesome-scoop
  
  ## For when you want to make windows the default OS on grub
  
