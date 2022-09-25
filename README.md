# WireGuard-Traefik-Ansible

## Setup

We recommend testing this setup locally using vagrant instances. Follow `vagrant/README.md`. To install `traefik-portainer-wireguard` on your production swarm server, follow the instruction below.

### SSH key

#### Generate a new pair of SSH keys (if you haven't created one already)

To generate a new pair of SSH keys, run the following command in your terminal and follow the instruction (make sure to replace the placeholder)

```shell
(cd ~/.ssh && ssh-keygen -t ed25519 -C "<your-name>@<your-hostname>_$(date +'%y-%m-%d')")
```

#### Copy your key

After generating your key, copy your public key to `ansible/keys/id_ed_me_2022.pub`. This command might be helpful

```shell
echo ~/.ssh/id_ed25519.pub > ./ansible/keys/id_ed_me_2022.pub
```

### Configuration

Open `ansible/inventory/production/host_vars/my.production.server.yml` file and replace all placeholders (i.e., values marked as `<...>`). Since we set up an SSL certificate, a valid domain name must be used as <my-server-domain>.

If you want to keep your credentials secret, you can use `ansible-vault` as explained below:

#### Ansible vault (optional)

- Go to `ansible` directory
- Open `ansible.cfg` and uncomment `vault_password_file = .vault.pass`
- Create `.vault.pass` file and place a secure password inside
- Run `ansible-vault create inventory/production/host_vars/vault.yml`
- Copy the following configs

  ```yaml
  ansible:
    host: <my-server-domain>
    user: <my-server-user>
    become_user: root
    become_pass: <my-server-password>

  traefik:
    user: admin
    pass: <traefik-password>

  portainer:
    user: admin
    pass: <portainer-password>
    admin_port: 9000
    tunnel_port: 8000
  ```

- Replace the placeholders with secure values
- Save and quit the file
- Remove the same configs from `inventory/production/host_vars/my.production.server.yml`

### Run playbooks

from the `ansible` directory

```shell
ansible-playbook -i inventory/production -e target_hosts=managers playbooks/server_setup.yml
ansible-playbook -i inventory/production -e target_hosts=managers playbooks/swarm_setup.yml
ansible-playbook -i inventory/production -e target_hosts=managers playbooks/traefik.yml
ansible-playbook -i inventory/production -e target_hosts=managers playbooks/portainer.yml
ansible-playbook -i inventory/production -e target_hosts=managers playbooks/wireguard.yml
```

## Bug report

Please report bugs at `https://github.com/saeedSarpas/WireGuard-Traefik-Ansible/issues`.

## Contribution

Feel free to send us merge requests.

