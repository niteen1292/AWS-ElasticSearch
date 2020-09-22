#!/bin/bash -e
sudo yum install java-1.8.0-openjdk.x86_64 -y 
sudo rpm --import https://artifacts.elastic.co/GPG-KEY-elasticsearch
sudo touch /etc/yum.repos.d/elasticsearch.repo
cat <<EOF | sudo tee /etc/yum.repos.d/elasticsearch.repo
[elasticsearch]
name=Elasticsearch repository for 7.x packages
baseurl=https://artifacts.elastic.co/packages/7.x/yum
gpgcheck=1
gpgkey=https://artifacts.elastic.co/GPG-KEY-elasticsearch
enabled=0
autorefresh=1
type=rpm-md
EOF
sudo yum install --enablerepo=elasticsearch elasticsearch -y
/usr/share/elasticsearch/bin/elasticsearch-plugin install discovery-ec2
cat <<EOF | sudo tee /etc/elasticsearch/elasticsearch.yml
cluster.name: escluster
bootstrap.memory_lock: true
network.host: [_local_,_site_]
discovery.seed_providers: ec2
discovery.ec2.endpoint: ec2.us-west-2.amazonaws.com
dicovery.ec2.tag.cluster_name: escluster
cloud.node.auto_attributes: true
logger.org.elasticsearch.discovery.ec2: "TRACE"
discovery.ec2.availability_zones: us-west-2a,us-west-2b,us-west-2c
EOF
cat <<EOF | sudo tee /etc/elasticsearch/jvm.options
-Xms2g
-Xmx2g
EOF
sudo systemctl start elasticsearch
