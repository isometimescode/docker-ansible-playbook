# Ansible Playbook

This installs [Ansible](https://www.ansible.com/) in a basic Debian Buster Python 3.9 image.

## Usage Examples

* Grab the image from DockerHub
```sh
docker pull isometimescode/ansible-playbook:latest
```
* Grab a specific version of Ansible from DockerHub
```sh
docker pull isometimescode/ansible-playbook:2.10.3
```
* Run a container and check the installed version of ansible
```sh
docker run -t --rm -v $(pwd)/my-local-playbook:/playbook isometimescode/ansible-playbook --version
```
* Run a container and mount a volume with your playbook contents to execute a play
```sh
docker run -it --rm -v $(pwd)/my-local-playbook:/playbook isometimescode/ansible-playbook /playbook/main.yml
```

## Building Your Own Image

| Build Arguments | Default Value |
| --- | --- |
| `ANSIBLE_VERSION` | `2.10.3` |
| `PLAYBOOK_DIR` | `/playbook` |

The environment variable `ANSIBLE_CONFIG` is set with the default value of `$PLAYBOOK_DIR/ansible.cfg` e.g. `/playbook/ansible.cfg`.

For example, you can build a new image with a specific version of ansible:

```sh
docker build . -t ansible-playbook:2.9.13 --build-arg ANSIBLE_VERSION=2.9.13
```
