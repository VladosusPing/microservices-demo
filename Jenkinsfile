pipeline {
  agent any
  stages {
    stage('Build frontend') {
      steps {
        sh '''cd ./src/fronend
docker build -t frontend:latest --no-cache .
'''
      }
    }

  }
}