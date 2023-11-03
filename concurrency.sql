create database valores;

# Creación de una tabla de cuentas de muestra
CREATE TABLE if not exists cuentas (
id INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(50),
saldo DECIMAL(10, 2)
);

# Inserción de datos de muestra
INSERT INTO cuentas (nombre, saldo) VALUES ('Cuenta A', 1000.00);
INSERT INTO cuentas (nombre, saldo) VALUES ('Cuenta B', 2000.00);

#Ejercicio 1: Crea una tabla llamada cuentas con dos columnas: id y saldo. Realiza una
# transacción que retire $100 de una cuenta y deposite $100 en otra cuenta, asegurándote de que
# ambas operaciones se ejecuten en una única transacción para garantizar la propiedad de
# atomicidad.

START TRANSACTION;
UPDATE cuentas SET saldo = saldo - 100 WHERE id = 1;
UPDATE cuentas SET saldo = saldo + 100 WHERE id = 2;
COMMIT;

# ejercicio 3:
# Explora los diferentes niveles de aislamiento en MySQL (READ UNCOMMITTED, READ
# COMMITTED, REPEATABLE READ, SERIALIZABLE). Compara cómo se comporta una transacción en
# cada uno de estos niveles en términos de lecturas sucias, no repetibles y fantasma.

SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

# ejercicio 4:
# Realiza una serie de transacciones en las que insertas, actualizas y eliminas datos en
# una tabla. Luego, utiliza COMMIT para confirmar los cambios en una transacción y ROLLBACK para
# deshacer los cambios en otra transacción.
START TRANSACTION;
INSERT INTO cuentas (nombre, saldo) VALUES ('test 4', 200);
UPDATE cuentas SET saldo = 400 WHERE id = 3;
COMMIT;

START TRANSACTION;
DELETE FROM cuentas WHERE id = 3;
ROLLBACK;

select * from cuentas;