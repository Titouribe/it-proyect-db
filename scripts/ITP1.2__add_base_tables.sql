-- Creación de las tablas base en orden de dependencias y relaciones para evitar errores

CREATE TABLE
    IF NOT EXISTS customer (
        id INT NOT NULL AUTO_INCREMENT,
        name VARCHAR(200) NOT NULL,
        created_date DATETIME NOT NULL,
        PRIMARY KEY (id)
    );

CREATE TABLE
    IF NOT EXISTS programming_language (
        id INT NOT NULL AUTO_INCREMENT,
        name VARCHAR(200) NOT NULL,
        created_date DATETIME NOT NULL,
        PRIMARY KEY (id)
    );

CREATE TABLE
    IF NOT EXISTS resource_type (
        id INT NOT NULL AUTO_INCREMENT,
        name VARCHAR(150) NOT NULL,
        created_date DATETIME NOT NULL,
        PRIMARY KEY (id)
    );

CREATE TABLE
    IF NOT EXISTS product_type (
        id INT NOT NULL AUTO_INCREMENT,
        name VARCHAR(150) NOT NULL,
        created_date DATETIME NOT NULL,
        PRIMARY KEY (id)
    );

CREATE TABLE
    IF NOT EXISTS spend_type (
        id INT NOT NULL AUTO_INCREMENT,
        name VARCHAR(150) NOT NULL,
        created_date DATETIME NOT NULL,
        PRIMARY KEY (id)
    );

CREATE TABLE
    IF NOT EXISTS position (
        id INT NOT NULL AUTO_INCREMENT,
        name VARCHAR(150) NOT NULL,
        created_date DATETIME NOT NULL,
        PRIMARY KEY (id)
    );

CREATE TABLE
    IF NOT EXISTS resource (
        id INT NOT NULL AUTO_INCREMENT,
        name VARCHAR(150) NOT NULL,
        description VARCHAR(500),
        value_per_hour INT NOT NULL DEFAULT 0,
        resource_type_id INT NOT NULL,
        created_date DATETIME NOT NULL,
        CONSTRAINT fk_resource_resource_type_id FOREIGN KEY (resource_type_id) REFERENCES resource_type (id),
        PRIMARY KEY (id)
    );

CREATE TABLE
    IF NOT EXISTS worker (
        id INT NOT NULL AUTO_INCREMENT,
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
        CONSTRAINT fk_worker_position_id FOREIGN KEY (position_id) REFERENCES position (id),
        PRIMARY KEY (id)
    );

CREATE TABLE
    IF NOT EXISTS proyect (
        id INT NOT NULL AUTO_INCREMENT,
        name VARCHAR(200) NOT NULL,
        description VARCHAR(500),
        forecast INT NOT NULL DEFAULT 0,
        start_date DATETIME NOT NULL,
        end_date DATETIME NOT NULL,
        estimated_hours INT NOT NULL DEFAULT 0,
        customer_id INT NOT NULL,
        worker_id INT NOT NULL,
        created_date DATETIME NOT NULL,
        CONSTRAINT fk_proyect_customer_id FOREIGN KEY (customer_id) REFERENCES customer (id),
        CONSTRAINT fk_proyect_worker_id FOREIGN KEY (worker_id) REFERENCES worker (id),
        PRIMARY KEY (id)
    );

CREATE TABLE
    IF NOT EXISTS product (
        id INT NOT NULL AUTO_INCREMENT,
        name VARCHAR(200) NOT NULL,
        description VARCHAR(500),
        is_finished BOOLEAN DEFAULT FALSE,
        spend_hours INT NOT NULL DEFAULT 0,
        product_type_id INT NOT NULL,
        worker_id INT NOT NULL,
        created_date DATETIME NOT NULL,
        CONSTRAINT fk_product_product_type_id FOREIGN KEY (product_type_id) REFERENCES product (id),
        CONSTRAINT fk_product_worker_id FOREIGN KEY (worker_id) REFERENCES worker (id),
        PRIMARY KEY (id)
    );

CREATE TABLE
    IF NOT EXISTS fase (
        id INT NOT NULL AUTO_INCREMENT,
        name VARCHAR(200) NOT NULL,
        start_date DATETIME NOT NULL,
        end_date DATETIME NOT NULL,
        proyect_id INT NOT NULL,
        state VARCHAR(100) NOT NULL,
        created_date DATETIME NOT NULL,
        CONSTRAINT fk_fase_proyect_id FOREIGN KEY (proyect_id) REFERENCES proyect (id),
        PRIMARY KEY (id)
    );

CREATE TABLE
    IF NOT EXISTS spend (
        id INT NOT NULL AUTO_INCREMENT,
        name VARCHAR(200) NOT NULL,
        date DATETIME NOT NULL,
        created_date DATETIME NOT NULL,
        description VARCHAR(500),
        value INT NOT NULL DEFAULT 0,
        proyect_id INT NOT NULL,
        spend_type_id INT NOT NULL,
        CONSTRAINT fk_spend_proyect_id FOREIGN KEY (proyect_id) REFERENCES proyect (id),
        CONSTRAINT fk_spend_spend_type_id FOREIGN KEY (spend_type_id) REFERENCES spend_type (id),
        PRIMARY KEY (id)
    );

CREATE TABLE
    IF NOT EXISTS fase_product (
        fase_id INT NOT NULL,
        product_id INT NOT NULL,
        created_date DATETIME NOT NULL,
        CONSTRAINT fk_fase_product_fase_id FOREIGN KEY (fase_id) REFERENCES fase (id),
        CONSTRAINT fk_fase_product_product_id FOREIGN KEY (product_id) REFERENCES product (id)
    );

CREATE TABLE
    IF NOT EXISTS fase_resource (
        fase_id INT NOT NULL,
        resource_id INT NOT NULL,
        usage_hours INT NOT NULL DEFAULT 0,
        CONSTRAINT fk_fase_resource_fase_id FOREIGN KEY (fase_id) REFERENCES fase (id),
        CONSTRAINT fk_fase_resource_resource_id FOREIGN KEY (resource_id) REFERENCES resource (id)
    );

CREATE TABLE
    IF NOT EXISTS worker_programming_language (
        worker_id INT NOT NULL,
        programming_language_id INT NOT NULL,
        CONSTRAINT fk_worker_programming_language_worker_id FOREIGN KEY (worker_id) REFERENCES worker (id),
        CONSTRAINT fk_worker_programming_language_language_id FOREIGN KEY (programming_language_id) REFERENCES programming_language (id)
    );

INSERT INTO
    schema_version (version, version_name, created_date) VALUES (2, 'ITP1.2__add_base_Tables.sql', NOW());

-- ROLLBACK (Para eliminar la migración en caso de fallos de manera ordenada)
-- SET SQL_SAFE_UPDATES = 0;
-- DROP TABLE IF EXISTS worker_programming_language;
-- DROP TABLE IF EXISTS fase_resource;
-- DROP TABLE IF EXISTS fase_product;
-- DROP TABLE IF EXISTS spend;
-- DROP TABLE IF EXISTS fase;
-- DROP TABLE IF EXISTS product;
-- DROP TABLE IF EXISTS resource;
-- DROP TABLE IF EXISTS proyect;
-- DROP TABLE IF EXISTS worker;
-- DROP TABLE IF EXISTS position;
-- DROP TABLE IF EXISTS spend_type;
-- DROP TABLE IF EXISTS product_type;
-- DROP TABLE IF EXISTS resource_type;
-- DROP TABLE IF EXISTS programming_language;
-- DROP TABLE IF EXISTS customer;
-- DELETE FROM schema_version where version = 2;