echo "
select pg_terminate_backend(pid) 
from pg_stat_activity 
where
  datname = 'test_compare';
drop database if exists test_compare" | docker exec -i postgres psql -U postgres 

echo "create database test_compare" | docker exec -i postgres psql -U postgres 

cat test.sql | docker exec -i postgres psql -U postgres -d test_compare