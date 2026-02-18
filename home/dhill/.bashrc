# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

alias rd='rdesktop -g1920x1024 -u"davidchill@hotmail.com" -p"79Alaska97!!" 192.168.1.22'
alias rdl='rdesktop -g1920x1024 -u"davidchill@hotmail.com" -p"79Alaska97!!" 127.0.0.1'
alias ssb='ssh supportshellbeta.usersys.redhat.com'
alias myosp='ssh root@10.10.179.89'
alias ssc='ssh -p 2111 pickle@sg1.wadmbx.com'
alias sshtlv='ssh -i ~/.ssh/id_rsa.TLV root@gss05.lab.eng.tlv2.redhat.com'
alias tlvlab="ssh tlvlab@rhosp-1.cee.lab.eng.rdu2.redhat.com -t tmux a -t tlvlab"
alias rhosolab='ssh admin@gss01.lab.eng.tlv2.redhat.com'
alias sshtlv1='ssh -i ~/.ssh/id_rsa.TLV roo@rhosp-1.cee.lab.eng.rdu2.redhat.com'
#alias ss='ssh supportshell.prod.useraccess-us-west-2.redhat.com'
alias ss='ssh supportshell-1.sush-001.prod.us-west-2.aws.redhat.com'
alias sse='ssh supportshell-1.sush-001.prod.eu-central-1.aws.redhat.com'
#alias ss='ssh supportshell.cee.redhat.com'
alias sss='ssh secure-support-1.sush-001.prod.us-west-2.aws.redhat.com'
alias cs='ssh collab-shell.usersys.redhat.com'
alias ssm='ssh -L 127.0.0.1:3389:192.168.1.22:3389 montcalm.dyndns.org'
alias als='aplay -D hw:1,3 /usr/share/sounds/alsa/Noise.wav'
#alias bumble='ssh bumble@10.10.84.250'
alias bumble='ssh fedora@10.0.116.98'
#alias robotnik='ssh fedora@10.0.76.126'
alias robotnik='ssh fedora@10.0.116.80'
alias psi='ssh stack@director.rhos-01.prod.psi.rdu2.redhat.com'
alias myosp='ssh root@10.10.179.89'
alias rhospbl-6='ssh root@10.10.179.87' # 17.1.6 ocp/ospdo
alias rhospbl-1='ssh root@10.10.179.82' # rhosp17.1.6
alias rhosp-4='ssh root@10.8.222.29' # rhosp16.2
