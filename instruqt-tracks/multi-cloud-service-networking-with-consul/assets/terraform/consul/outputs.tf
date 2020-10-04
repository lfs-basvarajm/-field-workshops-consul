output "aws_consul_public_ip" {
  value = aws_instance.consul.public_ip
}

output "aws_mgw_public_ip" {
  value = aws_instance.mesh_gateway.public_ip
}

output "gcp_consul_public_ip" {
  value = google_compute_address.static.address
}

output "gcp_mgw_public_ip" {
  value = google_compute_address.mgw.address
}
