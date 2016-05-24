# PostgreSQL

`--no-locale` 付けるというノウハウの為だけに...

    su - postgres -c "initdb --no-locale -D /var/lib/pgsql/data"
    /etc/init.d/postgresql start
    su - postgres -c "createuser -S -R -D your_project"
    su - postgres -c "createdb -O your_project your_project -E UTF-8 -T template0"
