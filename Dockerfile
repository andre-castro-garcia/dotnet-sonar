#
# Dotnet SDK with Sonar Files
#

# Pull base image.
FROM microsoft/dotnet:sdk

# Define image maintainer
MAINTAINER André Garcia

# Install java.
RUN \
  apt-get update && \
  apt-get -y install openjdk-8-jre

# Define commonly used JAVA_HOME variable
ENV JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-amd64

# Copy sonar folder to image
ADD sonar sonar

# Define permissions and executable sonar file
RUN \
  chmod -R 777 sonar && \
  chmod +x sonar/sonar-scanner-3.1.0.1141/bin/sonar-scanner

# Define default command.
CMD ["bash"]