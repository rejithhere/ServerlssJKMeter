FROM amazonlinux:2018.03

ENV JMETER_VERSION apache-jmeter-4.0
ENV JMETER_HOME /opt/$JMETER_VERSION
ENV PATH $PATH:$JMETER_HOME/bin
ENV CMDRUNNER_VERSION 2.2
ENV PLUGINMGR_VERSION 1.3

ENV TEST_DIR sportsbet
ENV TEST_PLAN myproject

RUN yum update -y && yum install -y \
sudo \ 
java-1.8.0-openjdk \
unzip \
wget \
&& yum clean all

# overridable environment variables
ENV RESULTS_LOG results.jtl
ENV JMETER_FLAGS=
ENV JMETER_MEMORY -XX:+UnlockExperimentalVMOptions -XX:+UseCGroupMemoryLimitForHeap
ENV CUSTOM_PLUGIN_URL=


WORKDIR /opt

RUN curl -O https://archive.apache.org/dist/jmeter/binaries/$JMETER_VERSION.tgz \
  && tar -xvf $JMETER_VERSION.tgz \
  && rm $JMETER_VERSION.tgz \
  && rm -rf $JMETER_VERSION/docs $JMETER_VERSION/printable_docs \
  && cd $JMETER_HOME/lib \
  && curl -O http://search.maven.org/remotecontent?filepath=kg/apc/cmdrunner/$CMDRUNNER_VERSION/cmdrunner-$CMDRUNNER_VERSION.jar \
  && cd $JMETER_HOME/lib/ext \
  && curl -O http://search.maven.org/remotecontent?filepath=kg/apc/jmeter-plugins-manager/$PLUGINMGR_VERSION/jmeter-plugins-manager-$PLUGINMGR_VERSION.jar \
  && java -cp jmeter-plugins-manager-$PLUGINMGR_VERSION.jar org.jmeterplugins.repository.PluginManagerCMDInstaller

# install all available plugins except for those that are deprecated
RUN PluginsManagerCMD.sh install-all-except jpgc-hadoop,jpgc-oauth \
  && sleep 2 \
  && PluginsManagerCMD.sh status

RUN chmod -R 775 /opt/jmeter/

WORKDIR /logs

EXPOSE 1099 50000 51000 4445/udp
