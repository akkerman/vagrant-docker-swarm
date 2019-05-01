# Docker swarm cluster with vagrant

- creates private virtualbox network
- exposes docker daemon with some self-signed certificates, swarm.viewsource.nl
- docker daemon trusts an insecure repository at 192.168.20.1:5000 which is the ip address of the virtualbox host in the private network
- has a script to switch your environment to the remote docker deamon (no need to ssh into the machines)


## Prerequisites 

The following software needs to be installed on the host machine.

| software   | tested version |
| ---        | ---            |
| Virtualbox | v6.0.6         |
| Vagrant    | 2.2.4          |
| Ansible    | 2.7.10         |

Add the following line to hosts file

`192.168.20.120 swarm.viewsource.nl`

## Installation

```sh
vagrant up

eval $(./docker-client/activate env vm)
docker node ls
```
