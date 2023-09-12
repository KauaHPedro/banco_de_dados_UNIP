--Questão 01:
CREATE DATABASE "EXERCICIO_02"
ENCODING = 'UTF-8'
TEMPLATE = TEMPLATE0
TABLESPACE = pg_default
OWNER = postgres

--Questão 02:
CREATE TABLE tb_editoras (
	id_editora INT,
	cnpj VARCHAR(30),
	razao_social VARCHAR (60),
	fg_ativo INT,
	
	CONSTRAINT pk_tb_editoras_id_editora PRIMARY KEY (id_editora)
);

CREATE TABLE tb_estados (
	id_estado INT,
	nm_estado VARCHAR(60),
	sigla CHAR(2),
	fg_ativo INT,
	CONSTRAINT pk_tb_estados_id_estado PRIMARY KEY (id_estado)
);

CREATE TABLE tb_autores (
	id_autor INT,
	nm_autor VARCHAR(60),
	cpf VARCHAR(12),
	rg VARCHAR (12),
	fg_ativo INT,
	CONSTRAINT pk_tb_autores_id_autor PRIMARY KEY (id_autor)
);

CREATE TABLE tb_categorias (
	id_categoria INT,
	ds_categoria VARCHAR(40),
	fg_ativo INT,
	CONSTRAINT pk_tb_categorias_id_categoria PRIMARY KEY (id_categoria)
);

CREATE TABLE tb_cidades (
	id_cidade INT,
	id_estado INT,
	nm_cidade VARCHAR(60),
	fg_ativo INT,
	CONSTRAINT pk_tb_cidades_id_cidade PRIMARY KEY (id_cidade),
	CONSTRAINT fk_tb_cidades_id_estado FOREIGN KEY (id_estado) REFERENCES tb_estados (id_estado)
);

CREATE TABLE tb_enderecos_editoras (
	id_endereco INT,
	id_editora INT,
	id_cidade INT,
	ds_endereco VARCHAR (40),
	rua VARCHAR (60),
	numero VARCHAR (5),
	complemento VARCHAR (20),
	bairro VARCHAR (45),
	cep VARCHAR (10),
	fg_ativo INT,
	CONSTRAINT pk_tb_enderecos_editoras_id_endereco_id_editora PRIMARY KEY (id_endereco, id_editora),
	CONSTRAINT fk_tb_enderecos_editoras_id_editora FOREIGN KEY (id_editora) REFERENCES tb_editoras (id_editora),
	CONSTRAINT fk_tb_enderecos_editoras_id_cidade FOREIGN KEY (id_cidade) REFERENCES tb_cidades (id_cidade)
);

CREATE TABLE tb_enderecos_autores (
	id_endereco INT,
	id_autor INT,
	id_cidade INT,
	ds_endereco VARCHAR (40),
	rua VARCHAR (60),
	numero VARCHAR (5),
	complemento VARCHAR (20),
	bairro VARCHAR (45),
	cep VARCHAR (10),
	fg_ativo INT,
	CONSTRAINT pk_tb_enderecos_autores_id_endereco_id_autor PRIMARY KEY (id_endereco, id_autor),
	CONSTRAINT fk_tb_enderecos_autores_id_autor FOREIGN KEY (id_autor) REFERENCES tb_autores (id_autor),
	CONSTRAINT fk_tb_enderecos_autores_id_cidade FOREIGN KEY (id_cidade) REFERENCES tb_cidades (id_cidade)
);

CREATE TABLE tb_enderecos_editoras (
	id_endereco INT,
	id_editora INT,
	id_cidade INT,
	ds_endereco VARCHAR (40),
	rua VARCHAR (60),
	numero VARCHAR (5),
	complemento VARCHAR (20),
	bairro VARCHAR (45),
	cep VARCHAR (10),
	fg_ativo INT,
	CONSTRAINT pk_tb_enderecos_editoras_id_endereco_id_editora PRIMARY KEY (id_endereco, id_editora),
	CONSTRAINT fk_tb_enderecos_editoras_id_editora FOREIGN KEY (id_editora) REFERENCES tb_editoras (id_editora),
	CONSTRAINT fk_tb_enderecos_editoras_id_cidade FOREIGN KEY (id_cidade) REFERENCES tb_cidades (id_cidade)
);

CREATE TABLE tb_livros (
	id_livro INT,
	id_categoria INT,
	id_autor INT,
	id_editora INT,
	isbn VARCHAR (30),
	titulo VARCHAR (60),
	preco DECIMAL (7,2),
	fg_ativo INT,
	CONSTRAINT pk_tb_livros_id_livro PRIMARY KEY (id_livro),
	CONSTRAINT fk_tb_livros_id_categoria FOREIGN KEY (id_categoria) REFERENCES tb_categorias (id_categoria),
	CONSTRAINT fk_tb_livros_id_autor FOREIGN KEY (id_autor) REFERENCES tb_autores (id_autor),
	CONSTRAINT fk_tb_livros_id_editora FOREIGN KEY (id_editora) REFERENCES tb_editoras (id_editora)
);

--Questão 03:
INSERT INTO tb_editoras (id_editora, cnpj, razao_social, fg_ativo) VALUES
(1, '01.222.111/0001-99', 'EMPRESA TESTE A', 1),
(2, '33.444.898/0004-00', 'EMPRESA TESTE B', 1),
(3, '66.232.111/0001-03', 'EMPRESA TESTE C', 1);

--Questão 04:
INSERT INTO tb_estados (id_estado, nm_estado, sigla, fg_ativo) VALUES
(1, 'SÃO PAULO', 'SP', 1),
(2, 'RIO DE JANEIRO', 'RJ', 1),
(3, 'SANTA CATARINA', 'SC', 1);

--Questão 05:
INSERT INTO tb_autores (id_autor, nm_autor, cpf, rg, fg_ativo) VALUES
(1, 'ADÉLIO MACHADO', '22299923433', '223363308', 1),
(2, 'CARLOS LACERDA', '11122233344', '998887776', 1),
(3, 'FREI BETTO', '34512398712', '009998881', 1);

--Questão 06:
INSERT INTO tb_categorias (id_categoria, ds_categoria, fg_ativo) VALUES
(1, 'INFORMÁTICA', 1),
(2, 'DIREITO', 1),
(3, 'AUTO AJUDA', 1);

--Questão 07:
INSERT INTO tb_cidades (id_cidade, id_estado, nm_cidade, fg_ativo) VALUES
(1, 1, 'RIBEIRÃO PRETO', 1),
(2, 2, 'RESENDE', 1),
(3, 3, 'FLORIANÓPOLIS', 1);

--Questão 08:
INSERT INTO tb_enderecos_editoras (id_endereco, id_editora, id_cidade, ds_endereco, rua, numero, complemento, bairro, cep, fg_ativo)
VALUES
(1, 1, 1, 'COMERCIAL', 'AV NOVE DE JULHO', '123', null, 'CENTRO', '14015-170', 1),
(2, 2, 2, 'COMERCIAL', 'RUA RUI BARBOSA', '987', 'SALA 10A', 'JARDIM NUNES', '34045-980', 1),
(3, 3, 3, 'COMERCIAL', 'AV DAS NAÇÕES UNIDAS', '12551', null, 'BROOKLIN NOVO', '36471-320', 1);

--Questão 09:
INSERT INTO tb_enderecos_autores (id_endereco, id_autor, id_cidade, ds_endereco, rua, numero, complemento, bairro, cep, fg_ativo)
VALUES
(1, 1, 1, 'RESIDENCIAL', 'RUA BONFIM', '123', 'Apto 408', 'SUMAREZINHO', '14100-901', 1),
(2, 2, 2, 'RESIDENCIAL', 'AV JOÃO FIUZA', '9876', null, 'HIGIENÓPOLIS', '78977-902', 1),
(3, 3, 3, 'RESIDENCIAL', 'AV SENADOR CÉSAR VERGUEIRO', '100', 'Casa', 'JARDINS', '78977-903', 1);

--Questão 10:
INSERT INTO tb_livros (id_livro, id_editora, id_autor, id_categoria, isbn, titulo, preco, fg_ativo)
VALUES
(1, 1, 1, 1, '8521201230', 'DESENVOLVIMENTO PARA WEB COM NODE JS', 120.1, 1),
(2, 2, 2, 2, '9788502070066', 'DIREITO CONSTITUCIONAL ESQUEMATIZADO', 69.3, 1),
(3, 3, 3, 3, '8535218920', 'O SEU ÚTIMO LIVRO DE AUTO-AJUDA, REPRIMA SUA RAIVA', 39.78, 1);

--Questão 11:
SELECT A.isbn, A.titulo, B.razao_social, C.ds_categoria, D.nm_autor, A.preco FROM tb_livros A
INNER JOIN tb_editoras B ON A.id_editora = B.id_editora
INNER JOIN tb_categorias C ON A.id_categoria = C.id_categoria 
INNER JOIN tb_autores D ON A.id_autor = D.id_autor
WHERE A.fg_ativo = 1 AND B.fg_ativo = 1 AND C.fg_ativo = 1 AND D.fg_ativo = 1
ORDER BY A.titulo;

--Questão 12:
SELECT A.ds_categoria, COUNT(*) FROM tb_categorias A
INNER JOIN tb_livros B ON A.id_categoria = B.id_categoria
WHERE A.fg_ativo = 1 AND B.fg_ativo = 1
GROUP BY A.id_categoria;

--Questão 13:
SELECT SUM (B.preco) AS "Soma dos Valores" FROM tb_categorias A
INNER JOIN tb_livros B ON A.id_categoria = B.id_categoria
WHERE B.id_categoria IN (1, 2) AND A.fg_ativo = 1 AND B.fg_ativo = 1;

--Questão 14:
SELECT A.isbn, A.titulo, B.ds_categoria, A.preco  FROM tb_livros A
INNER JOIN tb_categorias B ON A.id_categoria = B.id_categoria 
WHERE A.preco NOT BETWEEN 35.0 AND 80.0
AND A.fg_ativo = 1
ORDER BY A.preco;

--Questão 15:
SELECT A.isbn, A.titulo, B.razao_social, C.ds_categoria, D.nm_autor, A.preco FROM tb_livros A
INNER JOIN tb_editoras B ON A.id_editora = B.id_editora 
INNER JOIN tb_categorias C ON A.id_categoria = C.id_categoria 
INNER JOIN tb_autores D ON A.id_autor = D.id_autor
WHERE C.id_categoria NOT IN (1, 2) AND
A.fg_ativo = 1 AND B.fg_ativo = 1 AND C.fg_ativo = 1 AND D.fg_ativo = 1;

--Questão 16:
CREATE TABLE tb_usuarios (
	user_name VARCHAR (25),
	nm_usuario VARCHAR (60),
	password VARCHAR(30),
	fg_ativo INT
);

INSERT INTO tb_usuarios (user_name, nm_usuario, password, fg_ativo) VALUES
('user_teste1', 'João', MD5('Senha1'), 1),
('user_teste2', 'Helena', MD5('Senha2'), 1);

--Alterando o campo de senha para 32 caracteres, pois a criptografia MD5 gera um Hash fixo de 128 bits
ALTER TABLE tb_usuarios
ALTER COLUMN password TYPE VARCHAR(32);

--Utilizando Subquery para trazer os dois usuários baseado em suas senhas originais, conforme solicitado na questão.
SELECT * FROM tb_usuarios
WHERE password IN (SELECT password FROM tb_usuarios WHERE password IN (MD5('Senha1'), md5('Senha2')));

