function _keybase_assertion() {
    return 0
}

function _keybase_tracked() {
    return 0
}

function _keybase() {
    local cur prev
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    
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
            join|signup)
                return 0
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
            switch)
                case $cur in
                    -*)
                        COMPREPLY+=($(compgen -W '-f --force' -- ${cur}))
                        ;;
                esac
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
            list-sigs|list-signatures)
                case $prev in
                    -t|--type)
                        COMPREPLY+=($(compgen -W 'track proof currency self' -- ${cur}))
                        return 0
                        ;;
                esac
                case $cur in
                    -*)
                        COMPREPLY+=($(compgen -W '-r --revoked -v --verbose -j --json -t --type' -- ${cur}))
                        ;;
                esac
                return 0
                ;;
            id|identify)
                case $prev in
                    -a|--assert)
                        _keybase_assertion
                        return 0
                        ;;
                esac
                case $cur in
                    -*)
                        COMPREPLY+=($(compgen -W '-a --assert' -- ${cur}))
                        ;;
                esac
                return 0
                ;;
            sig|sign)
                case $prev in
                    -m|--message)
                        return 0
                        ;;
                    -o|--output)
                        _filedir
                        return 0
                        ;;
                esac
                case $cur in
                    -*)
                        COMPREPLY+=($(compgen -W '-m --message -b --binary --clearsign --detach-sign -o --output' -- ${cur}))
                        return 0
                        ;;
                    *)
                        _filedir
                        return 0
                        ;;
                esac
                return 0
                ;;
            pull)
                case $cur in
                    -*)
                        COMPREPLY+=($(compgen -W '-f --force' -- ${cur}))
                        ;;
                esac
                return 0
                ;;
            push)
                case $cur in
                    -*)
                        COMPREPLY+=($(compgen -W '-g --gen -p --show-public-only-keys --skip-add-email --add-email -s --secret -u --update' -- ${cur}))
                        ;;
                esac
                return 0
                ;;
            gen)
                case $cur in
                    -*)
                        COMPREPLY+=($(compgen -W '-p --push -s --secret -u --update' -- ${cur}))
                        ;;
                esac
                return 0
                ;;
            cert)
                case $cur in
                    -*)
                        COMPREPLY+=($(compgen -W '-a --all' -- ${cur}))
                        ;;
                esac
                return 0
                ;;
            btc|bitcoin)
                case $cur in
                    -*)
                        COMPREPLY+=($(compgen -W '-f --force' -- ${cur}))
                        ;;
                esac
                return 0
                ;;
            reset|nuke)
                case $cur in
                    -*)
                        COMPREPLY+=($(compgen -W '-f --force' -- ${cur}))
                        ;;
                esac
                return 0
                ;;
            list-tracking)
                case $cur in
                    -*)
                        COMPREPLY+=($(compgen -W '-v --verbose -j --json' -- ${cur}))
                        ;;
                esac
                return 0
                ;;
            verify)
                case $prev in
                    -a|--asert)
                        _keybase_assertion
                        return 0
                        ;;
                    -S|--signed-by)
                        _keybase_tracked
                        return 0
                        ;;
                    -m|--message)
                        return 0
                        ;;
                esac
                case $cur in
                    -*)
                        COMPREPLY+=($(compgen -W '-6 --base64 -r --track-remote -l --track-local -a --assert --bastch --promt-remote -t --track -I --no-id -s --signed -S --signed-by -m --message' -- ${cur}))
                        ;;
                    *)
                        _filedir
                        ;;
                esac
                return 0
                ;;
            unverify)
                case $cur in
                    -*)
                        COMPREPLY+=($(compgen -W '-k --remove-key -b --batch -K --keep-key' -- ${cur}))
                        ;;
                esac
                return 0
                ;;
            track)
                case $prev in
                    -a|--assert)
                        _keybase_assertion
                        return 0
                        ;;
                esac
                case $cur in
                    -*)
                        COMPREPLY+=($(compgen -W '-r --track-remote -l --track-local -a --asert --batch --prompt-remote' -- ${cur}))
                        ;;
                esac
                return 0
                ;;
            untrack)
                case $cur in
                    -*)
                        COMPREPLY+=($(compgen -W '-k --remove-key -b --batch -K --keep-key' -- ${cur}))
                        ;;
                esac
                return 0
                ;;
            revoke)
                case $cur in
                    -*)
                        COMPREPLY+=($(compgen -W '-f --force' -- ${cur}))
                        ;;
                esac
                return 0
                ;;
            revoke-sig|revoke-signatures)
                case $cur in
                    -*)
                        COMPREPLY+=($(compgen -W '-q --seqno' -- ${cur}))
                        ;;
                esac
                return 0
                ;;
            search)
                case $cur in
                    -*)
                        COMPREPLY+=($(compgen -W '-v --verbose -j --json' -- ${cur}))
                        ;;
                esac
                return 0
                ;;
            prove|proof)
                case $prev in
                    -o|--output)
                        _filedir
                        return 0
                        ;;
                    twitter|github|web|dns|reddit|coinbase|hackernews)
                        return 0
                        ;;
                esac
                case $cur in
                    -*)
                        COMPREPLY+=($(compgen -W '-f --force -o --output' -- ${cur}))
                        ;;
                    *)
                        COMPREPLY+=($(compgen -W 'twitter github web dns rediit coinbase hackernews' -- ${cur}))
                        ;;
                esac
                return 0
                ;;
            enc|encrypt)
                case $prev in
                    -a|--assert)
                        _keybase_assertion
                        return 0
                        ;;
                    -m|--message)
                        return 0
                        ;;
                    -o|--output)
                        _filedir
                        return 0
                        ;;
                esac
                case $cur in
                    -*)
                        COMPREPLY+=($(compgen -W '-r --track-remote -l --track-local -a --assert --batch --prompt-remote -s --sign -m --message -b --binary -o --output' -- ${cur}))
                        ;;
                esac
                return 0
                ;;
            dec|decrypt)
                case $prev in
                    -a|--assert)
                        _keybase_assertion
                        return 0
                        ;;
                    -S|--signed-by)
                        _keybase_tracked
                        return 0
                        ;;
                    -m|--message)
                        return 0
                        ;;
                    -o|--output)
                        _filedir
                        return 0
                        ;;
                esac
                case $cur in
                    -*)
                        COMPREPLY+=($(compgen -W '-6 --base64 -r --track-remote -l --track-local -a --assert --batch --prompt-remote -t --track -I --no-id -s --signed -S --signed-by -m --message -o --output' -- ${cur}))
                        ;;
                    *)
                        _filedir
                        ;;
                esac
                return 0
                ;;
            config)
                case $prev in
                    --get)
                        return 0
                        ;;
                    -s|--server)
                        return 0
                        ;;
                esac
                case $cur in
                    -*)
                        COMPREPLY+=($(compgen -W '--get -j --json --pretty -s --server -S --reset-server' -- ${cur}))
                        ;;
                esac
                return 0
                ;;
            dir|code-sign)
                if [[ $COMP_CWORD -gt 2 ]]; then
                    case "${COMP_WORDS[2]}" in
                        sign)
                            case $prev in
                                -o|--output)
                                    _filedir
                                    return 0
                                    ;;
                                -p|--presets)
                                    return 0
                                    ;;
                            esac
                            case $cur in
                                -*)
                                    COMPREPLY+=($(compgen -W '-o --output -p --presets -q --quiet' -- ${cur}))
                                    ;;
                                *)
                                    _filedir -d
                                    ;;
                            esac
                            ;;
                        verify)
                            case $prev in
                                -i|--input)
                                    _filedir
                                    return 0
                                    ;;
                                -a|--assert)
                                    _keybase_assertion
                                    return 0
                                    ;;
                            esac
                            case $cur in
                                -*)
                                    COMPREPLY+=($(compgen -W '-i --input -q --quiet -s --strict -P --preserve-tmp-files --ignore-verify-errors -r --track-remotes -l --track-local -a --assert --batch --prompt-remote -t --track -I --no-id' -- ${cur}))
                                    ;;
                                *)
                                    _filedir -d
                                    ;;
                            esac
                            ;;
                    esac
                else
                    COMPREPLY+=($(compgen -W 'sign verify' -- ${cur}))
                fi
                ;;
        esac
    else
        COMPREPLY+=($(compgen -W "${commands}" -- ${cur}))
    fi
}
complete -F _keybase keybase

# vim: set ts=4 sw=4 et:
