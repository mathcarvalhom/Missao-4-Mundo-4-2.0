CREATE TABLE Drivers (
    DriverID INT PRIMARY KEY IDENTITY(1,1),
    Nome VARCHAR(100) NOT NULL,
    CNH VARCHAR(20) NOT NULL,
    Endereço VARCHAR(200),
    Contato VARCHAR(50)
);

CREATE TABLE Clients (
    ClientID INT PRIMARY KEY IDENTITY(1,1),
    Nome VARCHAR(100) NOT NULL,
    Empresa VARCHAR(100),
    Endereço VARCHAR(200),
    Contato VARCHAR(50)
);


CREATE TABLE Orders (
    OrderID INT PRIMARY KEY IDENTITY(1,1),
    ClientID INT NOT NULL,
    DriverID INT NOT NULL,
    DetalhesPedido TEXT,
    DataEntrega DATE,
    Status VARCHAR(50),
    FOREIGN KEY (ClientID) REFERENCES Clients(ClientID),
    FOREIGN KEY (DriverID) REFERENCES Drivers(DriverID)
);


INSERT INTO Drivers (Nome, CNH, Endereço, Contato)
VALUES ('Ana Maria', '1234567890', 'Rua 12, 85', '90000-0000'),
       ('Anderson Sousa', '0987654321', 'Rua das rosas, 1520', '95555-5555');


INSERT INTO Clients (Nome, Empresa, Endereço, Contato)
VALUES ('Livrando', 'Livrarias SA', 'Rua, das empresas, 2584', '98585-8585'),
       ('Carnes do Brasil', 'Carnes do Brasil e Comercio EIRELI', 'Parque Industrial, 2020', '96325-4185');


INSERT INTO Orders (ClientID, DriverID, DetalhesPedido, DataEntrega, Status)
VALUES (1, 1, 'Caixas de livros', '2024-11-03', 'Pendente'),
       (2, 2, 'Entrega de móveis', '2024-11-01', 'Entregue');


SELECT * FROM Drivers;

SELECT * FROM Clients;

SELECT * FROM Orders;

UPDATE Orders
SET Status = 'Entregue'
WHERE OrderID = 1;

DELETE FROM Clients
WHERE ClientID = 2;