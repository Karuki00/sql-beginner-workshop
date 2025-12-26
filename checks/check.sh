#!/bin/bash
# checks/check.sh
# Script to validate each step in the SQL Beginner Workshop tutorial
# Make sure this file is executable: chmod +x checks/check.sh

set -e

STEP=$1

echo "Checking step: $STEP"

case $STEP in
  step01)
    echo "Masuk MySQL..."
    sudo mysql -e "SELECT VERSION();" ;;
  step02)
    echo "Tampilkan Database..."
    sudo mysql -e "SHOW DATABASES;" ;;
  step03)
    echo "Buat Database 'workshop'..."
    sudo mysql -e "CREATE DATABASE IF NOT EXISTS workshop;" ;;
  step04)
    echo "Tampilkan Database Lagi..."
    sudo mysql -e "SHOW DATABASES;" ;;
  step05)
    echo "Gunakan Database 'workshop'..."
    sudo mysql -e "USE workshop;" ;;
  step06)
    echo "Buat Tabel 'users'..."
    sudo mysql -e "CREATE TABLE IF NOT EXISTS users (id INT PRIMARY KEY AUTO_INCREMENT, name VARCHAR(50));" ;;
  step07)
    echo "Tampilkan Tabel..."
    sudo mysql -e "SHOW TABLES;" ;;
  step08)
    echo "Buat Tabel 'products'..."
    sudo mysql -e "CREATE TABLE IF NOT EXISTS products (id INT PRIMARY KEY AUTO_INCREMENT, name VARCHAR(50), price DECIMAL(10,2));" ;;
  step09)
    echo "Tampilkan Tabel Lagi..."
    sudo mysql -e "SHOW TABLES;" ;;
  step10)
    echo "Recreate Tabel 'users'..."
    sudo mysql -e "DROP TABLE IF EXISTS users; CREATE TABLE users (id INT PRIMARY KEY AUTO_INCREMENT, name VARCHAR(50));" ;;
  step11)
    echo "Deskripsikan Tabel 'users'..."
    sudo mysql -e "DESCRIBE users;" ;;
  step12)
    echo "Recreate Tabel 'products'..."
    sudo mysql -e "DROP TABLE IF EXISTS products; CREATE TABLE products (id INT PRIMARY KEY AUTO_INCREMENT, name VARCHAR(50), price DECIMAL(10,2));" ;;
  step13)
    echo "Deskripsikan Tabel 'products'..."
    sudo mysql -e "DESCRIBE products;" ;;
  step14)
    echo "Masukkan Data ke 'users'..."
    sudo mysql -e "INSERT INTO users (name) VALUES ('Alice');" ;;
  step15)
    echo "Lihat Data 'users'..."
    sudo mysql -e "SELECT * FROM users;" ;;
  step16)
    echo "Masukkan Data Lagi ke 'users'..."
    sudo mysql -e "INSERT INTO users (name) VALUES ('Bob');" ;;
  step17)
    echo "Lihat Data 'users' Lagi..."
    sudo mysql -e "SELECT * FROM users;" ;;
  step18)
    echo "Masukkan Data ke 'products'..."
    sudo mysql -e "INSERT INTO products (name, price) VALUES ('Widget', 9.99), ('Gadget', 19.99);" ;;
  step19)
    echo "Lihat Data 'products'..."
    sudo mysql -e "SELECT * FROM products;" ;;
  step20)
    echo "Update Data 'users'..."
    sudo mysql -e "UPDATE users SET name='AliceUpdated' WHERE name='Alice';" ;;
  step21)
    echo "Lihat Data 'users'..."
    sudo mysql -e "SELECT * FROM users;" ;;
  step22)
    echo "Hapus Data 'users'..."
    sudo mysql -e "DELETE FROM users WHERE name='Bob';" ;;
  step23)
    echo "Lihat Data 'users' Lagi..."
    sudo mysql -e "SELECT * FROM users;" ;;
  step24)
    echo "Review Akhir..."
    sudo mysql -e "SHOW DATABASES; USE workshop; SHOW TABLES; SELECT * FROM users; SELECT * FROM products;" ;;
  *)
    echo "Step $STEP tidak dikenali"
    exit 1 ;;
esac
