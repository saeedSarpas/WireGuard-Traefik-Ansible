# Ansible

## Prerequisite

### Docker swarm collection

- Install the community docker collection

```bash
ansible-galaxy collection install community.docker
```

## Playbooks

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

If you run this role for the first time, ignore the error during the `Check if swarm is already created` task. To ensure everything is working, you can return the `swarm_setup` playbook. There should not be any error when running the playbook for the second time.

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

## Good to know

# Swarm Cheatsheet

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
