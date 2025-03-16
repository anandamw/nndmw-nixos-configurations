# MySQL/MariaDB Database Setup and User Management

This repository provides instructions for setting up and managing a MySQL or MariaDB database, including creating and configuring users with appropriate privileges.

## Prerequisites

- A working installation of MySQL or MariaDB.
- Access to the MySQL/MariaDB server with root privileges.
- Basic knowledge of SQL commands.

## Steps to Setup MySQL/MariaDB

Follow these steps to configure the MySQL/MariaDB server and create a root user with full privileges.

### 1. Access the MySQL/MariaDB Server

To access MySQL or MariaDB, open a terminal on the server where the database is installed, and log in as the root user:

```bash
mysql -u root -p

ALTER USER 'root'@'localhost' IDENTIFIED BY 'new_password';

GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost';

FLUSH PRIVILEGES;

SHOW GRANTS FOR 'root'@'localhost';

EXIT;

```
### 2. Adding an Unstable Version Repository

```bash

sudo nix-channel --add https://nixos.org/channels/nixpkgs-unstable unstable

sudo nix-channel --update

sudo nixos-rebuild switch

```
