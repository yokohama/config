aws-ec2-list:
	aws ec2 describe-instances | grep -e InstanceId -e KeyName

aws-image-create:
	#aws ec2 create-image --instance-id i-08fa936a0b82f415c --name "20201027" --no-reboot
