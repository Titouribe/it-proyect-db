-- Agregar tablas para almacenar la información de cambios o anterior al actualizar o eliminar trabajadores y lenguajes de programación
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