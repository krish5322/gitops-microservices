package main

deny[msg] {
   input.kind = "service"
   not input.spec.type = "ClusterIP"
   msg = "Service type should be ClusterIP"
}

deny[msg] {
   input.kind = "Deployment"
   not input.spec.template.spec.containers[0].resources
   msg = "please set Resource Requests and Resource Limits for better performance"
}

deny[msg] {
   input.kind = "Deployment"
   not input.spec.template.spec.containers[0].readinessProbe
   msg = "please set readinessProbe for better performance"
}

deny[msg] {
   input.kind = "Deployment"
   not input.spec.template.spec.containers[0].livenessProbe
   msg = "please set livenessProbe for better performance"
}