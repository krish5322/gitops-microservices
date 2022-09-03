pipeline {
  agent {
      label 'azure'
  }
  stages {
      stage('SonarQube -SAST') {
          steps {
              parallel(
                    "Invoice-Service-SAST": {
                       withSonarQubeEnv('sonar-server2') {
                         dir('src/adservice') {
                            sh './gradlew sonar:sonar'
                         }
                       }
                    },
                    "Notification-Service-SAST": {
                       withSonarQubeEnv('sonar-server2') {
                         dir('src/cartservice') {
                            sh 'mvn sonar:sonar'
                         }
                       }
                    },
                    "Product-Service-SAST": {
                       withSonarQubeEnv('sonar-server2') {
                         dir('src/checkoutservice') {
                            sh 'mvn sonar:sonar'
                         }
                       }
                    },
                    "Store-Service-SAST": {
                       withSonarQubeEnv('sonar-server2') {
                         dir('src/currencyservice') {
                            sh 'mvn sonar:sonar'
                         }
                       }
                    }
              )
          }
      }
  }
}