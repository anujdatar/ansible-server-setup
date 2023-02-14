# Ansible-server-setup
Set up a server for dev projects, using Ansible

### Add your inventory file

```ini
[local_servers]
192.168.1.1
192.168.1.2

[remote_servers]
www.example.com
www.example23.com ansible_user=username ansible_ssh_private_key_file=path-to-key

[other_server]
33.44.55.200
```

### Add roles or tasks as needed

```
folder/
├── roles/
│   ├── update/
│   │   └── tasks/
│   │       └── main.yml
│   ├── upgrade/
│   │   └── tasks/
│   │       └── main.yml
│   ├── install/
│   │   └── tasks/
│   │       └── main.yml
│   ├── new_role/
│   │   └── tasks/
│   │       └── main.yml
├── playbook.yml
└── inventory.ini
```

### Add roles to playbook
```yml
---
- name: Update and install packages on Debian system
  hosts: local_servers
  # become: true

  roles:
    - update
    - upgrade
    - install
    - new_role
```
> NOTE: I suggest using `become: true` on individual tasks as necessary

### Run the playbook
If your inventory file is saved in the default ansible hosts location `/etc/ansible/hosts` or `~/.ansible/hosts`.

```sh
ansible-playbook playbook.yml
```

Otherwise you will have to specify your inventory file
```sh
ansible-playbook -i inventory playbook.yml
```
