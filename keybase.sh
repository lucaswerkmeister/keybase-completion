# vim: set et:
function _keybase() {
        COMPREPLY=()
        local cur="${COMP_WORDS[COMP_CWORD]}"
        local commands="btc bitcoin cert dir code-sign config decrypt dec encrypt enc help id identify join signup keygen gen generate list-signatures list-sigs list-tracking login logout pull push prove proof reset nuke revoke revoke-signatures revoke-sig search sign sig status switch track untrack unverify update verify version vers"
        if [[ $COMP_CWORD -gt 1 ]]; then
                case "${COMP_WORDS[1]}" in
                        vers|version)
                                return 0
                                ;;
                        help)
                                if [[ $COMP_CWORD -gt 2 ]]; then
                                        return 0;
                                fi
                                COMPREPLY+=($(compgen -W "$commands" -- ${cur}))
                                ;;
                        login)
                                case $cur in
                                        -*)
                                                COMPREPLY+=($(compgen -W '-P --no-key-pull' -- ${cur}))
                                                ;;
                                esac
                                ;;
                esac
        else
                COMPREPLY+=($(compgen -W "${commands}" -- ${cur}))
        fi
}
complete -o filenames -o "nospace" -F _keybase keybase
