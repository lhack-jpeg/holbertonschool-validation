FROM jenkins/jenkins:lts-jdk11
WORKDIR /module6_task0
COPY . .
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false
COPY --chown=jenkins:jenkins plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN jenkins-plugin-cli -f /usr/share/jenkins/ref/plugins.txt