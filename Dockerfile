#Download base image ubuntu 18.04
FROM ubuntu:18.04
ARG AWS_ACCESS_KEY_ID
ARG AWS_SECRET_ACCESS_KEY
ARG AWS_DEFAULT_REGION
ARG s3_bucket
ARG key_pair

ENV AWS_ACCESS_KEY_ID $AWS_ACCESS_KEY_ID
ENV AWS_SECRET_ACCESS_KEY $AWS_SECRET_ACCESS_KEY
ENV AWS_DEFAULT_REGION $AWS_DEFAULT_REGION
ENV s3_bucket $s3_bucket
ENV key_pair $key_pair

# LABEL about the custom image
LABEL description="This is custom Docker Image with Terraform"

# Disable Prompt During Packages Installation
ARG DEBIAN_FRONTEND=noninteractive

# Update Ubuntu Software repository
RUN apt update && \
    apt install wget -y && \
    apt install zip -y && \
    apt install graphviz -y && \
    apt install curl -y && \
    apt install -y python-boto && \
    apt install -y nano && \
    wget https://releases.hashicorp.com/terraform/0.12.24/terraform_0.12.24_linux_amd64.zip && \
    unzip terraform*.zip && \
    rm terraform*.zip && \
    mv terraform /usr/local/bin && \
    mkdir /devops && \
    mkdir /devops/modules && \
    mkdir /devops/task1 && \
    mkdir /devops/docs && \
    mkdir /devops/conf && \
    curl -Lo /devops/terraform-docs https://github.com/terraform-docs/terraform-docs/releases/download/v0.10.0-rc.1/terraform-docs-v0.10.0-rc.1-$(uname | tr '[:upper:]' '[:lower:]')-amd64 && \
    chmod +x /devops/terraform-docs

# Define working directory.
WORKDIR /devops/task1
COPY modules /devops/modules
COPY conf /devops/conf
COPY task1/ /devops/task1
COPY task1/run_task1.sh/ /devops/task1

# Define default command.
CMD ["bash"]
