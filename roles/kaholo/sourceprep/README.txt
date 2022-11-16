This Ansible playbook relies on...
* kaholo-enterprise - a sanitized and zipped-up tarball of the project
* images - a docker image repo with pre-build kaholo images available on the network

Apart from the images, the rest of the playbook is self-contained.

This "sourceprep" folder is not used by Ansible but includes instructions and scripts how to prepare the tarball and images, so that any future release of Kaholo can be prepared for deployment with this Ansible playbook.

Steps are given in the form of scripts, to be executed in numerical order.
