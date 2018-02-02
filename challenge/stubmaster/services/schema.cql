CREATE KEYSPACE stubmaster
  WITH REPLICATION = {
      'class' : 'SimpleStrategy',
      'replication_factor' : 1
};

CREATE TABLE stubmaster.venues (
  uid uuid PRIMARY KEY,
  created timestamp,
  deleted timestamp,
  name varchar,
  city varchar
);

COPY stubmaster.venues (uid, created, deleted, name, city) 
FROM '/venues.csv'
WITH NULL = 'NULL';
