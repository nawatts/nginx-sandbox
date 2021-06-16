# Nginx sandbox

Docker Compose environment for experimenting with Nginx configuration.

The following files and directories are mounted in the container:

| Path       | Container Path        |
| ---------- | --------------------- |
| nginx.conf | /etc/nginx/nginx.conf |
| conf.d     | /etc/nginx/conf.d     |
| html       | /usr/share/nginx/html |

Nginx is signaled to reload configuration any time a configuration file is changed.
