#####################################
# Dev Environment
#####################################

set fish_greeting

if type -q mise
    mise activate fish | source
end

#####################################
# Shell Prompt
#####################################
if type -q starship
    starship init fish | source
end

#####################################
# Tools
#####################################
if type -q yazi
    set -gx YAZI_IMAGE_BACKEND ueberzug
end

#####################################
# Node (optional)
#####################################
if type -q nvm
    set -gx nvm_default_version 18
end

if status is-interactive; and type -q pokemon-colorscripts
    pokemon-colorscripts --no-title -s -r 1,3,6
end
