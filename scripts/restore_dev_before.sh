echo "
select pg_terminate_backend(pid) 
from pg_stat_activity 
where
  datname = 'test';
drop database if exists test" | docker exec -i postgres psql -U postgres 

echo "create database test" | docker exec -i postgres psql -U postgres 

cat test.before.sql | docker exec -i postgres psql -U postgres -d test