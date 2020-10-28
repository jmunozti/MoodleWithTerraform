#!/bin/bash

echo "Begin"
echo "============================================"

sed -i "s/moodle-with-terraform-2020/$s3_bucket/g" main.tf
sed -i "s/ssh-key/$key_pair/g" terraform.tfvars

terraform fmt
terraform init
terraform plan

#Deploy infrastructure
terraform apply -input=false -auto-approve

#Generate documentation
terraform graph | dot -Tsvg > /devops/docs/graph.svg

for i in $(ls /devops/modules); do
	 /devops/terraform-docs markdown /devops/modules/$i > /devops/docs/$i.md
done;

echo "============================================"
echo "End"
