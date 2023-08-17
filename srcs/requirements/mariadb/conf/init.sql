CREATE DATABASE wordpress;
CREATE USER 'hbenfadd'@'wordpress.srcs_inception' IDENTIFIED BY 'root';
GRANT ALL PRIVILEGES ON wordpress.* TO 'hbenfadd'@'wordpress.srcs_inception' IDENTIFIED BY 'root';
FLUSH PRIVILEGES;
