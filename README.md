# Docker swarm cluster with vagrant

- creates private virtualbox network
- exposes docker daemon with some self-signed certificates, swarm.viewsource.nl
- docker daemon trusts an insecure repository at 192.168.20.1:5000 which is the ip address of the virtualbox host in the private network
- has a script to switch your environment to the remote docker deamon (no need to ssh into the machines)


steps:

    vagrant up

    vagrant ssh manager
    docker swarm init --advertise-addr 192.168.20.120
    # copy output
    exit

    vagrant ssh worker1
    # paste
    vagrant swarm join ...
    exit

    vagrant ssh worker2
    # paste
    vagrant swarm join ...
    exit



    eval $(./docker-client/activate env vm)
    docker node ls
