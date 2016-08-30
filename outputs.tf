output "security_group" {
    value = "${join(", ", aws_security_group.default.*.id)}"
}

output "web_ip" {
    value = "${join(", ", aws_instance.web.*.public_ip)}"
}



