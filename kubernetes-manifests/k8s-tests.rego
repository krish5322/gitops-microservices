package main

deny[msg] {
   input.kind = "service"
   not input.spec.type = "ClusterIP"
   msg = "Service type should be ClusterIP"
}

deny[msg] {
   input.kind = "Deployment"
   not exists(input.spec.template.spec.containers[0].resources)
   msg = "Containers must not run as root - use runAsNonRoot within container security context"
}