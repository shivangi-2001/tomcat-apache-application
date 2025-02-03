#!/bin/bash

# Update packages and install Java
sudo apt update
sudo apt install openjdk-11-jdk -y

# Create tomcat user and group
sudo groupadd tomcat
sudo useradd -g tomcat -d /opt/tomcat -s /bin/false tomcat

# Create tomcat directory and set permissions
sudo mkdir -p /opt/tomcat
cd /opt
sudo chown -R tomcat:tomcat tomcat

# Download and extract Apache Tomcat
sudo wget https://dlcdn.apache.org/tomcat/tomcat-10/v10.1.34/bin/apache-tomcat-10.1.34.tar.gz
sudo tar -xvf apache-tomcat-10.1.34.tar.gz -C /opt/tomcat --strip-components=1

# Set proper permissions for Tomcat
cd /opt/tomcat
sudo chown -R tomcat:tomcat *

# Remove existing service file if it exists
sudo rm -f /etc/systemd/system/tomcat.service

# Create a new systemd service file for Tomcat
sudo bash -c 'cat <<EOT > /etc/systemd/system/tomcat.service
[Unit]
Description=Apache Tomcat 10 Web Application Server
After=network.target

[Service]
Type=forking
User=tomcat
Group=tomcat

Environment="JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64"
Environment="CATALINA_HOME=/opt/tomcat"
Environment="CATALINA_BASE=/opt/tomcat"
Environment="CATALINA_PID=/opt/tomcat/temp/tomcat.pid"
Environment="CATALINA_OPTS=-Xms512M -Xmx1024M -server -XX:+UseParallelGC"

ExecStart=/opt/tomcat/bin/startup.sh
ExecStop=/opt/tomcat/bin/shutdown.sh

[Install]
WantedBy=multi-user.target
EOT'

# Reload systemd daemon
sudo systemctl daemon-reload

# Ensure correct permissions
sudo chown -R tomcat:tomcat /opt/tomcat/work
sudo chmod -R 755 /opt/tomcat/work

# Start and enable Tomcat service
sudo systemctl start tomcat
sudo systemctl enable tomcat

# Deploy sample application
cd /tmp
sudo wget https://tomcat.apache.org/tomcat-6.0-doc/appdev/sample/sample.war
sudo cp sample.war /opt/tomcat/webapps/
cd /opt/tomcat/webapps
sudo chown tomcat:tomcat sample.war

# Restart Tomcat service
sudo systemctl restart tomcat
