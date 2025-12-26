#!/bin/bash
set -e

echo "Updating package list..."
sudo apt-get update -y

echo "Installing MySQL Server..."
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y mysql-server

echo "Starting MySQL service..."
sudo service mysql start

echo "MySQL version:"
sudo mysql --version
