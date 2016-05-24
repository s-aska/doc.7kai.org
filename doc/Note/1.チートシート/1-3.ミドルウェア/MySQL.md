# MySQL

## CREATE　USER, DROP USER

    CREATE DATABASE foo DEFAULT CHARSET utf8;
    GRANT ALL PRIVILEGES ON foo.* TO foo@localhost IDENTIFIED BY '.foo';
    GRANT SELECT ON foo.* TO foo_slave@localhost;
    FLUSH PRIVILEGES;

    DROP USER foo@localhost;
    FLUSH PRIVILEGES;
