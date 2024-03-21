-- Tabla de Cliente
CREATE TABLE Cliente (
    ID_Cliente INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(50),
    Apellido VARCHAR(50),
    Fecha_Nacimiento DATE,
    Dirección VARCHAR(100),
    Teléfono VARCHAR(20)
);

-- Tabla de Cuenta
CREATE TABLE Cuenta (
    ID_Cuenta INT AUTO_INCREMENT PRIMARY KEY,
    Tipo_Cuenta VARCHAR(50),
    Saldo DECIMAL(15, 2)
);

-- Tabla de Crédito
CREATE TABLE Credito (
    ID_Crédito INT AUTO_INCREMENT PRIMARY KEY,
    Límite_Crédito DECIMAL(15, 2),
    Saldo_Crédito DECIMAL(15, 2)
);

-- Tabla de Historial de Transacciones
CREATE TABLE Historial_Transacciones (
    ID_Transacción INT AUTO_INCREMENT PRIMARY KEY,
    ID_Cuenta_Crédito INT,
    Tipo_Transacción VARCHAR(50),
    Monto DECIMAL(15, 2),
    Fecha DATE,
    Hora TIME,
    FOREIGN KEY (ID_Cuenta_Crédito) REFERENCES Cuenta(ID_Cuenta) ON DELETE CASCADE
);

-- Tabla de Relación Cliente-Cuenta
CREATE TABLE Relacion_Cliente_Cuenta (
    ID_Relación INT AUTO_INCREMENT PRIMARY KEY,
    ID_Cliente INT,
    ID_Cuenta INT,
    FOREIGN KEY (ID_Cliente) REFERENCES Cliente(ID_Cliente) ON DELETE CASCADE,
    FOREIGN KEY (ID_Cuenta) REFERENCES Cuenta(ID_Cuenta) ON DELETE CASCADE
);

-- Tabla de Relación Cliente-Crédito
CREATE TABLE Relacion_Cliente_Credito (
    ID_Relación INT AUTO_INCREMENT PRIMARY KEY,
    ID_Cliente INT,
    ID_Crédito INT,
    FOREIGN KEY (ID_Cliente) REFERENCES Cliente(ID_Cliente) ON DELETE CASCADE,
    FOREIGN KEY (ID_Crédito) REFERENCES Credito(ID_Crédito) ON DELETE CASCADE
);
