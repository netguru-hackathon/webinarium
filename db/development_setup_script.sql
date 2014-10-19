CREATE DATABASE "webinarium";
CREATE DATABASE "webinarium_development";
CREATE DATABASE "webinarium_test";

CREATE USER webinarium WITH PASSWORD '';

GRANT ALL PRIVILEGES ON DATABASE webinarium TO webinarium;
GRANT ALL PRIVILEGES ON DATABASE webinarium_development TO webinarium;
GRANT ALL PRIVILEGES ON DATABASE webinarium_test TO webinarium;

ALTER DATABASE webinarium_test OWNER TO webinarium;
ALTER ROLE webinarium CREATEDB;
