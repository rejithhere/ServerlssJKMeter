#!/bin/bash
#
set -e
freeMem=`awk '/MemFree/ { print int($2/1024) }' /proc/meminfo`
s=$(($freeMem/10*8))
x=$(($freeMem/10*8))
n=$(($freeMem/10*2))
export JVM_ARGS="-Xmn${n}m -Xms${s}m -Xmx${x}m"

echo "START Running Jmeter on `date`"
echo "JVM_ARGS=${JVM_ARGS}"
echo "jmeter args=$@"

#git clone https://github.com/rejithhere/ServerlssJKMeter.git
#cd ServerlssJKMeter/Dockerfiles

# Keep entrypoint simple: we must pass the standard JMeter arguments
jmeter -n \
    -t "/opt/jmeter/jmx/myproject.jmx" \
    -l "/tmp/myprj.jtl"

#exec tail -f jmeter.log
#    -D "java.rmi.server.hostname=${IP}" \
#    -D "client.rmi.localport=${RMI_PORT}" \
#  -R $REMOTE_HOSTS


