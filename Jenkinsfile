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
                  sh "docker run --rm -v $WORKSPACE:/root/.cache/ aquasec/trivy:0.31.3  image --exit-code 0 openjdk:18-slim"
               }
               dir('src/cartservice/src/') {
                  sh "docker run --rm -v $WORKSPACE:/root/.cache/ aquasec/trivy:0.31.3  image --exit-code 0 mcr.microsoft.com/dotnet/sdk:7.0.100-preview.7"
               }
               dir('src/checkoutservice/') {
                  sh "docker run --rm -v $WORKSPACE:/root/.cache/ aquasec/trivy:0.31.3  image --exit-code 0 golang:1.19.0-alpine"
               }
               dir('src/currencyservice/'){
                  sh "docker run --rm -v $WORKSPACE:/root/.cache/ aquasec/trivy:0.31.3  image --exit-code 0 node:18-alpine"
               }
               dir('src/emailservice/') {
                  sh "docker run --rm -v $WORKSPACE:/root/.cache/ aquasec/trivy:0.31.3  image --exit-code 0 python:3.9-slim"
               }
               dir('src/frontend/') {
                  sh "docker run --rm -v $WORKSPACE:/root/.cache/ aquasec/trivy:0.31.3  image --exit-code 0 golang:1.19.0-alpine"
               }
               dir('src/paymentservice/') {
                  sh "docker run --rm -v $WORKSPACE:/root/.cache/ aquasec/trivy:0.31.3  image --exit-code 0 node:18-alpine"
               }
               dir('src/productcatalogservice/') {
                  sh "docker run --rm -v $WORKSPACE:/root/.cache/ aquasec/trivy:0.31.3  image --exit-code 0 golang:1.19.0-alpine"
               }
               dir('src/recommendationservice/') {
                  sh "docker run --rm -v $WORKSPACE:/root/.cache/ aquasec/trivy:0.31.3  image --exit-code 0 python:3.9-slim"
               }
               dir('src/shippingservice/') {
                  sh "docker run --rm -v $WORKSPACE:/root/.cache/ aquasec/trivy:0.31.3  image --exit-code 0 golang:1.19.0-alpine"
               }
            },
            "OPA Conftest": {
               dir('src/adservice') {
                  sh 'docker run --rm -v $(pwd):/project openpolicyagent/conftest test --policy opa-docker-security.rego Dockerfile'
               }
               dir('src/cartservice/src/') {
                  sh 'docker run --rm -v $(pwd):/project openpolicyagent/conftest test --policy opa-docker-security.rego Dockerfile'
               }
               dir('src/checkoutservice/') {
                  sh 'docker run --rm -v $(pwd):/project openpolicyagent/conftest test --policy opa-docker-security.rego Dockerfile'
               }
               dir('src/currencyservice/'){
                  sh 'docker run --rm -v $(pwd):/project openpolicyagent/conftest test --policy opa-docker-security.rego Dockerfile'
               }
               dir('src/emailservice/') {
                  sh 'docker run --rm -v $(pwd):/project openpolicyagent/conftest test --policy opa-docker-security.rego Dockerfile'
               }
               dir('src/frontend/') {
                  sh 'docker run --rm -v $(pwd):/project openpolicyagent/conftest test --policy opa-docker-security.rego Dockerfile'
               }
               dir('src/paymentservice/') {
                  sh 'docker run --rm -v $(pwd):/project openpolicyagent/conftest test --policy opa-docker-security.rego Dockerfile'
               }
               dir('src/productcatalogservice/') {
                  sh 'docker run --rm -v $(pwd):/project openpolicyagent/conftest test --policy opa-docker-security.rego Dockerfile'
               }
               dir('src/recommendationservice/') {
                  sh 'docker run --rm -v $(pwd):/project openpolicyagent/conftest test --policy opa-docker-security.rego Dockerfile'
               }
               dir('src/shippingservice/') {
                  sh 'docker run --rm -v $(pwd):/project openpolicyagent/conftest test --policy opa-docker-security.rego Dockerfile'
               }
            }
          )
        }
      }
  }
}