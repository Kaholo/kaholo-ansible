# Kaholo Ansible Deployment

This is an Ansible playbook.
It configures an Ubuntu 22 LTS server to run Kaholo using microk8s (Kubernetes) and Helm charts.

You will need from Kaholo (please [contact us](https://kaholo.io/contact/)):
* A Docker Hub personal access token (dckr_pat) to pull the kaholo images during deployment
* A license file to use Kaholo after installation

System requirements (minimum):
* Ubuntu 22.04 LTS x86/64
* 2 vCPU
* 4 GB RAM
* 50 GB disk

System requirements (recommended):
* Ubuntu 22.04 LTS x86/64
* 4 vCPU
* 8 GB RAM
* 100 GB disk

NOTE: Variable agent_resources in vars/kaholo.yml must be matched with actual vCPU and RAM resources. Any vCPU/RAM in excess of 2vCPU/4GB may be added to the limits for the Kaholo agent. This will allow for more pipelines running simultaneously or for any pipeline to run faster. Setting agent limits too high leaves the Kaholo server with too few resources to start up and run reliably. Setting agent limits too low restricts performance of pipeline executions.

Note that 2vCPU is the bare minimum requirement. Some cloud providers have 2vCPU configuration that are "shared", meaning the real available compute power is less than 2vCPU, for example GCP e2-medium. These instances do NOT have sufficient resources to run Kaholo. This is evident when viewing the Kubernetes dashboard workload, which will show failed and pending pods long after the typical 10-minute startup period. An example of a minimal working instance in GCP is e2-standard-2.

2 vCPU / 4GB RAM (minimum):

    agent_resources: '{"limits":{"cpu":"300m","memory":"1Gi"},"requests":{"cpu":"300m","memory":"1Gi"}}'

4 vCPU / 8GB RAM (recommended):

    agent_resources: '{"limits":{"cpu":"2","memory":"4Gi"},"requests":{"cpu":"300m","memory":"1Gi"}}'

To use the playbook you must have:
* A server or VM meeting system requirements
* Ansible installed on a client machine - to run command `ansible-playbook`
* An SSH key to access the server as user "ubuntu" with passwordless sudo privileges
* Valid DNS A record that resolves to your IP address (if using Let's Encrypt)

Recommended to have:
* DNS A record with matching cert and key for TLS (HTTPS) (if NOT using Let's Encrypt)

The resulting Kaholo instance...
* has no plugins installed
* has no license installed
* will prompt to create initial Admin user account

## Basic use
To use the playbook, adjust the following files appropriately:
* hosts
* vars/secrets.yml
* vars/kaholo.yml

Then run command:

    ansible-playbook site.yml

## HTTPS/TLS Certificates
Kaholo is not safe to use over standard HTTP. By default Microk8s will create self-signed certificates to secure the connection using TLS, which is safe. However, browsers will not by default trust these certificates. In some cases an exception can be added or the certificate can be added as a trusted root certificate as workaround.

### Provide your own certificates

For this reason is recommended to get or create a genuine certificate to use with your Kaholo server, one issued from a trusted root authority. To do this, replace files `private.key` and `public.crt` in folder `roles/kaholohelm/files` with those you wish to use - before running the playbook.

Use of Ansible Vault is not required. File `private.key` may be provided in plain text PEM format. (`-----BEGIN PRIVATE KEY-----`)

Also if providing your own certificate, specify `rekey_ingress: provided` in `vars/kaholo.yml`. The `host` and `domain` parameters used in `vars/kaholo.yml` must match the certificate's designated URL to gain the browser's trust.

### Let's Encrypt

Alternatively, specify `rekey_ingress: lets-encrypt` to generate keys using Let's Encrypt. For this **the domain name must resolve** to the correct IP address, which requires a working DNS entry.

## DNS
While the playbook will configure the server to use the URL `https://{{host}}.{{domain}}` as specified in file `vars/kaholo.yml`, you network's DNS is required to resolve it. If DNS cannot be configured appropriately, you can add a line to `/etc/hosts` to direct the name to the correct IP address like so:

    35.228.71.219   kaholo-d.kaholodemo.net

This must be repeated on every client machine that will use the URL. DNS is required to use the URL only, i.e. to use Kaholo. Deployment can proceed without a working DNS. Set either `rekey_ingress: none` or `rekey_ingress: provided` (and provide valid cert and key). Option `rekey_ingress: letsencrypt` requires a valid DNS entry to work.

## Success
A successful deployment will end with a message such as this one.

    "msg": [
        "Deployment is successful - may take a few minutes to become ready for use.",
        "Monitor progress and status using Kubernetes Dashboard at: https://kaholo-d.kaholodemo.net:30443",
        "Your dashboard token:      eyJhbGciOiJSUzI1NiIsImtpZCI6IlNVRGd2U1c5VjJQYTV3NzRtUFc2b3pyMS1Va29QdVNRQko3Smd6Q1JQR2MifQ.eyJpc3MiOiJrdWJlcm5ldGVzL3NlcnZpY2VhY2NvdW50Iiwia3ViZXJuZXRlcy5pby9zZXJ2aWNlYWNjb3VudC9uYW1lc3BhY2UiOiJrdWJlLXN5c3RlbSIsImt1YmVybmV0ZXMuaW8vc2VydmljZWFjY291bnQvc2VjcmV0Lm5hbWUiOiJtaWNyb2s4cy1kYXNoYm9hcmQtdG9rZW4iLCJrdWJlcm5ldGVzLmlvL3NlcnZpY2VhY2NvdW50L3NlcnZpY2UtYWNjb3VudC5uYW1lIjoiZGVmYXVsdCIsImt1YmVybmV0ZXMuaW8vc2VydmljZWFjY291bnQvc2VydmljZS1hY2NvdW50LnVpZCI6IjQ2M2FhNzZiLWIzZGUtNGQ2Yi04N2JlLWFkZDJiMTVkOWRhMSIsInN1YiI6InN5c3RlbTpzZXJ2aWNlYWNjb3VudDprdWJlLXN5c3RlbTpkZWZhdWx0In0.R9PRyHI7aNeRANp5K4Cff6uk_86BgYdzD80lXquhTgfBjtfqYEFiHiTUY6WOe9iZFjCkrmojWiyFFSByBT0N77TRTOz0bvzWYdrJ1C8MxSJALj14lpN5iJnmGsihtDyk90d4Es4cTEOWumqp6bE1JItdF_NOv9pK3JI8-g-DSA0qqE2cUIXFG_ntRQ2TYzDleMAXgj0hsldbCYoW7HyQMTzjcnOkit6KgQr_UjHA4ECcKuWBgiLsZXm5f0TXeOfy2b8tOwiFR9f_fMzyWke1UauGpNanK--c1Af6SvOC1yDyA_bUACi67YZfWGozpak0rBZIiJCPBckhBTzNShMGWw",
        "Kaholo will soon be accessible at: https://kaholo-d.kaholodemo.net"
    ]

20230510 kenny.m@kaholo.io

pre-release checklist:
* test
* set rekey to Let's Encrypt
* do not check in custom vars files
* neutralize key and cert
* check site and mains
