function _keybase() {
        local cur prev words cword split
        _init_completion -s || return

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
                                return 0
                                ;;
                        logout)
                                return 0
                                ;;
                        status)
                                case $cur in
                                        -*)
                                                COMPREPLY+=($(compgen -W '-T --text' -- ${cur}))
                                                ;;
                                esac
                                return 0
                                ;;
                        update)
                                case $prev in
                                        -n|--npm)
                                                _filedir
                                                return 0
                                                ;;
                                        -u|--url)
                                                return 0
                                                ;;
                                        -c|--cmd)
                                                return 0
                                                ;;
                                        -p|--prefix)
                                                _filedir -d
                                                return 0
                                                ;;
                                esac
                                case $cur in
                                        -*)
                                                COMPREPLY+=($(compgen -W '-n --npm -u --url -C --skip-cleanup -c --cmd -p --prefix -g --global' -- ${cur}))
                                                ;;
                                esac
                                return 0
                                ;;
                esac
        else
                COMPREPLY+=($(compgen -W "${commands}" -- ${cur}))
        fi
}
complete -o nospace -F _keybase keybase

# vim: set et:
