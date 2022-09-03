package main

deny[msg] {
   input.kind = "service"
   not input.spec.type = "ClusterIP"
   msg = "Service type should be ClusterIP"
}

deny[msg] {
   input.kind = "Deployment"
   if input.spec.template.spec.containers[0].resources.limits.memory > "128Mi"
   msg = "Containers must not run as root - use runAsNonRoot within container security context"
}