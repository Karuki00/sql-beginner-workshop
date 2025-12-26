#!/bin/bash

STEP=$1

fail() {
  echo "❌ $1"
  exit 1
}

mysql_exec() {
  sudo mysql -N -e "$1"
}

case "$STEP" in

step03|step04)
  mysql_exec "SHOW DATABASES LIKE 'workshop';" | grep -q workshop \
    || fail "Database 'workshop' does not exist."
  ;;

step05)
  mysql_exec "USE workshop;" || fail "Cannot use workshop database."
  ;;

step06|step07|step08|step09)
  mysql_exec "SHOW TABLES FROM workshop;" | grep -q users \
    || fail "Table 'users' not found."
  mysql_exec "SHOW TABLES FROM workshop;" | grep -q products \
    || fail "Table 'products' not found."
  ;;

step10|step11)
  mysql_exec "
    SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA='workshop' AND TABLE_NAME='users';
  " | grep -q id || fail "users table must have columns."
  ;;

step12|step13)
  mysql_exec "
    SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA='workshop' AND TABLE_NAME='products';
  " | grep -q id || fail "products table must have columns."
  ;;

step14|step15|step16|step17)
  COUNT=$(mysql_exec "SELECT COUNT(*) FROM workshop.users;")
  [ "$COUNT" -ge 1 ] || fail "Insert at least one row into users."
  ;;

step18|step19)
  COUNT=$(mysql_exec "SELECT COUNT(*) FROM workshop.products;")
  [ "$COUNT" -ge 1 ] || fail "Insert at least one row into products."
  ;;

step20|step21|step22|step23)
  mysql_exec "SELECT * FROM workshop.users;" >/dev/null \
    || fail "users table must exist and be queryable."
  ;;

step24)
  mysql_exec "SHOW DATABASES;" >/dev/null || fail "Cannot show databases."
  mysql_exec "SHOW TABLES FROM workshop;" >/dev/null || fail "Cannot show tables."
  ;;

*)
  echo "✅ Step complete (no strict check)"
  exit 0
  ;;
esac

echo "✅ Step complete"
exit 0
