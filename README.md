
## Fair_Data_Point_Infra
This repository contains the [ansible](https://docs.ansible.com/ansible/latest/index.html) configuration together with the shared data to create  Fair data point server to access the [Lofar](http://www.lofar.org/) Long Term Archive ([LAT](https://lta.lofar.eu/)).


### Instructions
 * Install ansible:
   ```pip install ansible```
 * Edit the `inventory` file and add the `hostname` or `IP address` of the machine where you want
   to install the server.
 * Run the installation instructions:
 ```ansible-playbook -i inventory playbook.yml```
