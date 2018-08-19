function fish_prompt --description 'Write out the prompt'
    set -l color_cwd
    set -l suffix
    switch "$USER"
        case root toor
            if set -q fish_color_cwd_root
                set color_cwd $fish_color_cwd_root
            else
                set color_cwd $fish_color_cwd
            end
            set suffix '#'
        case '*'
            set color_cwd $fish_color_cwd
            set suffix '>'
    end

    echo -n -s (set_color -o white) [(date +%H:%M:%S)] ' ' (set_color -o $color_cwd) "$USER" (set_color -o red) ♖  ' ' (set_color -o yellow) (prompt_hostname) ' ' (set_color -o blue) (prompt_pwd) (set_color -o purple) (__fish_git_prompt) ' ' (set_color -o white) "$suffix " (set_color normal)
end

# Implemented fasd ergonomics
alias a='fasd -a'
alias s='fasd -si'
alias sd='fasd -sid'
alias sf='fasd -sif'
alias d='fasd -d'
alias f='fasd -f'
function fasd_cd3 -d "fasd builtin cd"
  if test (count $argv) -le 1
    command fasd "$argv"
  else
    set -l ret (command fasd -e 'printf %s' $argv)
    test -z "$ret"; and return
    test -d "$ret"; and cd "$ret"; or printf "%s\n" $ret
  end
end
function fasd_cd
  if [ (count $argv) -le 1 ]
    fasd "$argv"
  else
    set -l _fasd_ret (fasd -e 'printf %s' $argv)
    [ -z "$_fasd_ret" ]; and return
    [ -d "$_fasd_ret" ]; and cd "$_fasd_ret"; or printf "%s\n" $_fasd_ret
  end
end
alias z='fasd_cd -d'
alias zz='fasd_cd -d -i'
