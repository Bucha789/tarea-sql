
# Ejercicio 1: Crea un procedimiento almacenado llamado "ObtenerSaldo" que acepte el ID de una
# cuenta como parámetro y devuelva el saldo de esa cuenta. Luego, ejecuta el procedimiento para
# obtener el saldo de una cuenta específica.

DELIMITER //
CREATE PROCEDURE ObtenerSaldo(IN cuenta_id INT)
BEGIN
SELECT saldo FROM cuentas WHERE id = cuenta_id;
END;
//DELIMITER ;

# Ejecutar el procedimiento para obtener el saldo de la cuenta con ID 1
CALL ObtenerSaldo(1);

# Ejercicio 2: Crea una función llamada "CalcularInteres" que acepte un saldo y una tasa de interés
# como parámetros y devuelva el monto de interés. Luego, utiliza la función para calcular el interés
# de una cuenta con un saldo específico.

DELIMITER //
CREATE FUNCTION CalcularInteres(saldo DECIMAL(10, 2), tasa_interes DECIMAL(4, 2))
RETURNS DECIMAL(10, 2)
NO SQL
BEGIN
DECLARE interes DECIMAL(10, 2);
SET interes = saldo * (tasa_interes / 100);
RETURN interes;
END;
//DELIMITER ;

# Utilizar la función para calcular el interés de una cuenta con saldo $1000 y tasa de interés del 5%
SELECT CalcularInteres(1000.00, 5.00);

# Ejercicio 3: Crea un desencadenador (trigger) que se active antes de insertar un nuevo registro en
# una tabla llamada "registros" El desencadenador debe registrar la fecha y hora de la inserción en
# una tabla de auditoría llamada "auditoria_registros";

# Crear la tabla "registros";
CREATE TABLE registros (
id INT AUTO_INCREMENT PRIMARY KEY,
descripcion VARCHAR(255)
);

# Crear la tabla "auditoria_registros" para auditoría
CREATE TABLE auditoria_registros (
id INT AUTO_INCREMENT PRIMARY KEY,
fecha_hora TIMESTAMP,
accion VARCHAR(255)
);

# Crear el desencadenador (trigger) para el registro de inserciones
DELIMITER //
CREATE TRIGGER Registros_BeforeInsert
BEFORE INSERT ON registros
FOR EACH ROW
BEGIN
INSERT INTO auditoria_registros (fecha_hora, accion)
VALUES (NOW(), 'Nuevo registro insertado en la tabla registros');
END;
//DELIMITER ;

# Insertar un nuevo registro en la tabla "registros";
INSERT INTO registros (descripcion) VALUES ('Nuevo registro de ejemplo');

select * from auditoria_registros;