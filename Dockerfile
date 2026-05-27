FROM debian:stable-slim as debian
RUN apt-get update && apt-get install curl unzip -y


RUN curl -o /world.zip https://ftp.postgresql.org/pub/projects/pgFoundry/dbsamples/world/world-1.0/world-1.0.tar.gz
RUN unzip /world.zip -d world

FROM postgres:14.23-trixie

COPY --from=debian  /world/*.sql ./docker-entrypoint-initdb.d

