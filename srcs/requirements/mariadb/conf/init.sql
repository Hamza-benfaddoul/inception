CREATE DATABASE wordpress;
CREATE USER 'hbenfadd'@'localhost' IDENTIFIED BY 'root';
GRANT ALL PRIVILEGES ON wordpress.* TO 'hbenfadd'@'localhost';
FLUSH PRIVILEGES;
