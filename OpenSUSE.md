# OpenSUSE

## Download Package Script
```bash
#!/bin/bash

PKG=$1

#mkdir -p $PKG

#cd $PKG

zypper download $PKG

cp $(find ~/.cache/zypp/packages/ -name "$PKG*") .
```
