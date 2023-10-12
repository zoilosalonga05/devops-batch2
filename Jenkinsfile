pipeline {
  agent any 
  options {
    buildDiscarder(logRotator(numToKeepStr: '5'))
  }
  environment {
    DOCKERHUB_CREDENTIALS = credentials('dockerhub')
  }
  stages {
    stage('Build') {
      steps {
        sh 'docker build -t zsalonga/batch2:mynginx .'
      }
    }
    stage(' Login') {
      steps {
        sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
      }
    }
    stage('Push') {
      steps {
        sh 'docker push zsalonga/batch2:latest'
      }
    }
    stage('Deploy') {
            steps {
              script {
                   sh "docker run -d -p 8081:80 mynginx  "
                }
              }
            }
        }
    }
