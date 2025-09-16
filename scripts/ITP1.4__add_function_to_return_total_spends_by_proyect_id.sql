-- Función para devolver el total de gastos por id de proyecto

USE itproyects;

DELIMITER $$
CREATE FUNCTION obtener_total_gastos_por_proyecto(p_project_id INT)
    RETURNS DECIMAL(10, 2)
    DETERMINISTIC
BEGIN
    DECLARE total_gasto DECIMAL(10, 2);
SELECT COALESCE(SUM(sp.value), 0) INTO total_gasto
FROM proyect py
         LEFT JOIN spend sp ON py.id = sp.proyect_id
WHERE py.id = p_project_id
GROUP BY py.id;
RETURN total_gasto;
END$$

INSERT INTO
    schema_version (version, version_name, created_date) VALUES(4,'ITP1.4__add_function_to_return_total_spends_by_proyect_id.sql', NOW());

-- ROLLBACK (Para eliminar la migración en caso de fallos de manera ordenada)
-- SET SQL_SAFE_UPDATES = 0;
-- USE itproyects;
-- DROP FUNCTION IF EXISTS obtener_total_gastos_por_proyecto;
-- DELETE FROM schema_version where version = 4;