# Schema Information


## users
column name     | data type | details
----------------|-----------|-----------------------
id              | integer   | not null, primary key
email           | string    | not null, unique
password_digest | string    | not null
session_token   | string    | not null, unique

## artists
column name     | data type | details
----------------|-----------|-----------------------
id              | integer   | not null, primary key
name            | string    | not null, unique

## artist trackings (join table)
column name     | data type | details
----------------|-----------|-----------------------
id              | integer   | not null, primary key
user_id         | integer   | not null, foreign key (references users)
artist_id       | integer   | not null, foreign key (references artists)

## events
column name     | data type | details
----------------|-----------|-----------------------
id              | integer   | not null, primary key
headliner_id    | integer   | not null, foreign key (references artists)
location_id     | integer   | not null, foreign key (references locations)

## event trackings (join table)
column name     | data type | details
----------------|-----------|-----------------------
id              | integer   | not null, primary key
user_id         | integer   | not null, foreign key (references users)
event_id        | integer   | not null, foreign key (references events)

## locations
column name     | data type | details
----------------|-----------|-----------------------
id              | integer   | not null, primary key
name            | string    | not null, unique

## user locations (join table)
column name     | data type | details
----------------|-----------|-----------------------
id              | integer   | not null, primary key
user_id         | integer   | not null, foreign key (references users)
location_id     | integer   | not null, foreign key (references locations)

## event locations (join table)
column name     | data type | details
----------------|-----------|-----------------------
id              | integer   | not null, primary key
event_id        | integer   | not null, foreign key (references events)
location_id     | integer   | not null, foreign key (references locations)
