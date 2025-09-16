-- Agregar tablas para almacenar la información de cambios o anterior al actualizar o eliminar trabajadores y lenguajes de programación

USE itproyects;

CREATE TABLE
        IF NOT EXISTS copy_worker_updateUU (
                id INT NOT NULL,
                name VARCHAR(200) NOT NULL,
                last_name VARCHAR(200) NOT NULL,
                title VARCHAR(200) NOT NULL,
                years_of_experience INT NOT NULL DEFAULT 0,
                personal_identification VARCHAR(20) NOT NULL,
                is_active BOOLEAN DEFAULT TRUE,
                is_chief BOOLEAN DEFAULT TRUE,
                salary_per_hour INT NOT NULL DEFAULT 0,
                position_id INT NOT NULL,
                created_date DATETIME NOT NULL,
                update_date DATETIME NOT NULL
        );

CREATE TABLE
        IF NOT EXISTS copy_worker_deletionUU (
                id INT NOT NULL,
                name VARCHAR(200) NOT NULL,
                last_name VARCHAR(200) NOT NULL,
                title VARCHAR(200) NOT NULL,
                years_of_experience INT NOT NULL DEFAULT 0,
                personal_identification VARCHAR(20) NOT NULL,
                is_active BOOLEAN DEFAULT TRUE,
                is_chief BOOLEAN DEFAULT TRUE,
                salary_per_hour INT NOT NULL DEFAULT 0,
                position_id INT NOT NULL,
                created_date DATETIME NOT NULL,
                update_date DATETIME NOT NULL
        );

CREATE TABLE
        IF NOT EXISTS copy_programming_language_updateUU (
                id INT NOT NULL,
                name VARCHAR(200) NOT NULL,
                created_date DATETIME NOT NULL,
                update_date DATETIME NOT NULL
        );

CREATE TABLE
        IF NOT EXISTS copy_programming_language_deletionUU (
                id INT NOT NULL,
                name VARCHAR(200) NOT NULL,
                created_date DATETIME NOT NULL,
                update_date DATETIME NOT NULL
        );

INSERT INTO
    schema_version (version, version_name, created_date) VALUES(6,'ITP1.6__add_tables_to_store_deletions_and_updates_for_worker_and_programming_language.sql', NOW());

-- ROLLBACK (Para eliminar la migración en caso de fallos de manera ordenada)
-- SET SQL_SAFE_UPDATES = 0;
-- USE itproyects;
-- DROP TABLE IF EXISTS copy_programming_language_deletionUU;
-- DROP TABLE IF EXISTS copy_programming_language_updateUU;
-- DROP TABLE IF EXISTS copy_worker_deletionUU;
-- DROP TABLE IF EXISTS copy_worker_updateUU;
-- DELETE FROM schema_version where version = 6;