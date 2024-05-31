CREATE TABLE IF NOT EXISTS Cliente (
    ID_Cliente INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(50),
    Apellido VARCHAR(50),
    Fecha_Nacimiento DATE,
    Dirección VARCHAR(100),
    Teléfono VARCHAR(20)
);

-- Tabla de Cuenta
CREATE TABLE IF NOT EXISTS Cuenta (
    ID_Cuenta INT AUTO_INCREMENT PRIMARY KEY,
    Tipo_Cuenta VARCHAR(50),
    Saldo DECIMAL(15, 2)
);

-- Tabla de Crédito
CREATE TABLE IF NOT EXISTS Credito (
    ID_Crédito INT AUTO_INCREMENT PRIMARY KEY,
    Límite_Crédito DECIMAL(15, 2),
    Saldo_Crédito DECIMAL(15, 2)
);

-- Tabla de Tipo de Transacción
CREATE TABLE IF NOT EXISTS Tipo_Transaccion (
    ID_Tipo_Transaccion INT AUTO_INCREMENT PRIMARY KEY,
    Descripción VARCHAR(50)
);

-- Tabla de Historial de Transacciones
CREATE TABLE IF NOT EXISTS Historial_Transacciones (
    ID_Transacción INT AUTO_INCREMENT PRIMARY KEY,
    ID_Cuenta_Crédito INT,
    ID_Tipo_Transaccion INT,
    Monto DECIMAL(15, 2),
    Fecha DATE,
    Hora TIME,
    FOREIGN KEY (ID_Cuenta_Crédito) REFERENCES Cuenta(ID_Cuenta) ON DELETE CASCADE,
    FOREIGN KEY (ID_Tipo_Transaccion) REFERENCES Tipo_Transaccion(ID_Tipo_Transaccion) ON DELETE CASCADE
);

-- Tabla de Relación Cliente-Cuenta
CREATE TABLE IF NOT EXISTS Relacion_Cliente_Cuenta (
    ID_Relación INT AUTO_INCREMENT PRIMARY KEY,
    ID_Cliente INT,
    ID_Cuenta INT,
    FOREIGN KEY (ID_Cliente) REFERENCES Cliente(ID_Cliente) ON DELETE CASCADE,
    FOREIGN KEY (ID_Cuenta) REFERENCES Cuenta(ID_Cuenta) ON DELETE CASCADE
);

-- Tabla de Relación Cliente-Crédito
CREATE TABLE IF NOT EXISTS Relacion_Cliente_Crédito (
    ID_Relación INT AUTO_INCREMENT PRIMARY KEY,
    ID_Cliente INT,
    ID_Crédito INT,
    FOREIGN KEY (ID_Cliente) REFERENCES Cliente(ID_Cliente) ON DELETE CASCADE,
    FOREIGN KEY (ID_Crédito) REFERENCES Credito(ID_Crédito) ON DELETE CASCADE
);

-- Datos para la tabla Cliente
INSERT INTO Cliente (Nombre, Apellido, Fecha_Nacimiento, Dirección, Teléfono) VALUES
('Juan', 'García', '1990-05-15', 'Calle Principal 123', '123-456-7890'),
('María', 'López', '1985-10-20', 'Avenida Central 456', '987-654-3210'),
('Pedro', 'Martínez', '1995-03-08', 'Plaza Mayor 789', '555-123-4567'),
('Ana', 'Rodríguez', '1988-07-12', 'Calle Secundaria 789', '999-888-7777'),
('Carlos', 'Pérez', '1976-12-03', 'Calle Lateral 456', '333-444-5555'),
('Laura', 'Sánchez', '1992-09-25', 'Avenida Norte 321', '222-333-4444'),
('Miguel', 'Gómez', '1983-04-30', 'Avenida Sur 987', '777-666-5555'),
('Sofía', 'Hernández', '1998-01-18', 'Calle Este 654', '111-222-3333'),
('Elena', 'Hernandez', '1979-06-22', 'Calle Oeste 147', '999-111-2222'),
('Diego', 'Fernández', '1993-11-11', 'Calle Central 369', '888-999-0000');

-- Datos para la tabla Cuenta
INSERT INTO Cuenta (Tipo_Cuenta, Saldo) VALUES
('Corriente', 1500.00),
('Ahorros', 2500.00),
('Corriente', 3000.00),
('Ahorros', 1800.00),
('Corriente', 5000.00),
('Ahorros', 4000.00),
('Corriente', 2000.00),
('Ahorros', 3500.00),
('Corriente', 2800.00),
('Ahorros', 3200.00);

-- Datos para la tabla Crédito
INSERT INTO Credito (Límite_Crédito, Saldo_Crédito) VALUES
(5000.00, 2000.00),
(3000.00, 1500.00),
(7000.00, 3000.00),
(4000.00, 1800.00),
(6000.00, 2500.00),
(4500.00, 2000.00),
(5500.00, 2200.00),
(3500.00, 1600.00),
(4800.00, 2300.00),
(5200.00, 2500.00);

-- Datos para la tabla Tipo_Transaccion
INSERT INTO Tipo_Transaccion (Descripción) VALUES
('Débito'),
('Crédito');

-- Datos para la tabla Historial_Transacciones
INSERT INTO Historial_Transacciones (ID_Cuenta_Crédito, ID_Tipo_Transaccion, Monto, Fecha, Hora) VALUES
(1, 1, 100.00, '2024-04-01', '12:30:00'),
(2, 2, 200.00, '2024-04-02', '10:45:00'),
(3, 1, 50.00, '2024-04-03', '14:20:00'),
(4, 2, 300.00, '2024-04-04', '09:15:00'),
(5, 1, 120.00, '2024-04-05', '16:55:00'),
(6, 2, 180.00, '2024-04-06', '11:10:00'),
(7, 1, 70.00, '2024-04-07', '13:40:00'),
(8, 2, 250.00, '2024-04-08', '08:20:00'),
(9, 1, 150.00, '2024-04-09', '17:30:00'),
(10, 2, 200.00, '2024-04-10', '10:00:00');

-- Datos para la tabla Relacion_Cliente_Cuenta
INSERT INTO Relacion_Cliente_Cuenta (ID_Cliente, ID_Cuenta) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);

-- Datos para la tabla Relacion_Cliente_Crédito
INSERT INTO Relacion_Cliente_Crédito (ID_Cliente, ID_Crédito) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);

-- Consultas solicitadas

-- 1.1. Seleccionar todos los datos de una tabla:
SELECT * FROM Cliente;

-- 1.2. Seleccionar datos específicos de una tabla:
SELECT Nombre, Apellido FROM Cliente;

-- 1.3. Seleccionar datos filtrados por una condición:
SELECT * FROM Cliente WHERE Nombre = 'Juan';

-- 1.4. Ordenar resultados en orden ascendente o descendente:
SELECT * FROM Cuenta ORDER BY Saldo DESC;

-- 1.5. Contar el número de filas en una tabla:
SELECT COUNT(*) FROM Cliente;

-- 1.6. Sumar valores de una columna:
SELECT SUM(Saldo) FROM Cuenta;

-- 1.7. Obtener el valor máximo y mínimo de una columna:
SELECT MAX(Saldo), MIN(Saldo) FROM Cuenta;

-- 1.8. Unir dos tablas usando INNER JOIN:
SELECT Cliente.Nombre, Cuenta.Saldo
FROM Cliente
INNER JOIN Cuenta ON Cliente.ID_Cliente = Cuenta.ID_Cuenta;

-- Consultas intermedias

-- 2.1. Consulta con JOIN y condiciones adicionales:
SELECT Cliente.Nombre AS Cliente, Cuenta.Tipo_Cuenta AS Tipo_Cuenta
FROM Cliente
JOIN Cuenta ON Cliente.ID_Cliente = Cuenta.ID_Cuenta
WHERE Cuenta.Saldo > 2000.00;

-- 2.2. Consulta con subconsultas correlacionadas:
SELECT Cliente.Nombre AS Cliente, Cliente.Fecha_Nacimiento
FROM Cliente
WHERE Cliente.Fecha_Nacimiento > (
    SELECT Fecha_Nacimiento FROM Cliente WHERE Nombre = 'Juan'
);

-- 2.3. Consulta con funciones de agregación y GROUP BY:
SELECT Cuenta.Tipo_Cuenta, AVG(Cuenta.Saldo) AS Saldo_Promedio
FROM Cliente
JOIN Cuenta ON Cliente.ID_Cliente = Cuenta.ID_Cuenta
GROUP BY Cuenta.Tipo_Cuenta;

-- 2.4. Consulta con funciones de fecha:
SELECT Nombre, Fecha_Nacimiento
FROM Cliente
WHERE YEAR(Fecha_Nacimiento) = 1990;

-- 2.5. Consulta con UNION para combinar resultados:
SELECT Nombre, 'Cliente' AS Tipo
FROM Cliente
UNION
SELECT Tipo_Cuenta, 'Cuenta' AS Tipo
FROM Cuenta;

-- 2.6. Consulta con operadores LIKE para búsqueda de texto parcial:
SELECT Nombre, Dirección
FROM Cliente
WHERE Dirección LIKE '%Avenida%';

-- 2.7. Consulta con subconsultas y operadores EXISTS o NOT EXISTS:
SELECT Nombre
FROM Cliente
WHERE EXISTS (
    SELECT 1 FROM Relacion_Cliente_Cuenta WHERE ID_Cliente = Cliente.ID_Cliente
);

-- 2.8. Consulta con ordenamiento y paginación:
SELECT Nombre, Apellido
FROM Cliente
ORDER BY Nombre ASC
OFFSET 2 ROWS FETCH NEXT 3 ROWS ONLY;