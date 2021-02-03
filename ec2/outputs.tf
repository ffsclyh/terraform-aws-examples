output "public_ips" {
  description = "Instances public IPs"
  value = [
    for instance in aws_instance.instance :
    instance.public_ip
  ]
}