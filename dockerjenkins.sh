cd /home/nareshbabubc/Autodeploy/
docker build -t narezchand/tomcat-7.0:Jenkin${BUILD_NUMBER} .
docker run -i --name jenkins_host${BUILD_NUMBER} -p 8084:8080 narezchand/tomcat-7.0:Jenkin${BUILD_NUMBER} /bin/bash
