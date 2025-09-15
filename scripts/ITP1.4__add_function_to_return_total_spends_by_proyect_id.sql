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