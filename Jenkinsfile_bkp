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
       stage('Build Docker Image'){
              sh 'docker build -t 988080akk/my-pipeline:1.0.0 .'
   }
       stage('Push Docker Image'){
     withCredentials([string(credentialsId: 'mydockerhubpasswd', variable: 'mydockerhubpswd')]) {
        sh "docker login -u 988080akk -p ${mydockerhubpswd}"
     }
     sh 'docker push 988080akk/my-pipeline:1.0.0'
   }
          stage('deployment stage') {
              steps {
                sh "mvn deploy"
        }
    }

  }

}
