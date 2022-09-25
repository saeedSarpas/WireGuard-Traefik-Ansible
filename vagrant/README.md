# Vagrant Setup

Setting up local virtual machines to test ansible roles.

## Prerequisite

### VirtualBox

## Create instances

Note that, by default, we only create one Ubuntu 20.04 instance. To create more instances, change the `manager_nodes` in the `Vagrantfile`.

```shell
vagrant up
```

## Run Ansible Playbooks

Change directory to the `ansible` directory (assuming, you are inside the `vagrant` directory, run `cd ./../ansible`).

Run the ansible playbooks as mentioned below. Ensure to run the playbooks in the order mentioned below.

### `server_setup` playbook

Run the `server_setup` playbook,

```bash
ansible-playbook -i inventory/vagrant -e target_hosts=managers playbooks/server_setup.yml
```

### `swarm_setup` playbook

Run the `swarm_setup` playbook,

```bash
ansible-playbook -i inventory/vagrant -e target_hosts=managers playbooks/swarm_setup.yml
```

### `traefik` playbook

Run the `traefik` playbook,

```bash
ansible-playbook -i inventory/vagrant -e target_hosts=managers playbooks/traefik.yml
```

### `portainer` playbook

Run the `portainer` playbook,

```bash
ansible-playbook -i inventory/vagrant -e target_hosts=managers playbooks/portainer.yml
```

### `wireguard` playbook

Run the `wireguard` playbook,

```bash
ansible-playbook -i inventory/vagrant -e target_hosts=managers playbooks/wireguard.yml
```

## Good to know stuff

### Vagrant Cheasheet

- Create instances

```shell
vagrant up
```

- Stop instances

```shell
vagrant halt
```

- Destroy instances

```shell
vagrant destroy
```

- SSH to instances

Check your ssh config files first (i.e., `~/.ssh/config` and `~/.ssh/config.d/vagrant.manager`). Run

```shell
ssh vagrant.manager.1
```

to connect to the first instance as `vagrant` user. To change to the `admin` user, run

```shell
sudo su admin
```

Note that the password of the `admin` user is also `admin`.

### Swarm Cheatsheet

- List of services

```shell
docker service ls
```

- Stop a service

```shell
docker service rm <service_name>
```

- Service logs

```shell
docker service logs -f <service_name>
```

- Service logs for troubleshooting

```shell
docker service ps --no-trunc <service_name>
```
