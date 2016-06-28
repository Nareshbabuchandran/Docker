#!bin/sh
warfilelocation=/var/lib/jenkins/workspace/Autodeploy/dist/Naukri.war;
Dockerimage=narezchand/autodeploy:latest
Dockerfile=/home/nareshbabubc/Autodeploy/
cp $warfilelocation $Dockerfile
sudo docker stop autodeploy
sudo docker ps -a | grep 'autodeploy'| awk '{print $1}' | xargs --no-run-if-empty docker rm
sudo docker build -t $Dockerimage .
sudo docker run --name=autodeploy -dit -p 8082:8080 $Dockerimage 

