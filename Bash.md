# Bash Oneliners and Functions

## Oneliners

```bash
# see all netcat proccess
ps -ef | grep "[n]c"

```

## Functions

```bash
parse_args() {
        while [ $# -gt 0 ]; do
                case $1 in
                        --offline) OFFLINE=yes ;;
                esac
                shift
        done
}

command_exists() {
        command -v "$@" >/dev/null 2>&1
}

error() {
        echo ${RED}"Error:%{BOLD} $@"${RESET} >&2
}

verbose() {
        echo ${YELLOW}"Verbose: "${BOLD}"$@"${RESET}
}

write() {
        echo $BOLD"$(basename $0):${RESET} $@"
}

setup_color() {
        # Only use colors if connected to a terminal, unless override is passed.
        override=$1
        if [ -t 1 ] || [ ! -z "$override" ] ; then
                RED=$(printf '\033[31m')
                GREEN=$(printf '\033[32m')
                YELLOW=$(printf '\033[33m')
                BLUE=$(printf '\033[34m')
                BOLD=$(printf '\033[1m')
                RESET=$(printf '\033[m')
        else
                RED=""
                GREEN=""
                YELLOW=""
                BLUE=""
                BOLD=""
                RESET=""
        fi
}

need_root() {
        if [ $(whoami) != root ]; then
                echo "This script must be run as root"
                exit 1
        fi
}

check_file() {
	# Check file or folder existence. Writes to stderr if does not exist.
	# Exits by default, but second argument can be passed to bypass exit.
	FILE=$1
	EXIT=$2
	if [ ! -e $FILE ]; then
		error "Path Does Not Exist: $FILE"
		case $EXIT in
			exit|EXIT|E|e) exit 1 ;;
			continue|CONTINUE|C|c) return 1 ;;
			*) exit 1;;
		esac
	fi
        return 0
}

```
