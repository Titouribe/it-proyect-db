DELIMITER $$
CREATE PROCEDURE sp_insert_position (
    IN name VARCHAR(150),
    IN created_date DATETIME
)
BEGIN
    INSERT INTO position (name, created_date)
    VALUES (name, created_date);
END$$

DELIMITER $$
CREATE PROCEDURE sp_insert_spend_type (
    IN name VARCHAR(150),
    IN created_date DATETIME
)
BEGIN
    INSERT INTO spend_type (name, created_date)
    VALUES (name, created_date);
END$$

DELIMITER $$
CREATE PROCEDURE sp_insert_customer (
    IN name VARCHAR(200),
    IN created_date DATETIME
)
BEGIN
    INSERT INTO customer (name, created_date)
    VALUES (name, created_date);
END$$

DELIMITER $$
CREATE PROCEDURE sp_insert_worker (
    IN name VARCHAR(200),
    IN last_name VARCHAR(200),
    IN title VARCHAR(200),
    IN personal_identification VARCHAR(20),
    IN years_of_experience INT,
    IN is_active BOOLEAN,
    IN is_chief BOOLEAN,
    IN salary_per_hour INT,
    IN position_id INT,
    IN created_date DATETIME
)
BEGIN
    INSERT INTO worker (name, last_name, title, personal_identification,
    years_of_experience, is_active, is_chief, salary_per_hour, position_id, created_date)
    VALUES (name, last_name, title, personal_identification,
    years_of_experience, is_active, is_chief, salary_per_hour, position_id, created_date);
END$$

DELIMITER $$
CREATE PROCEDURE sp_insert_proyect (
    IN name VARCHAR(200),
    IN description VARCHAR(500),
    IN forecast INT,
    IN start_date DATETIME,
    IN end_date DATETIME,
    IN estimated_hours INT,
    IN customer_id INT,
    IN worker_id INT,
    IN created_date DATETIME
)
BEGIN
    INSERT INTO proyect (name, description, forecast, start_date,
    end_date, estimated_hours, customer_id, worker_id, created_date)
    VALUES (name, description, forecast, start_date,
    end_date, estimated_hours, customer_id, worker_id, created_date);
END$$

DELIMITER $$
CREATE PROCEDURE sp_insert_spend (
    IN name VARCHAR(200),
    IN description VARCHAR(500),
    IN date DATETIME,
    IN proyect_id INT,
    IN value INT,
    IN spend_type_id INT,
    IN created_date DATETIME
)
BEGIN
    INSERT INTO spend (name, description, date, proyect_id, value, spend_type_id, created_date)
    VALUES (name, description, date, proyect_id, value, spend_type_id, created_date);
END$$

CALL sp_insert_position ('Profesor', NOW());
CALL sp_insert_position ('Programador', NOW());
CALL sp_insert_position ('Analista', NOW());

CALL sp_insert_spend_type ('Ropa', NOW());
CALL sp_insert_spend_type ('Viaje', NOW());
CALL sp_insert_spend_type ('Comida', NOW());

CALL sp_insert_customer ('Colanta', NOW());
CALL sp_insert_customer ('Argos', NOW());
CALL sp_insert_customer ('New balance', NOW());

CALL sp_insert_worker ('Jorge', 'Uribe', 'Ingeniero BackEnd', '010101', 3, b'1', b'1', 150, 1, NOW());
CALL sp_insert_worker ('Santiago', 'Valencia', 'Ingeniero FrontEnd', '010102', 2, b'1', b'1', 200, 1, NOW());
CALL sp_insert_worker ('Yuleny', 'Pemberty', 'Ingeniero FullStack', '010103', 5, b'1', b'1', 350, 1, NOW());

CALL sp_insert_proyect ('Colanta administrador de rutas', 'Administrador de rutas de entrega de productos lacteos', 10000, '2025-09-14 00:00:00',
'2026-09-14 00:00:00', 400, 1, 1, NOW());
CALL sp_insert_proyect ('Colanta administrador de inventario', 'Administrador de inventario de productos', 20000, '2025-09-09 00:00:00',
'2026-09-09 00:00:00', 600, 2, 1, NOW());
CALL sp_insert_proyect ('Colanta compras online', 'E-Commerce para productos lacteos de Colanta', 25000, '2025-09-10 00:00:00',
'2026-09-10 00:00:00', 350, 3, 1, NOW());
CALL sp_insert_proyect ('Argos administrador de rutas de entrega de cemento', 'Administrador de rutas de entrega de cemento', 5000, '2026-09-01 00:00:00',
'2027-09-01 00:00:00', 300, 1, 1, NOW());
CALL sp_insert_proyect ('Argos administrador de inventario de productos', 'Administrador de inventario de productos', 30000, '2025-09-11 00:00:00',
'2026-09-11 00:00:00', 550, 2, 1, NOW());
CALL sp_insert_proyect ('Argos compras online', 'E-Commerce para productos de construcción', 50000, '2025-09-12 00:00:00',
'2026-09-10 00:00:00', 300, 3, 1, NOW());
CALL sp_insert_proyect ('New balance administrador de nuevas colecciones', 'Administrador de nuevas colecciones por pais', 15000, '2025-09-09 00:00:00',
'2026-09-09 00:00:00', 450, 1, 1, NOW());
CALL sp_insert_proyect ('New balance administrador de inventario', 'Administrador de inventario de productos', 20000, '2025-09-09 00:00:00',
'2026-09-09 00:00:00', 600, 2, 1, NOW());
CALL sp_insert_proyect ('New balance compras online', 'E-Commerce de tienda de ropa New balance', 25000, '2025-09-10 00:00:00',
'2026-09-10 00:00:00', 350, 3, 1, NOW());
  
CALL sp_insert_spend ('Camisa estampada', 'Camisa para el trabajo', NOW(), 1, 300, 1, NOW());
CALL sp_insert_spend ('Viaje para revisar propuesta', 'viaje revisar propuesta', NOW(), 1, 400, 2, NOW());
CALL sp_insert_spend ('Cena con el cliente', 'Cena', NOW(), 1, 500, 3, NOW());
CALL sp_insert_spend ('Camisa estampada', 'Camisa para el trabajo', NOW(), 2, 1200, 1, NOW());
CALL sp_insert_spend ('Viaje para revisar propuesta', 'viaje revisar propuesta', NOW(), 2, 1400, 2, NOW());
CALL sp_insert_spend ('Cena con el cliente', 'Cena', NOW(), 2, 1500, 3, NOW());
CALL sp_insert_spend ('Camisa estampada', 'Camisa para el trabajo', NOW(), 3, 600, 1, NOW());
CALL sp_insert_spend ('Viaje para revisar propuesta', 'viaje revisar propuesta', NOW(), 3, 800, 2, NOW());
CALL sp_insert_spend ('Cena con el cliente', 'Cena', NOW(), 3, 900, 3, NOW());
CALL sp_insert_spend ('Camisa estampada', 'Camisa para el trabajo', NOW(), 4, 300, 1, NOW());
CALL sp_insert_spend ('Viaje para revisar propuesta', 'viaje revisar propuesta', NOW(), 4, 400, 2, NOW());
CALL sp_insert_spend ('Cena con el cliente', 'Cena', NOW(), 4, 500, 3, NOW());
CALL sp_insert_spend ('Camisa estampada', 'Camisa para el trabajo', NOW(), 5, 300, 1, NOW());
CALL sp_insert_spend ('Viaje para revisar propuesta', 'viaje revisar propuesta', NOW(), 5, 400, 2, NOW());
CALL sp_insert_spend ('Cena con el cliente', 'Cena', NOW(), 5, 500, 3, NOW());
CALL sp_insert_spend ('Camisa estampada', 'Camisa para el trabajo', NOW(), 6, 1200, 1, NOW());
CALL sp_insert_spend ('Viaje para revisar propuesta', 'viaje revisar propuesta', NOW(), 6, 1400, 2, NOW());
CALL sp_insert_spend ('Cena con el cliente', 'Cena', NOW(), 6, 1500, 3, NOW());
CALL sp_insert_spend ('Camisa estampada', 'Camisa para el trabajo', NOW(), 7, 1200, 1, NOW());
CALL sp_insert_spend ('Viaje para revisar propuesta', 'viaje revisar propuesta', NOW(), 7, 1400, 2, NOW());
CALL sp_insert_spend ('Cena con el cliente', 'Cena', NOW(), 7, 1500, 3, NOW());
CALL sp_insert_spend ('Camisa estampada', 'Camisa para el trabajo', NOW(), 8, 600, 1, NOW());
CALL sp_insert_spend ('Viaje para revisar propuesta', 'viaje revisar propuesta', NOW(), 8, 800, 2, NOW());
CALL sp_insert_spend ('Cena con el cliente', 'Cena', NOW(), 8, 900, 3, NOW());
CALL sp_insert_spend ('Camisa estampada', 'Camisa para el trabajo', NOW(), 9, 600, 1, NOW());
CALL sp_insert_spend ('Viaje para revisar propuesta', 'viaje revisar propuesta', NOW(), 9, 800, 2, NOW());
CALL sp_insert_spend ('Cena con el cliente', 'Cena', NOW(), 9, 900, 3, NOW());