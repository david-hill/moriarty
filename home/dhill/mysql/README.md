podman --log-level=debug run -d --replace  --name mariadb_03886232  -v /cases/03886232:/var/lib/mysql:z -v /etc/localtime:/etc/localtime:ro --mount type=tmpfs,destination=$HOME/tmp --net=host -e MYSQL_ROOT_PASSWORD=root registry.redhat.io/rhel8/mariadb-103:1-234

podman exec -it mariadb_03886232 mysql -uroot -proot -hknox.orion
