#!/bin/sh
warfilelocation=/opt/jetbrains/TeamCity/buildAgent/work/5b194d8dccb89f70/dist/Naukri.war
Dockerimage=narezchand/teamcity_$1:latest
Dockerfile=/home/nareshbabubc/Dockertest/
#cd /root/Desktop/Docker
cd $Dockerfile
cp $warfilelocation $Dockerfile
#sudo docker stop teamcity
sudo docker ps -a | grep 'teamcity'| awk '{print $1}' | xargs --no-run-if-empty docker stop
sudo docker build -t $Dockerimage .
sudo docker run --name=teamcity_$1 -dit -p 8088:8080 $Dockerimage
