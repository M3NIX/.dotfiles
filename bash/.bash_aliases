### aliases ###

# editor
alias vim="nvim"
alias vimdiff='nvim -d'
export EDITOR=nvim

# some ls aliases
alias l='ls -CF'
alias la='ls -A'
alias ll='ls -lF --group-directories-first'

# improve common commands
alias ..='cd ..'
alias mkdir='mkdir -pv'
alias wget="wget -c"
alias hs='h | grep $1'

# some new useful commands
alias x="extract"
alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'
alias cpwd="pwd | tr -d '\n' | pbcopy && echo 'pwd copied to clipboard'"
alias clp2qr="xclip -o -s c | qrencode -o - | feh --force-aliasing -ZF -" # convert clipboard to qr code
alias fc="grep -HiRn $1" #find content
alias ff="grep -iRl $1" # find file
alias b16="~/.base16/base16-update.sh" # base16 theme updater
alias pipi="python3 -m pip install --user" # install pip package as user
alias tf="terraform"
alias ssh-unlock="ssh-add ~/.ssh/id_ed25519"
alias ssh-lock="ssh-add -d"
alias decolor='sed -r "s/\x1B\[([0-9]{1,3}(;[0-9]{1,2})?)?[mGK]//g"'

alias vup="pactl set-sink-volume @DEFAULT_SINK@ +10%" # volume up
alias vdown="pactl set-sink-volume @DEFAULT_SINK@ -10%" # volume down
alias vmute="pactl set-sink-mute @DEFAULT_SINK@ toggle" # volume mute toggle

### functions ###

# get current branch in git repo
function parse_git_branch() {
	BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
	if [ ! "${BRANCH}" == "" ]
	then
		echo "[${BRANCH}]"
		else
		echo ""
	fi
}

function parse_terraform_workspace() {
	TF_WORKSPACE=`terraform workspace show`
	if [[ -f /usr/bin/terraform ]];then
		if [ ! "${TF_WORKSPACE}" == "default" ]
		then
	  	echo "[$TF_WORKSPACE]"
		else
			echo ""
		fi
	fi
}

# use bat for syntax highlighting
function cat {
  if [[ -f /usr/bin/bat ]];then
    /usr/bin/bat --theme base16 "$@"
  else
    /bin/cat "$@"
  fi
}

# copy content of file in clipboard without displaying it
clipfile() {
    xsel -b < $1
    echo "Copied content of $1 to the clipboard"
}

# extract archives
function extract {
 if [ -z "$1" ]; then
    # display usage if no parameters given
    echo "Usage: extract [-r] <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
    echo "       extract [-r] <path/file_name_1.ext> [path/file_name_2.ext] [path/file_name_3.ext]"
    return 1
 else
    local remove_archive
    remove_archive=1
    if [[ "$1" == "-r" ]] || [[ "$1" == "--remove" ]]; then
    remove_archive=0
    shift
    fi
    for n in $@
    do
      if [ -f "$n" ] ; then
          case "${n%,}" in
            *.tar.bz2|*.tar.gz|*.tar.xz|*.tbz2|*.tgz|*.txz|*.tar)
                         tar xvf "$n"       ;;
            *.lzma)      unlzma ./"$n"      ;;
            *.bz2)       bunzip2 ./"$n"     ;;
            *.rar)       unrar x -ad ./"$n" ;;
            *.gz)        gunzip ./"$n"      ;;
            *.zip)       unzip ./"$n"       ;;
            *.z)         uncompress ./"$n"  ;;
            *.7z|*.arj|*.cab|*.chm|*.deb|*.dmg|*.iso|*.lzh|*.msi|*.rpm|*.udf|*.wim|*.xar)
                         7z x ./"$n"        ;;
            *.xz)        unxz ./"$n"        ;;
            *.exe)       cabextract ./"$n"  ;;
            *)
                         echo "extract: '$n' - unknown archive method"
                         return 1
                         ;;
          esac
      (( $remove_archive == 0 )) && rm "$n"
      else
          echo "'$n' - file does not exist"
          return 1
      fi
    done
fi
}

function aws_export {
	read -p "AWS_ACCESS_KEY_ID: " AWS_ACCESS_KEY_ID
	export AWS_ACCESS_KEY_ID="$AWS_ACCESS_KEY_ID"
  read -p "AWS_SECRET_ACCESS_KEY: "  -s AWS_SECRET_ACCESS_KEY
	export AWS_SECRET_ACCESS_KEY="$AWS_SECRET_ACCESS_KEY"
}
