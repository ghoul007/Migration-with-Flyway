# Continuous Database Delivery with Flyway

```
docker run --rm  -it -v $(pwd)/sqldir:/flyway/sql  --network db_default flyway/flyway  -url=jdbc:postgresql://postgres:5432/test  -user=postgres -password=postgres -connectRetries=60 info
```


## Backup
```
pg_dump -U postgres -d postgres > test.sql
docker exec -it postgres pg_dump -U postgres -d postgres > test.sql
```


## Restore

```
cat test.sql | docker exec -i postgres psql -U postgres
cat test.sql | docker exec -i postgres psql -U postgres -d test
```

```
docker run --rm  -it -v $(pwd)/sqldir:/flyway/sql -v $(pwd)/config:/conf  --network db_default flyway/flyway  -configFiles=/conf/flyway.conf  info
```

# Flyway Command
```
flyway -target=5 migrate
flyway info
flyway validate
flyway migrate
flyway clean
flyway repairliquibase
```

## Pgadmin schema Diff

https://www.pgadmin.org/

## Check change

Display the message "Messgae like this "Database is out of date, run flyway migrate to update" if there are sql  folder changes 

## Chacek Validation
```
flyway validate
```

## Baseline flyway
```
flyway -baselineVersion=2 baseline
```