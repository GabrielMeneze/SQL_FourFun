create database PixFourFun;
USE PixFourFun;
CREATE TABLE Usuario(
	IdUsuario INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    
    
    Nome VARCHAR(100),
    Email VARCHAR(40),
    Senha VARCHAR(50),
    Telefone VARCHAR(30)
    );

CREATE TABLE Cupom(
	IdCupom INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    
    
    ValorDesconto FLOAT,
    DataValidade DATETIME,
    PalavraChave VARCHAR(100)
);

CREATE TABLE Fotos(
	IdFotos INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    
    
    FraseFoto VARCHAR(60)
);

CREATE TABLE Pack(
	IdPack  INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    IdFotos INT,
    FOREIGN KEY (IdFotos) REFERENCES Fotos(IdFotos),
    
    
    TipoPack VARCHAR(15),
    Preco FLOAT
);

CREATE TABLE Pagamento(
	IdPagamento INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    IdUsuario int,
    FOREIGN KEY (IdUsuario) REFERENCES Usuario(IdUsuario),
    
    TipoPgto VARCHAR(50),
    ValorTotal FLOAT,
    TipoEnvio VARCHAR(80),
    StatusPgto VARCHAR(100)
);

CREATE TABLE Pedido(
	IdPedido INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    IdUsuario int,
    FOREIGN KEY (IdUsuario) REFERENCES Usuario(IdUsuario),
    IdPack int,
    FOREIGN KEY (IdPack) REFERENCES Pack(IdPack),
    IdCupom int,
	FOREIGN KEY (IdCupom) REFERENCES Cupom(IdCupom),
    IdPagamento int,
    FOREIGN KEY (IdPagamento) REFERENCES Pagamento(IdPagamento)
    
);


