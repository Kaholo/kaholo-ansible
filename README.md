This is an Ansible playbook.
It configures an Ubuntu 20 or 22 LTS server to run Kaholo using the docker-compose deployment method.

System Requirements include:
* 8 vCPU
* 8 GB RAM
* 50 GB disk

To use the playbook, adjust file hosts to contain the correct IP address and SSH key and then run ansible.

    ansible-playbook site.yml

kenny.m@kaholo.io