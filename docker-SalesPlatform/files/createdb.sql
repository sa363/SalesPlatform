CREATE DATABASE crm;
CREATE USER 'crm'@'localhost' IDENTIFIED BY 'PaSsWoRd';
GRANT ALL PRIVILEGES ON crm.* TO 'crm'@'localhost';
FLUSH PRIVILEGES;