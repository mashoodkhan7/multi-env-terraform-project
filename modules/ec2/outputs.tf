output "no_of_ec2" {
value = length(aws_instance.ec2_instance)
}

output "instance_id" {
value = [for instance in aws_instance.ec2_instance : instance.id]
}

output "instance_type" {
  value = [ for instance in aws_instance.ec2_instance: instance.instance_type ]
}

output "key_name" {
   value = [ for instance in aws_instance.ec2_instance : instance.key_name ]
}