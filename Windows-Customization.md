

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
