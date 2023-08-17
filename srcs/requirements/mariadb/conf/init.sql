CREATE DATABASE wordpress;
CREATE USER 'hbenfadd'@'localhost' IDENTIFIED BY 'root';
GRANT ALL PRIVILEGES ON wordpress.* TO 'hbenfadd'@'localhost';

GRANT ALL PRIVILEGES ON *.* TO 'hbenfadd'@'wordpress.srcs_inception' IDENTIFIED BY 'root';

FLUSH PRIVILEGES;
