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
              sh 'docker build -t 988080akk/my-pipeline:2.0.0 .'
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
