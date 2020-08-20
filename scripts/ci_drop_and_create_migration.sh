echo "
select pg_terminate_backend(pid) 
from pg_stat_activity 
where
  datname = 'test-ci';
drop database if exists test-ci" | docker exec -i postgres psql -U postgres 

echo "create database test-ci" | docker exec -i postgres psql -U postgres 

echo "Restoring database"
cat last.dev.backup.sql | docker exec -i postgres psql -U postgres -d test-ci


echo "Apply  database changes"
docker run --rm  -it -v $(pwd)/sqldir:/flyway/sql -v $(pwd)/config:/conf  --network db_default flyway/flyway  -configFiles=/conf/flyway-pretest.conf  migrate