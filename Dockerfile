FROM debian:stable-slim as debian
RUN apt-get update && apt-get install curl tar -y


RUN curl -o /world.zip https://ftp.postgresql.org/pub/projects/pgFoundry/dbsamples/world/world-1.0/world-1.0.tar.gz
RUN tar /world-1.0.tar.gz -d world

FROM postgres:14.23-trixie

COPY --from=debian  /world/*.sql ./docker-entrypoint-initdb.d
