function fish_user_key_bindings

    # CTRL + F → cari file (fzf + open)
    bind \cf 'set file (fd | fzf); and nvim $file'

    # CTRL + G → git status cepat
    bind \cg 'git status'

    # CTRL + P → pilih folder cepat
    bind \cp 'cd (fd -t d | fzf)'

    # CTRL + H → history search
    bind \ch 'history | fzf'

    # CTRL + K → kill process
    bind \ck 'kill -9 (ps aux | fzf | awk "{print \$2}")'

end
