FROM debian:stable-slim as debian
RUN apt-get update && apt-get install curl unzip -y


RUN curl -o /world.zip https://ftp.postgresql.org/pub/projects/pgFoundry/dbsamples/world/world-1.0/world-1.0.tar.gz
RUN unzip /world.zip -d world && sed -i 's/DROP DATABASE demo;//g' world/*.sql

FROM postgres:14.23-trixie

COPY --from=debian  /world ./docker-entrypoint-initdb.d
