
# Set useful aliases
alias ..='cd ..'
alias cd..='..'
alias ls='ls -FG'
alias ll='ls -hl'
alias la='ls -A'
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -iv'
alias nuke='rm -rf'
alias quit='exit'



# Correct spelling errors of a directory component in cd commands
shopt -s cdspell

# Check the window size after each command and update it if necessary
shopt -s checkwinsize

# Include filenames beginning with a dot in the results of their expansion
shopt -s dotglob

# Match filenames case-insensitively when performing file name expansions
shopt -s nocaseglob

# Store multi-line commands into one history entry
shopt -s cmdhist

# Append to history when the shell exits rather than overwriting it
shopt -s histappend



# Ignore spaces, dups, commands and format the history output
HISTCONTROL='ignoreboth'
HISTIGNORE='clear:exit:history*:man*:help*:info*:* --help'
HISTTIMEFORMAT='%F %T '



# Value executed as a command prior to issuing each primary prompt
PROMPT_COMMAND=${PROMPT_COMMAND:+"$PROMPT_COMMAND; "}'history -a; history -c; history -r'

# Primary interactive prompt
PS1='[\[\033[1;35m\]\w\[\033[0m\]]: '

# Secondary interactive prompt, used in multi-line commands
PS2='\[\033[1;34m\]next\[\033[0m\]> '



# Go to the given path, create directories as needed
jump() {

    [[ "${#}" = 1 ]] || {
        echo 'Usage: jump PATH'
        echo 'Jump to the given PATH, create directories as required'
        return 1
    }

    [[ -n "${1}" ]] && mkdir -p "${1}"
    cd -- "${1}"
}

# Create or update the symbolic links
symlink() {

    [[ "${#}" = 2 ]] || {
        echo 'Usage: symlink SOURCE TARGET'
        echo 'Create or update the symbolic link between SOURCE and TARGET'
        return 1
    }

    local source="${1}"
    local target="${2}"

    ln -sf "${source}" "${target}"
}