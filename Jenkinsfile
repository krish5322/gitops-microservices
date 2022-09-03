pipeline {
  agent {
      label 'azure'
  }
  stages {
      stage('vulnerability Scan - Docker') {
        steps {
          parallel(
            "Trivy Scan": {
               dir('src/adservice') {
                  sh "docker run --rm -v $WORKSPACE:/root/.cache/ aquasec/trivy:0.31.3  image openjdk:18-slim"
               }
               dir('src/cartservice/src/') {
                  sh "docker run --rm -v $WORKSPACE:/root/.cache/ aquasec/trivy:0.31.3  imagemcr.microsoft.com/dotnet/sdk:7.0.100-preview.7"
               }
               dir('src/checkoutservice/') {
                  sh "docker run --rm -v $WORKSPACE:/root/.cache/ aquasec/trivy:0.31.3  image golang:1.19.0-alpine"
               }
               dir('src/currencyservice/'){
                  sh "docker run --rm -v $WORKSPACE:/root/.cache/ aquasec/trivy:0.31.3  image node:18-alpine"
               }
               dir('src/emailservice/') {
                  sh "docker run --rm -v $WORKSPACE:/root/.cache/ aquasec/trivy:0.31.3  image python:3.9-slim"
               }
               dir('src/frontend/') {
                  sh "docker run --rm -v $WORKSPACE:/root/.cache/ aquasec/trivy:0.31.3  image golang:1.19.0-alpine"
               }
               dir('src/paymentservice/') {
                  sh "docker run --rm -v $WORKSPACE:/root/.cache/ aquasec/trivy:0.31.3  image node:18-alpine"
               }
               dir('src/productcatalogservice/') {
                  sh "docker run --rm -v $WORKSPACE:/root/.cache/ aquasec/trivy:0.31.3  image golang:1.19.0-alpine"
               }
               dir('src/recommendationservice/') {
                  sh "docker run --rm -v $WORKSPACE:/root/.cache/ aquasec/trivy:0.31.3  image python:3.9-slim"
               }
            },
            "OPA Conftest": {
               dir('invoice/') {
                  sh 'docker run --rm -v $(pwd):/project openpolicyagent/conftest test --policy opa-docker-security.rego Dockerfile'
               }
            }
          )
        }
      }
  }
}