AWS Varnish Purge Helper
=================

Little script to purge varnish cache. It connects to an AWS Elastic Load Balancer, sends a HTTP request with PURGE method to all instances attached.

Instructions
============

- Rename ```config/config.yml.example``` to ```config/config.yml``` and replace all the values
- Run the ```main.rb <site_name> <path>``` example: ```main.rb adcom /2014/02/28/value-farm-thomas-chung/```

Acknowledgment
==============
Thanks to [Felipe Espinoza](https://github.com/fespinoza) who wrote a preliminar version of the *AWSSite Class*.
