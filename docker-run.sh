docker run --restart=always --name=myapp -e MARIADB_ROOT_PASSWORD=12345678 -p 3302:80 -v /var/data/myapp:/var/data/myapp ubuntu-1804