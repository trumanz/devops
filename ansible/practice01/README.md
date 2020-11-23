# install ansible on control node
https://docs.ansible.com/ansible/latest/user_guide/intro_getting_started.html

pip install ansible

# ping all node
python  /home/truman/anaconda3/bin/ansible  all   -i  inventory_hosts.yml  -m ping


# install aliyun ansible module
sudo pip install ansible_alicloud

# export access key
export ALICLOUD_ACCESS_KEY="your_accesskey"
export ALICLOUD_SECRET_KEY="your_accesskey_secret"


# play
## create VM on alicloud 
ansible-playbook alicloud_create_ecs.yml
## configure iptable and deploy docker, docker-compose and  start nginx container and wait service starting
ansbile-playbook configure_and_deploy.yml
## 
ansible-playbook test_and_fetch_nginx.yml
ansible-playbook log_container_resrouce.yml


# reference
https://help.aliyun.com/document_detail/106577.html