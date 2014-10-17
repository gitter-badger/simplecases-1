FROM ubuntu:14.04
ENV REFRESHED_AT 2014-16-10 20:20

RUN apt-get update
RUN apt-get install -y nano
RUN apt-get install -y postgresql libpq-dev
USER postgres
RUN sed -i 's/^host    all             all             127.0.0.1\/32            md5.*/host all all 127.0.0.1\/32 trust/' /etc/postgresql/9.3/main/pg_hba.conf
RUN sed -i 's/^host    all             all             ::1\/128                 md5.*/host all all ::1\/128 trust/' /etc/postgresql/9.3/main/pg_hba.conf
RUN echo "listen_addresses='*'" >> /etc/postgresql/9.3/main/postgresql.conf
RUN    /etc/init.d/postgresql start &&\
    psql --command "CREATE USER docker WITH SUPERUSER PASSWORD 'docker';"
EXPOSE 5432
VOLUME  ["/etc/postgresql", "/var/log/postgresql", "/var/lib/postgresql"]
CMD ["/usr/lib/postgresql/9.3/bin/postgres", "-D", "/var/lib/postgresql/9.3/main", "-c", "config_file=/etc/postgresql/9.3/main/postgresql.conf"]