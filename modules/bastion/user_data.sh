#!/bin/bash
set -eux

# ----------------------------
# 1. Update system
# ----------------------------
apt-get update -y
apt-get upgrade -y

# ----------------------------
# 2. Install required packages
# ----------------------------
apt-get install -y curl unzip ca-certificates

# ----------------------------
# 3. Install AWS CLI v2
# ----------------------------
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "/tmp/awscliv2.zip"
cd /tmp
unzip awscliv2.zip
./aws/install

# Verify AWS CLI
aws --version

# ----------------------------
# 4. Install kubectl (latest stable)
# ----------------------------
KUBECTL_VERSION=$(curl -L -s https://dl.k8s.io/release/stable.txt)

curl -LO "https://dl.k8s.io/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl"
chmod +x kubectl
mv kubectl /usr/local/bin/

# Verify kubectl
kubectl version --client

# ----------------------------
# 5. Cleanup
# ----------------------------
rm -rf /tmp/aws /tmp/awscliv2.zip

echo "Bastion bootstrap completed successfully"
