-- Creación de trigger o "gatillo" que se ejecuta cuando se actualiza un trabajador para almacenar la información anterior

DELIMITER $$
CREATE TRIGGER trigger_worker_update_copy
AFTER UPDATE ON worker
FOR EACH ROW
BEGIN
    INSERT INTO copy_worker_updateUU (
        id,
        name,
        last_name,
        title,
        years_of_experience,
        personal_identification,
        is_active,
        is_chief,
        salary_per_hour,
        position_id,
        created_date,
        update_date
    )
    VALUES (
        OLD.id,
        OLD.name,
        OLD.last_name,
        OLD.title,
        OLD.years_of_experience,
        OLD.personal_identification,
        OLD.is_active,
        OLD.is_chief,
        OLD.salary_per_hour,
        OLD.position_id,
        OLD.created_date,
        NOW()
    );
END$$

-- Creación de trigger o "gatillo" que se ejecuta cuando se elimina un trabajador para almacenar la información anterior

DELIMITER $$
CREATE TRIGGER trigger_worker_deletion_copy
AFTER DELETE ON worker
FOR EACH ROW
BEGIN
    INSERT INTO copy_worker_deletionUU (
        id,
        name,
        last_name,
        title,
        years_of_experience,
        personal_identification,
        is_active,
        is_chief,
        salary_per_hour,
        position_id,
        created_date,
        update_date
    )
    VALUES (
        OLD.id,
        OLD.name,
        OLD.last_name,
        OLD.title,
        OLD.years_of_experience,
        OLD.personal_identification,
        OLD.is_active,
        OLD.is_chief,
        OLD.salary_per_hour,
        OLD.position_id,
        OLD.created_date,
        NOW()
    );
END$$

-- Creación de trigger o "gatillo" que se ejecuta cuando se actualiza un lenguaje de programación para almacenar la información anterior

DELIMITER $$
CREATE TRIGGER trigger_programming_language_update_copy
AFTER UPDATE ON worker
FOR EACH ROW
BEGIN
    INSERT INTO copy_programming_language_updateUU (
        id,
        name,
        created_date,
        update_date
    )
    VALUES (
        OLD.id,
        OLD.name,
        OLD.created_date,
        NOW()
    );
END$$

-- Creación de trigger o "gatillo" que se ejecuta cuando se elimina un lenguaje de programación para almacenar la información anterior

DELIMITER $$
CREATE TRIGGER trigger_programming_language_deletion_copy
AFTER DELETE ON worker
FOR EACH ROW
BEGIN
    INSERT INTO copy_programming_language_deletionUU (
        id,
        name,
        created_date,
        update_date
    )
    VALUES (
        OLD.id,
        OLD.name,
        OLD.created_date,
        NOW()
    );
END$$