function _keybase() {
        COMPREPLY=()
        local cur="${COMP_WORDS[COMP_CWORD]}"
        local commands="btc bitcoin cert dir code-sign config decrypt dec encrypt enc help id identify join signup keygen gen generate list-signatures list-sigs list-tracking login logout pull push prove proof reset nuke revoke revoke-signatures revoke-sig search sign sig status switch track untrack unverify update verify version vers"
        COMPREPLY+=($(compgen -W "${commands}" -- ${cur}))
}
complete -o filenames -o "nospace" -F _keybase keybase
