
#!/bin/bash
sudo yum update -y
sudo yum install -y httpd.x86_64
sudo yum install -y git 
sudo systemctl start httpd.service
sudo systemctl enable httpd.service
#code deploy agent commands
sudo yum update -y
sudo yum install ruby -y
sudo yum install wget -y

cd /home/ec2-user
wget https://aws-codedeploy-ap-south-1.s3.ap-south-1.amazonaws.com/latest/install
chmod +x ./install
sudo ./install auto

sudo systemctl start codedeploy-agent
sudo systemctl enable codedeploy-agent
sudo systemctl status codedeploy-agent

pipelinesvcrole- arn:aws:iam::344249396000:role/service-role/AWSCodePipelineServiceRole-ap-south-1-Vpl
ec2role AWSADec2CodeDeployFullAccess
