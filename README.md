# Jenkins-pipeline-test
#To automatically run build on code commit, follow these steps:
#1Configuring Jenkins: Jenkins listens for POST requests at a Hook URL. We need to give this URL to the repository on GitHub. Then, whenever code is pushed to that repository, GitHub will send a POST request to the Hook URL and Jenkins will run the build.
#In the ‘Build Triggers’ section, select 'Github hook trigger for GITScm Polling'. 
#or we can select the Poll SCM (* * * * *)
#We have created a Jenkinsfile for pipline 
#we have to duild the war file then create a docker image after that we push the docker image at docker hub and then run the contain at Dev environment
#create a Dockerfile to deploy the war file at tomcat 8
