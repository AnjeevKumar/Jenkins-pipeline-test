pipeline {
  
    agent any
    tools {
        maven 'maven_3_5_0'
    }
    stages {
        stage('Compile stage') {
            steps {
                sh "mvn clean compile"
         }
       }
     
    stage('Docker node test') {
      agent {
        docker {
          image 'node:7-alpine'
          args '--name docker-node' // list any args
        }
      }
      steps {
        // Steps run in node:7-alpine docker container on docker slave
        sh 'node --version'
      }
    }
       stage('Build Docker Image'){
         steps {
              sh 'docker build -t 988080akk/my-pipeline:1.0.0 .'
   }
       }
       stage('Push Docker Image'){
         steps {
     withCredentials([string(credentialsId: 'mydockerhubpasswd', variable: 'mydockerhubpswd')]) {
        sh "docker login -u 988080akk -p ${mydockerhubpswd}"
     }
     sh 'docker push 988080akk/my-pipeline:1.0.0'
   }
       }
    stage('Run Container on Dev Server'){
         steps {
     def dockerRun = 'docker run -p 8080:8080 -d --name my-app 988080akk/my-pipeline:1.0.0'
     sshagent(['dev-server']) {
       sh "ssh -o StrictHostKeyChecking=no jenkins-job@172.0.0.2 ${dockerRun}"
     }
   }
       }
          stage('deployment stage') {
              steps {
                sh "mvn deploy"
        }
    }

  }

}
