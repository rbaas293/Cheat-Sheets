# Bash Oneliners and Functions

## Oneliners




```bash
# Find a file, and print out file with full ls -l info
find / -name "<filename>" -exec ls -l {} \;

# see all netcat proccess
ps -ef | grep "[n]c"

# Arrays
## Explicit Declare indexed array
declare -a my_array

## Explicit declare Associative (Dictionary)
declare -A my_array

## Assign >1 indexes
my_array=(foo bar)

## Assign by index number
my_array[0]=foo

## Assign key value pairs
my_array=( ["moo"]="cow" ["woof"]="dog")

## Print the values of an array
echo ${my_array[@]} 
echo ${my_array[*]}

# Get size of an array
${#my_array[@]}

# Add elements to indexed arrays
my_array+=(baz foobar)
my_array+=([baz]=foobar [foobarbaz]=baz)

# Delete elements of arrays
unset my_array[1]
unset my_array[foo]


```

## Functions

```bash
setup_color() {
        # Only use colors if connected to a terminal, unless override is passed.
        override=$1
        if [ -t 1 ] || [ ! -z "$override" ] ; then
                RED=$(printf '\033[31m')
                GREEN=$(printf '\033[32m')
                YELLOW=$(printf '\033[33m')
                BLUE=$(printf '\033[34m')
                MAGENTA=$(printf '\033[95m')
                CYAN=$(printf '\033[36m')
                BOLD=$(printf '\033[1m')
                ITALIC=$(printf '\033[3m')
                RESET=$(printf '\033[m')
                WARNING=$(printf '\033[93m')
                HEADER=$(printf '\033[95m')
                UNDERLINE=$(printf '\033[4m')
                
        else
                RED=""
                GREEN=""
                YELLOW=""
                BLUE=""
                BOLD=""
                RESET=""
        fi
}

setup_color

error() {
        echo ${BOLD}"$(basename $0):${RESET}${RED} Error   --> ${BOLD}$@"${RESET} >&2
}

verbose() {
        if [ "$verbose" = yes ] || [ "$VERBOSE" = yes ] || [ "$v" = yes ] || [ "$V" = yes ]; then
            echo ${BOLD}"$(basename $0):${RESET}${YELLOW} Verbose --> "${BOLD}"$@"${RESET}
        fi
}

debug() {
        if [ "$debug" = yes ] || [ "$DEBUG" = yes ] || [ "$d" = yes ] || [ "$D" = yes ]; then
            echo ${BOLD}"$(basename $0):${RESET}${CYAN} Debug   --> "${BOLD}"$@"${RESET}
        fi
}
write() {
        echo $BOLD"$(basename $0):${RESET} $@"
}

command_exists() {
        command -v "$@" >/dev/null 2>&1
}

beginswith() { case $2 in "$1"*) true;; *) false;; esac; }

checkresult() { if [ $? = 0 ]; then echo TRUE; else echo FALSE; fi; }

exists() { if [ ! -z $1 ]; then true; else false; fi; }

parse_all_params() {
    # Parses all arguments passed to a script or function. The varables do not need to be defined beforehand.
    # 
    # If a `-f` true false switch is passed, a varible named `f` is created and set to `yes`.
    # If a `-f <arg-value>` is passed, a variable named `f` is created and set to `<arg-value>`.
    # The functionality above is equivalent for parameters passed with a `--` prefix. e.g. `--force`
    # 
    # Args:        
    #   $@: Inherent form caller script/function.
    #   --debug : Debug by displaying parameter names and values. 
    # 
    # Returns:     
    #   Dynamic variables based on the name of passed arguments.
    #
    debug "-----Params-----"
    while [ $# -gt 0 ]; do 
        if expr match $1 '--' > /dev/null;then str_rm='--'; elif expr match $1 '-' > /dev/null; then str_rm='-'; fi
        name=${1#$str_rm}
        if expr match $1 '--' > /dev/null || expr match $1 '-' > /dev/null; then
            if exists $2 && ! beginswith '-'; then
                value=$2
                shift
            else
                value=yes
            fi
        # Uncommenting the following two lines will allow passing a switch without a `-` or `--` prefix. This may induce undefined operation.
        #else
            #value=yes
        fi
        
        debug "$name = $value"
        
        IFS= read -r -d '' "$name" <<< $value
        shift
    done 
}

parse_args() {
        while [ $# -gt 0 ]; do
                case $1 in
                        --offline) OFFLINE=yes ;;
                esac
                shift
        done
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
