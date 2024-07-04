export JAVA_HOME=`echo $(dirname $(readlink $(readlink $(which java)))) | sed -e 's/\/bin$//g' | sed -e 's/\/jre$//g'`
