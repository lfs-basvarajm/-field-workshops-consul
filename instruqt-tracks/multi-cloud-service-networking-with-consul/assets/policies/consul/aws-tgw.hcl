service "aws-us-east-1-terminating-gateway" {
   policy = "write"
}
service "redis" {
   policy = "write"
}
service "vault" {
   policy = "write"
}
service "" {
   policy = "read"
}
node_prefix "" {
  policy = "write"
}