#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

eval $(ssh-agent)
ssh-add -t 6h ~/.ssh/id_rsa
