FROM tomcat:8
LABEL name="Anjeev Kumar"
LABEL email="anjeev0207002raj@gmail.com"
#taking the backup of war file
# Take the war and copy to webapps of tomcat
COPY target/*.war /opt/tomcat/webapps/myweb.war
RUN /script.sh
