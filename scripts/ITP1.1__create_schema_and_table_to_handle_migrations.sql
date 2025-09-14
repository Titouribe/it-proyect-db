-- Creación del schema que almacenara las tablas e información de los proyectos informáticos
CREATE SCHEMA IF NOT EXISTS itproyects;

USE itproyects;

CREATE TABLE
    IF NOT EXISTS schema_version (
        id INT NOT NULL AUTO_INCREMENT,
        version INT NOT NULL,
        version_name VARCHAR(100) NOT NULL,
        created_date DATETIME NOT NULL,
        PRIMARY KEY (id)
    );

INSERT INTO
    schema_version (version, version_name, created_date) VALUES(1,'ITP1.1__create_schema_and_table_to_handle_migrations.sql', NOW());

-- ROLLBACK (Para eliminar la migración en caso de fallos de manera ordenada)
-- DROP TABLE IF EXISTS schema_version;
-- DROP SCHEMA itproyects;