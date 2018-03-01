#!/bin/bash

# Created by argbash-init v2.5.0
# ARG_POSITIONAL_SINGLE([new-version],[The next openscap version string])
# ARGBASH_SET_DELIM([ ])
# ARGBASH_SET_INDENT([    ])
# ARG_OPTION_STACKING([none])
# ARG_RESTRICT_VALUES([none])
# DEFINE_SCRIPT_DIR([])
# ARG_HELP([Push the release commit and the tag to GitHub, then bump the version numbers and push those too.])
# ARGBASH_GO()
# needed because of Argbash --> m4_ignore([
### START OF CODE GENERATED BY Argbash v2.5.0 one line above ###
# Argbash is a bash code generator used to get arguments parsing right.
# Argbash is FREE SOFTWARE, see https://argbash.io for more info

die()
{
    local _ret=$2
    test -n "$_ret" || _ret=1
    test "$_PRINT_HELP" = yes && print_help >&2
    echo "$1" >&2
    exit ${_ret}
}


# THE DEFAULTS INITIALIZATION - POSITIONALS
_positionals=()
# THE DEFAULTS INITIALIZATION - OPTIONALS

print_help ()
{
    printf "%s\n" "Push the release commit and the tag to GitHub, then bump the version numbers and push those too."
    printf 'Usage: %s [-h|--help] <new-version>\n' "$0"
    printf "\t%s\n" "<new-version>: The next openscap version string"
    printf "\t%s\n" "-h,--help: Prints help"
    echo
    echo 'Short options stacking mode is not supported.'
}

parse_commandline ()
{
    while test $# -gt 0
    do
        _key="$1"
        case "$_key" in
            -h|--help)
                print_help
                exit 0
                ;;
            *)
                _positionals+=("$1")
                ;;
        esac
        shift
    done
}


handle_passed_args_count ()
{
    _required_args_string="'new-version'"
    test ${#_positionals[@]} -lt 1 && _PRINT_HELP=yes die "FATAL ERROR: Not enough positional arguments - we require exactly 1 (namely: $_required_args_string), but got only ${#_positionals[@]}." 1
    test ${#_positionals[@]} -gt 1 && _PRINT_HELP=yes die "FATAL ERROR: There were spurious positional arguments --- we expect exactly 1 (namely: $_required_args_string), but got ${#_positionals[@]} (the last one was: '${_positionals[*]: -1}')." 1
}

assign_positional_args ()
{
    _positional_names=('_arg_new_version' )

    for (( ii = 0; ii < ${#_positionals[@]}; ii++))
    do
        eval "${_positional_names[ii]}=\${_positionals[ii]}" || die "Error during argument parsing, possibly an Argbash bug." 1
    done
}

parse_commandline "$@"
handle_passed_args_count
assign_positional_args

# OTHER STUFF GENERATED BY Argbash
script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)" || die "Couldn't determine the script's running directory, which probably matters, bailing out" 2

### END OF CODE GENERATED BY Argbash (sortof) ### ])
# [ <-- needed because of Argbash

. "$script_dir/release.sh"

release_to_git_and_bump_release "$_arg_new_version"

# ] <-- needed because of Argbash