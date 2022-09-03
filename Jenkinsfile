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
                  sh "docker run --rm -v $WORKSPACE:/root/.cache/ aquasec/trivy -q image --exit-code 0 --severity CRITICAL --light gcr.io/google-samples/microservices-demo/emailservice:v0.3.9"
               }
               dir('src/cartservice/src/') {
                  sh "docker run --rm -v $WORKSPACE:/root/.cache/ aquasec/trivy:0.31.3  image --exit-code 0 mcr.microsoft.com/dotnet/sdk:7.0.100-preview.7"
                  sh "docker run --rm -v $WORKSPACE:/root/.cache/ aquasec/trivy -q image --exit-code 0 --severity CRITICAL --light gcr.io/google-samples/microservices-demo/cartservice:v0.3.9"
               }
               dir('src/checkoutservice/') {
                  sh "docker run --rm -v $WORKSPACE:/root/.cache/ aquasec/trivy:0.31.3  image --exit-code 0 golang:1.19.0-alpine"
                  sh "docker run --rm -v $WORKSPACE:/root/.cache/ aquasec/trivy -q image --exit-code 0 --severity CRITICAL --light gcr.io/google-samples/microservices-demo/checkoutservice:v0.3.9"
               }
               dir('src/currencyservice/'){
                  sh "docker run --rm -v $WORKSPACE:/root/.cache/ aquasec/trivy:0.31.3  image --exit-code 0 node:18-alpine"
                  sh "docker run --rm -v $WORKSPACE:/root/.cache/ aquasec/trivy -q image --exit-code 0 --severity CRITICAL --light gcr.io/google-samples/microservices-demo/currencyservice:v0.3.9"
               }
               dir('src/emailservice/') {
                  sh "docker run --rm -v $WORKSPACE:/root/.cache/ aquasec/trivy:0.31.3  image --exit-code 0 python:3.9-slim"
                  sh "docker run --rm -v $WORKSPACE:/root/.cache/ aquasec/trivy -q image --exit-code 0 --severity CRITICAL --light gcr.io/google-samples/microservices-demo/emailservice:v0.3.9"
               }
               dir('src/frontend/') {
                  sh "docker run --rm -v $WORKSPACE:/root/.cache/ aquasec/trivy:0.31.3  image --exit-code 0 golang:1.19.0-alpine"
                  sh "docker run --rm -v $WORKSPACE:/root/.cache/ aquasec/trivy -q image --exit-code 0 --severity CRITICAL --light gcr.io/google-samples/microservices-demo/frontend:v0.3.9"
               }
               dir('src/paymentservice/') {
                  sh "docker run --rm -v $WORKSPACE:/root/.cache/ aquasec/trivy:0.31.3  image --exit-code 0 node:18-alpine"
                  sh "docker run --rm -v $WORKSPACE:/root/.cache/ aquasec/trivy -q image --exit-code 0 --severity CRITICAL --light gcr.io/google-samples/microservices-demo/paymentservice:v0.3.9"
               }
               dir('src/productcatalogservice/') {
                  sh "docker run --rm -v $WORKSPACE:/root/.cache/ aquasec/trivy:0.31.3  image --exit-code 0 golang:1.19.0-alpine"
                  sh "docker run --rm -v $WORKSPACE:/root/.cache/ aquasec/trivy -q image --exit-code 0 --severity CRITICAL --light gcr.io/google-samples/microservices-demo/productcatalogservice:v0.3.9"
               }
               dir('src/recommendationservice/') {
                  sh "docker run --rm -v $WORKSPACE:/root/.cache/ aquasec/trivy:0.31.3  image --exit-code 0 python:3.9-slim"
                  sh "docker run --rm -v $WORKSPACE:/root/.cache/ aquasec/trivy -q image --exit-code 0 --severity CRITICAL --light gcr.io/google-samples/microservices-demo/recommendationservice:v0.3.9"
               }
               dir('src/shippingservice/') {
                  sh "docker run --rm -v $WORKSPACE:/root/.cache/ aquasec/trivy:0.31.3  image --exit-code 0 golang:1.19.0-alpine"
                  sh "docker run --rm -v $WORKSPACE:/root/.cache/ aquasec/trivy -q image --exit-code 0 --severity CRITICAL --light gcr.io/google-samples/microservices-demo/shippingservice:v0.3.9"
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
            },
            "OPA conftest k8s manifest scan": {
               dir('kubernetes-manifests/') {
                 sh 'docker run --rm -v $(pwd):/project openpolicyagent/conftest test --policy k8s-tests.rego adservice.yaml'
                 sh 'docker run --rm -v $(pwd):/project openpolicyagent/conftest test --policy k8s-tests.rego cartservice.yaml'
                 sh 'docker run --rm -v $(pwd):/project openpolicyagent/conftest test --policy k8s-tests.rego checkoutservice.yaml'
                 sh 'docker run --rm -v $(pwd):/project openpolicyagent/conftest test --policy k8s-tests.rego currencyservice.yaml'
                 sh 'docker run --rm -v $(pwd):/project openpolicyagent/conftest test --policy k8s-tests.rego emailservice.yaml'
                 sh 'docker run --rm -v $(pwd):/project openpolicyagent/conftest test --policy k8s-tests.rego frontend.yaml'
                 sh 'docker run --rm -v $(pwd):/project openpolicyagent/conftest test --policy k8s-tests.rego paymentservice.yaml'
                 sh 'docker run --rm -v $(pwd):/project openpolicyagent/conftest test --policy k8s-tests.rego productcatalogservice.yaml'
                 sh 'docker run --rm -v $(pwd):/project openpolicyagent/conftest test --policy k8s-tests.rego recommendationservice.yaml'
                 sh 'docker run --rm -v $(pwd):/project openpolicyagent/conftest test --policy k8s-tests.rego redis.yaml'
                 sh 'docker run --rm -v $(pwd):/project openpolicyagent/conftest test --policy k8s-tests.rego shippingservice.yaml'
               }
            }
          )
        }
      }
      stage('Print Application url') {
          steps{
              sh 'INGRESS_HOST="$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.status.loadBalancer.ingress[0].ip}')"'
              sh 'echo "$INGRESS_HOST"'
          }
      }
      stage('Testing application Availability') {
          steps{
              sh 'sleep 500s'
              sh 'curl -v "http://$INGRESS_HOST"'
              sh 'curl -s -o /dev/null -w "%{http_code}" "http://$INGRESS_HOST"'
          }
      }
  }
}