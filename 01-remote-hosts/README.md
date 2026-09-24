There are two EC2 instances, one public the other private.  The public EC2 instance will serve as the Ansible control node and the private instance will serve as the Ansible managed node.


1. Run the Terraform lab 47.

2. SSH into the EC2 instance in the public subnet.

3. Ping the EC2 instance in the private subnet using its private IP address.

3. Read the cloud init logs to see the installation of ansible.

```
cat /var/log/cloud-init-output.log
```

5. In the file `inventory/production_servers.yaml`, add the private IP address of the private instance on line `<server_IP_address>`.

6. Copy the private SSH key into the file `key-for-ec2-connection`.

7. Test Ansible:

```
ansible --version
```

8. Ping backend server using Ansible:

```
ansible backend-servers -m ping
```

8. Execute the playbook:

```
ansible-playbook playbook.yaml
```