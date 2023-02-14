# Packages for development on a RHEL host

```bash
yum install curl wget vim tmux zsh python3 python3-pip byobu autoconf automake binutils \ 
bison flex gcc gcc-c++ gdb glibc-devel libtool make pkgconf pkgconf-m4 pkgconf-pkg-config \ 
redhat-rpm-config rpm-build rpm-sign strace asciidoc byacc ctags diffstat git intltool \ 
ltrace patchutils perl-Fedora-VSP perl-generators pesign source-highlight systemtap \
valgrind cmake expect rpmdevtools rpmlint
yum -y install epel-release
yum -y install byobu
```

## Oneline

yum install \
"python39-psutil" "perf" "yum-utils" "python39-setuptools" "flex" "vim-enhanced" \
"autoconf" "sysstat" "gcc-c++" "cmake" "strace" "pcp-zeroconf" \
"valgrind" "gdb" "ltrace" "glibc-devel" "open-vm-tools" "python39" \
"make" "systemtap" "python39-toml" "python39-pip" "gcc" "git"
