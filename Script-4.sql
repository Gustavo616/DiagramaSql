CREATE TABLE Perfil (
   idPerfil integer PRIMARY KEY     not null,
   Nome            varchar     not null,
   Nivel_Acesso    integer     not null
);

CREATE TABLE Usuario (
   idUsuario integer PRIMARY KEY    not null,
   Perfil_idPerfil  integer     not null,
   Ativo               bool     not null,         
   Nome             varchar     not null,
   Login            varchar     not null,
   Senha            varchar     not null,
   Email            varchar     not NULL,
   foreign key (Perfil_idPerfil)
   REFERENCES  Perfil (idPerfil)
);

CREATE TABLE UnidadeMedia (
   idUnidadeMedia integer PRIMARY KEY     not null,
   Descricao         varchar     not null,
   Sigla             varchar     not null
);

CREATE TABLE Categoria (
   idCategoria integer PRIMARY KEY     not null,
   Descricao         varchar     not null,
   Observacao        varchar     not null
);

CREATE TABLE Cliente (
   idCliente integer PRIMARY KEY     not null,       
   Nome             varchar     not null,
   Data_Nascimento  varchar     not null,  
   Email            varchar     not null,
   Telefone         varchar     not null,
   Endereco         varchar     not null
);

CREATE TABLE Marca (
   idMarca integer PRIMARY KEY    not null,
   NomeMarca         varchar      not null
);

CREATE TABLE Cidade (
   idCidade integer PRIMARY KEY  NOT NULL,
   cidade           varchar      NOT NULL,
   estado           char(2)      NOT NULL
);

CREATE TABLE Compra (
   idCompra integer PRIMARY KEY  NOT NULL,
   Data_Compra      date         NOT NULL,
   Valor_Total_Compra real       NOT NULL,
   Prazo_Entrega    date         NOT NULL,
   Observacao       varchar      NOT NULL 
);

CREATE TABLE Produto (
   idProduto integer PRIMARY KEY    not null,
   Categoria_idCategoria  integer     not null,
   UnidadeMedia_idUnidadeMedia  integer     not null,        
   Nome             varchar     not null,
   Preco               real     not null,
   Codigo_Barra      bigint     not null,
   foreign key (Categoria_idCategoria)
   references Categoria (idCategoria),
   foreign key (UnidadeMedia_idUnidadeMedia)
   references UnidadeMedia (idUnidadeMedia)
);

CREATE TABLE Venda (
   idVenda integer PRIMARY KEY   not null,
   Cliente_idCliente integer     not null,
   Valor_Total_Venda    real     not null,
   Prazo_Entrega        date     not null,
   Observacao        varchar     not null,
   foreign key (Cliente_idCliente )
   references Cliente (idCliente)
);

CREATE TABLE Fonecedor (
   idFonecedor integer PRIMARY KEY NOT NULL,
   Cidade_idCidade   integer     NOT NULL,
   Nome              varchar     not null,
   Contato           varchar     not null,
   Telefone          varchar     not null,
   Email             varchar     not NULL,
   foreign key (Cidade_idCidade)
   references Cidade (idCidade)
);

CREATE TABLE Produto_has_Marca (
   idProdutoMarca integer PRIMARY KEY not null,
   Marca_idMarca     integer      not null,
   Produto_idMarca   integer      not null,
   foreign key (Marca_idMarca)
   references Marca (idMarca),
   foreign key (Produto_idMarca)
   references Produto (idProduto)
);

CREATE TABLE Produto_has_Marca_has_Venda (
   Venda_idVenda     integer     not null,
   Produto_has_Marca_idProdutoMarca integer not null,
   Produto_has_Marca_Marca_idMarca integer not null,
   Produto_has_Marca_Produto_idMarca integer not null,
   preco_venda_produto real      not null,
   preco_total_produto_venda real not null,
   foreign key (Venda_idVenda)
   REFERENCES Venda (idVenda),
   foreign key (Produto_has_Marca_idProdutoMarca)
   REFERENCES Produto_has_Marca (idProdutoMarca),
   foreign key (Produto_has_Marca_Marca_idMarca)
   REFERENCES Produto_has_Marca (Marca_idMarca),
   foreign key (Produto_has_Marca_Produto_idMarca)
   REFERENCES Produto_has_Marca (Produto_idMarca)
);
