FROM jenkins/jenkins:latest
MAINTAINER Maciej Michalski "maciej.michalsk@gmail.com"
ENV JAVA_OPTS "-Djenkins.install.runSetupWizard=false -Dpermissive-script-security.enabled=true"
COPY plugins /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt
RUN for f in /usr/share/jenkins/ref/plugins/*.jpi; do mv $f $f.override ; done