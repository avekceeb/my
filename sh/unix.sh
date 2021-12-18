
# ps
ps axo pid=,stat=,cmd=

# find all processes in particular state:
ps axo pid=,stat=,cmd= | awk '$2=="Ss" {print $1" "$3}'
