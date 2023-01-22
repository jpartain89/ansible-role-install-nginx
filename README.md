# Install NGINX

Installs NGINX and Dynamic Modules (both modules that install during config and after) from Source

## Role Variables

The `main.yml` file that is in the `defaults` directory is the place to look for all of the variables that you would be most interested in adjusting.

Specifically, the variable ``nginx_version`` is what I personally have in my actual playbook file or you can call it on the command line, as thats obviously the variable that will be changed the most often as you run this for updating NGINX.

And I also have included a ``nginx_check_version`` variable, for skipping the task block that stops the playbook only if your new version variable from above is different from the one currently installed. This way, if you make a change to how NGINX is compiled, it'll let you past by adding ``-e "nginx_check_version=false"`` to the end of your ``ansible-playbook`` command.

### Some example variable adjustments:

For the ``nginx_module`` variable dictionary, the ``name`` is the name of the repo/module and the ``address`` is obviously the git repo address. The ``name`` part of the variable gets included in the templated script for building nginx.

```bash
nginx_module:
  - { name: "ngx-fancyindex", address: "https://github.com/aperezdc/ngx-fancyindex.git" }
  - { name: "nginx-dav-ext-module", address: "https://github.com/arut/nginx-dav-ext-module.git" }
  - { name: "nginx-auth-ldap", address: "https://github.com/kvspb/nginx-auth-ldap.git" }
  - { name: "ngx_http_auth_pam_module", address: "https://github.com/sto/ngx_http_auth_pam_module" }
```

The ``nginx_config_loc`` variable is more personally specific than world-usable. I personally keep my nginx configuration files in a git repo for online backup/saving/editing. Becuase of this, I use a symlink from ``/etc/nginx`` to the cloned location in my home directory. Setting ``nginx_config_loc`` allows the safe removal of an existing link, removal of the default directory that gets installed because of the build and then relink the git repo. (When running the build steps, it automatically writes/overwrites the ``/etc/nginx`` directory, which is super annoying. This way, we stop the overwriting)

## Example Playbook

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

  - hosts: servers
    become: true

    vars:
      nginx_version: "nginx-1.17.6"

    - name: Install NGINX
      import_role:
        name: jpartain89.install-nginx

## License

GPLv3

## Author Information

Justin Partain and JPCDI, github.com/jpartain89
