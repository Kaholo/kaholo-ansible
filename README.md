This is an Ansible playbook.
It configures an Ubuntu 20 or 22 LTS server to run Kaholo using the docker-compose deployment method.

minimum System Requirements:
* 4 vCPU
* 4 GB RAM
* 50 GB disk

The resulting Kaholo instance...
* has 33 commonly used plugins installed
* has no license installed
* has default username/password of admin@kaholo.io/kaholo123
* listens for HTTP on port 3000

For a temporary POC license, please [contact us](https://kaholo.io/contact/).

To use the playbook, adjust file hosts to contain the correct IP address and SSH key and then run ansible.

    ansible-playbook site.yml

Those familiar with Ansible, Nginx, and TLS might choose to enable the Nginx role and provide valid cert/key to serve Kaholo using HTTPS on port 443.

20230216 kenny.m@kaholo.io