-- Agregar procedimientos almacenados de busqueda para las tablas 'worker' y 'proyect'.

DELIMITER $$
CREATE PROCEDURE sp_read_worker_by_name (
    IN input_name VARCHAR(200)
)
BEGIN
    SELECT * FROM worker WHERE name = input_name;
END$$

DELIMITER $$
CREATE PROCEDURE sp_read_proyect_by_worker_id (
    IN input_worker_id INT
)
BEGIN
    SELECT * FROM proyect WHERE worker_id = input_worker_id;
END$$

-- Agregar procedimientos almacenados de eliminación para las tablas 'worker' y 'proyect'.

DELIMITER $$
CREATE PROCEDURE sp_delete_worker_by_id (
    IN input_id INT
)
BEGIN
    DELETE FROM worker WHERE id = input_id;
END$$

DELIMITER $$
CREATE PROCEDURE sp_delete_proyect_by_id (
    IN input_id INT
)
BEGIN
    DELETE FROM proyect WHERE id = input_id;
END$$

-- Agregar procedimientos almacenados de actualizar para las tablas 'worker' y 'proyect'.

DELIMITER $$
CREATE PROCEDURE sp_update_worker_name_by_id (
    IN input_id INT,
    IN input_new_name VARCHAR(200)
)
BEGIN
    UPDATE worker SET name = input_new_name WHERE id = input_id;
END$$


DELIMITER $$
CREATE PROCEDURE sp_update_proyect_description_by_id (
    IN input_id INT,
    IN input_new_description VARCHAR(500)
)
BEGIN
    UPDATE proyect SET description = input_new_description WHERE id = input_id;
END$$