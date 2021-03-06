create database PixFourFun;
USE PixFourFun;

CREATE TABLE PerfilAcesso(
	IdPerfilAcesso INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    
    TipoPerfil VARCHAR(20)
);

INSERT INTO PerfilAcesso(TipoPerfil) VALUES
	('Padrão'),
    ('Administrador Geral'),
    ('Administrador');
    
CREATE TABLE Usuario(
	IdUsuario INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	IdPerfilAcesso int,
    FOREIGN KEY (IdPerfilAcesso) REFERENCES PerfilAcesso(IdPerfilAcesso),
    
    Nome VARCHAR(100),
    Email VARCHAR(40),
    Senha VARCHAR(50),
    Telefone VARCHAR(30),
    Rua VARCHAR(100),
	Numero VARCHAR(50),
	Complemento VARCHAR(50),
	CEP VARCHAR(50)
    );

CREATE TABLE Cupom(
	IdCupom INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    
    ValorDesconto FLOAT,
    DataValidade DATETIME,
    PalavraChave VARCHAR(100)
);

CREATE TABLE Foto(
	IdFoto INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    
    UrlImagem VARCHAR(512),
    FraseFoto VARCHAR(60)
);

CREATE TABLE Pack(
	IdPack  INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    IdFoto INT,
    FOREIGN KEY (IdFoto) REFERENCES Foto(IdFoto),
    
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
    FOREIGN KEY (IdPagamento) REFERENCES Pagamento(IdPagamento),
    
    StatusPedido VARCHAR(50)
);