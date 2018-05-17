#!/usr/bin/env sh

#!/usr/bin/env sh

version=$(rec_control version)
echo "anyqast-pdns-recursor-servermetrics,host=${HOSTNAME},version=${version} "$(rec_control get-all | awk '{print $1"="$2}' | tr '\n' ',' | head -c-1)
rec_control get-qtypelist | awk "-vhostname=${HOSTNAME}" "-vversion=${version}" '{print "anyqast-pdns-recursor-servermetrics,host="hostname",version="version",qtype="$1" value="$2"i"}'
