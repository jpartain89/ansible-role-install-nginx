Install NGINX
=========

| **Travis-CI** |
| ---- |
| [![Build Status](https://travis-ci.org/jpartain89/ansible-role-install-nginx.svg?branch=master)](https://travis-ci.org/jpartain89/ansible-role-install-nginx) |

Installs NGINX and Dynamic Modules (both modules that install during config and after) from Source

Role Variables
--------------

The variable ``nginx_version`` is for JUST the NGINX Version Number, ex:

``nginx_version: 1.14.0``

This will be added into the URL for downloading the source code, as well as the shell script that loops in all of the ``configure`` lines, as well as ``make`` and ``checkinstall``.

Please check out the `defaults/main.yml` file for the more complete list of variables.

``nginx_script_extra_with`` - This is to add onto the defaulted list of `with` items that can be added to the config options when building NGINX

``nginx_alt_module`` - This is to include a module, but using a CLI one liner rather than a git URL and the directory name.

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
         - { role: jpartain89.install-nginx, nginx_version: 1.14.0 }

License
-------

GPLv3

Author Information
------------------

Justin Partain and JPCDI, github.com/jpartain89
