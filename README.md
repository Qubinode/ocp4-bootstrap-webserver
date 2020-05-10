Role Name
=========

This role does the following:

 * Downloads these coreos files to the container volume dir:
   - rhcos-x.x.x-x86_64-installer-initramfs.img
   - rhcos-x.x.x-x86_64-metal-bios.raw.gz
   - rhcos-x.x.x-x86_64-installer-kernel
 * Copy over your ignition files for worker, bootstrap and master to the container volume dir
 * build a podman httpd container and start it

Requirements
------------

This role requires your ignition files.

Role Variables
--------------
|  **Variable** | **Required** | **Default** | **Description** |
| :---: | :---: | :---: | :---: |
|  ocp4_release | yes | 4.2.0 | The release of OCP4 you are installing |
|  rhcos_webserver_img_name | yes | rhcos-webserver | Name for the webserver container image |
|  coreos_tmp_dir | yes | /tmp/build_coreos_container | Temp folder used for running podman build |
|  admin_user | yes | admin | The non root user you are logged as |
|  virtinstall_dir | yes | /tmp/rhcos-virtinstall | The directory to store the virt-install generated scripts |
|  podman_webserver | yes | qbn-httpd | Name for the webserver container |
|  webserver_directory | yes | /opt/qubinode_webserver | Directory used use for the container volume and to store the files to be served by the webserver |
| ignition_files_dir | yes | none | Path where you ignitions files are stored |
| tear_down | yes | false | Set to true to undo it all|

Dependencies
------------

none

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
         - { role: username.rolename, x: 42 }

License
-------

BSD

Author Information
------------------

Rodrique Heron
