
CREATE TABLE Motoristas (
    id INT PRIMARY KEY IDENTITY(1,1),
    nome NVARCHAR(100) NOT NULL,
    cargo NVARCHAR(100) NOT NULL,
    salario DECIMAL(10, 2) NOT NULL,
);

CREATE TABLE Veiculos (
    id INT PRIMARY KEY IDENTITY(1,1),
    modelo NVARCHAR(100) NOT NULL,
    ano INT NOT NULL,
    placa NVARCHAR(10) NOT NULL,
    motoristas_id INT,
    FOREIGN KEY (motoristas_id) REFERENCES Motoristas(id)
);

CREATE TABLE Entregas (
    id INT PRIMARY KEY IDENTITY(1,1),
    data_entrega DATE NOT NULL,
    veiculo_id INT,
    FOREIGN KEY (veiculo_id) REFERENCES Veiculos(id)
);

CREATE TABLE Clientes (
    id INT PRIMARY KEY IDENTITY(1,1),
    nome NVARCHAR(100) NOT NULL,
    endereco NVARCHAR(255) NOT NULL,
    telefone NVARCHAR(15) NOT NULL
);

CREATE TABLE Produtos (
    id INT PRIMARY KEY IDENTITY(1,1),
    nome NVARCHAR(100) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL,
    quantidade INT NOT NULL
);

CREATE TABLE Pedidos (
    id INT PRIMARY KEY IDENTITY(1,1),
    data_pedido DATE NOT NULL,
    cliente_id INT,
    FOREIGN KEY (cliente_id) REFERENCES Clientes(id)
);

CREATE TABLE Itens_Pedido (
    id INT PRIMARY KEY IDENTITY(1,1),
    pedido_id INT,
    produto_id INT,
    quantidade INT NOT NULL,
    FOREIGN KEY (pedido_id) REFERENCES Pedidos(id),
    FOREIGN KEY (produto_id) REFERENCES Produtos(id)
);