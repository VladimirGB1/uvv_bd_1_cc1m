--Abrir o terminal
--Logar com o usuário root
mysql -u root -p
--Inserir a senha(No meu caso: computacao@raiz)

--Criar o banco de dados "cartorio"
CREATE DATABASE cartorio;

--usar o banco de dados "cartorio"
USE cartorio

--Criar as tabelas com os Scripts do PowerArchitect
CREATE TABLE tipos_cartorios (
                codigo_tipo   INT          NOT NULL,
                tipo          VARCHAR(50)  NOT NULL,
                PRIMARY KEY (codigo_tipo)
);


CREATE TABLE tipos_bancos_telefone (
                codigo_tipo   INT          NOT NULL,
                tipo          VARCHAR(50)  NOT NULL,
                PRIMARY KEY (codigo_tipo)
);


CREATE TABLE tipos_pessoas_telefone (
                codigo_tipo   INT          NOT NULL,
                tipo          VARCHAR(50)  NOT NULL,
                PRIMARY KEY (codigo_tipo)
);


CREATE TABLE tipos_imoveis (
                codigo_tipo   INT           NOT NULL,
                tipo          VARCHAR(50)   NOT NULL,
                PRIMARY KEY (codigo_tipo)
);


CREATE TABLE tipos_herdeiros_telefone (
                codigo_tipo   INT          NOT NULL,
                tipo          VARCHAR(50)  NOT NULL,
                PRIMARY KEY (codigo_tipo)
);


CREATE TABLE cep (
                cep  CHAR(8)  NOT NULL,
                PRIMARY KEY (cep)
);


CREATE TABLE uf (
                sigla   CHAR(2)       NOT NULL,
                nome    VARCHAR(100)  NOT NULL,
                PRIMARY KEY (sigla)
);


CREATE TABLE cidades (
                codigo_cidade   INT           NOT NULL,
                nome            VARCHAR(100)  NOT NULL,
                PRIMARY KEY (codigo_cidade)
);


CREATE TABLE bairros (
                codigo_bairro   INT           NOT NULL,
                nome            VARCHAR(100)  NOT NULL,
                PRIMARY KEY (codigo_bairro)
);


CREATE TABLE bancos (
                codigo_banco           INT            NOT NULL,
                nome                   VARCHAR(150)   NOT NULL,
                logradouro             VARCHAR(200)   NOT NULL,
                numero_endereco        INT            NOT NULL,
                complemento_endereco   VARCHAR(200)   NOT NULL,
                codigo_bairro          INT            NOT NULL,
                codigo_cidade          INT            NOT NULL,
                uf                     CHAR(2)        NOT NULL,
                cep                    CHAR(8)        NOT NULL,
                site                   VARCHAR(200),
                PRIMARY KEY (codigo_banco) 
);


CREATE TABLE bancos_telefone (
                codigo_banco   INT           NOT NULL,
                numero         VARCHAR(11)   NOT NULL,
                codigo_tipo    INT           NOT NULL,
                PRIMARY KEY (codigo_banco, numero)
);


CREATE TABLE imagens (
                codigo_imagem   INT            NOT NULL,
                nome            VARCHAR(150)   NOT NULL,
                descricao       VARCHAR(200)   NOT NULL,
                data_registro   DATE           NOT NULL,
                PRIMARY KEY (codigo_imagem)
);


CREATE TABLE cartorios (
                codigo_cartorio       INT            NOT NULL,
                nome                  VARCHAR(150)   NOT NULL,
                logradouro            VARCHAR(200)   NOT NULL,
                numero_endereco       INT            NOT NULL,
                complemeto_endereco   VARCHAR(200)   NOT NULL,
                codigo_bairro         INT            NOT NULL,
                codigo_cidade         INT            NOT NULL,
                uf                    CHAR(2)        NOT NULL,
                cep                   CHAR(8)        NOT NULL,
                codigo_tipo           INT            NOT NULL,
                nome_tebeliao         VARCHAR(50)    NOT NULL,
                horario_inicio        TIME           NOT NULL,
                horario_fim           TIME           NOT NULL,
                PRIMARY KEY (codigo_cartorio)
);


CREATE TABLE usam_cartorios (
                codigo_cartorio   INT   NOT NULL,
                codigo_imagem     INT   NOT NULL,
                PRIMARY KEY (codigo_cartorio, codigo_imagem)
);


CREATE TABLE herdeiros (
                codigo_herdeiro        INT            NOT NULL,
                nome                   VARCHAR(150)   NOT NULL,
                logradouro             VARCHAR(200)   NOT NULL,
                numero_endereco        INT            NOT NULL,
                complemento_endereco   VARCHAR(200)   NOT NULL,
                codigo_bairro          INT            NOT NULL,
                codigo_cidade          INT            NOT NULL,
                uf                     CHAR(2)        NOT NULL,
                cep                    CHAR(8)        NOT NULL,
                email                  VARCHAR(150),
                data_nascimento        DATE           NOT NULL,
                sexo                   CHAR(1)        NOT NULL,
                estado_civil           VARCHAR(50)    NOT NULL,
                PRIMARY KEY (codigo_herdeiro)
);


CREATE TABLE usam_herdeiros (
                codigo_herdeiro  INT   NOT NULL,
                codigo_imagem    INT   NOT NULL,
                PRIMARY KEY (codigo_herdeiro, codigo_imagem)
);


CREATE TABLE herdeiros_telefone (
                codigo_herdeiro   INT           NOT NULL,
                numero            VARCHAR(11)   NOT NULL,
                codigo_tipo       INT           NOT NULL,
                PRIMARY KEY (codigo_herdeiro, numero)
);


CREATE TABLE testamentos (
                codigo_testamento   INT            NOT NULL,
                numero_registro     INT            NOT NULL,
                data_registro       DATE           NOT NULL,
                descricao           VARCHAR(200)   NOT NULL,
                codigo_cartorio     INT            NOT NULL,
                PRIMARY KEY (codigo_testamento)
);


CREATE TABLE usam_testamentos (
                codigo_testamento   INT   NOT NULL,
                codigo_imagem       INT   NOT NULL,
                PRIMARY KEY (codigo_testamento, codigo_imagem)
);


CREATE TABLE envolvem (
                codigo_testamento   INT   NOT NULL,
                codigo_herdeiro     INT   NOT NULL,
                PRIMARY KEY (codigo_testamento, codigo_herdeiro)
);


CREATE TABLE testemunhas (
                codigo_testamento   INT            NOT NULL,
                testemunha_1        VARCHAR(150)   NOT NULL,
                testemunha_2        VARCHAR(150),
                testemunha_3        VARCHAR(150),
                PRIMARY KEY (codigo_testamento)
);


CREATE TABLE pessoas (
                codigo_pessoa          INT            NOT NULL,
                nome                   VARCHAR(150)   NOT NULL,
                logradouro             VARCHAR(200)   NOT NULL,
                numero_endereco        INT            NOT NULL,
                complemento_endereco   VARCHAR(200)   NOT NULL,
                codigo_bairro          INT            NOT NULL,
                codigo_cidade          INT            NOT NULL,
                uf                     CHAR(2)        NOT NULL,
                cep                    CHAR(8)        NOT NULL,
                data_nascimento        DATE           NOT NULL,
                sexo                   CHAR(1)        NOT NULL,
                estado_civil           VARCHAR(50)    NOT NULL,
                PRIMARY KEY (codigo_pessoa)
);


CREATE TABLE bens (
                codigo_bem             INT            NOT NULL,
                nome                   VARCHAR(150)   NOT NULL,
                valor_estimado         DECIMAL(14,2)  NOT NULL,
                data_disponibilidade   DATE           NOT NULL,
                codigo_pessoa          INT            NOT NULL,
                PRIMARY KEY (codigo_bem)
);


CREATE TABLE heranca (
                codigo_herdeiro   INT   NOT NULL,
                codigo_bem        INT   NOT NULL,
                PRIMARY KEY (codigo_herdeiro, codigo_bem)
);


CREATE TABLE registram (
                codigo_imagem     INT   NOT NULL,
                codigo_herdeiro   INT   NOT NULL,
                codigo_bem        INT   NOT NULL,
                PRIMARY KEY (codigo_imagem, codigo_herdeiro, codigo_bem)
);


CREATE TABLE imoveis (
                codigo_bem             INT            NOT NULL,
                logradouro             VARCHAR(200)   NOT NULL,
                numero_endereco        INT            NOT NULL,
                complemento_endereco   VARCHAR(200)   NOT NULL,
                codigo_bairro          INT            NOT NULL,
                codigo_cidade          INT            NOT NULL,
                uf                     CHAR(2)        NOT NULL,
                cep                    CHAR(8)        NOT NULL,
                tamanho                INT            NOT NULL,
                codigo_tipo            INT            NOT NULL,
                PRIMARY KEY (codigo_bem)
);


CREATE TABLE monetarios (
                codigo_bem   INT             NOT NULL,
                valor        DECIMAL(14,2)   NOT NULL,
                tipo_moeda   VARCHAR(50),
                PRIMARY KEY (codigo_bem)
);


CREATE TABLE gerenciam (
                codigo_banco   INT   NOT NULL,
                codigo_bem     INT   NOT NULL,
                PRIMARY KEY (codigo_banco, codigo_bem)
);


CREATE TABLE obras_de_arte (
                codigo_bem    INT            NOT NULL,
                autor         VARCHAR(150)   NOT NULL,
                ano_criacao   INT            NOT NULL,
                PRIMARY KEY (codigo_bem)
);


CREATE TABLE realizam (
                codigo_pessoa       INT   NOT NULL,
                codigo_testamento   INT   NOT NULL,
                PRIMARY KEY (codigo_pessoa, codigo_testamento)
);


CREATE TABLE pessoas_telefone (
                codigo_pessoa   INT           NOT NULL,
                numero          VARCHAR(11)   NOT NULL,
                codigo_tipo     INT           NOT NULL,
                PRIMARY KEY (codigo_pessoa, numero)
);

--Criar todas as relações entre as tabelas com os Scripts do PowerArchitect
ALTER TABLE  cartorios ADD CONSTRAINT tipos_cartorios_cartorios_fk
FOREIGN KEY                   (codigo_tipo)
REFERENCES   tipos_cartorios  (codigo_tipo)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE  bancos_telefone ADD CONSTRAINT tipos_bancos_telefone_bancos_telefone_fk
FOREIGN KEY                          (codigo_tipo)
REFERENCES   tipos_bancos_telefone   (codigo_tipo)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE  pessoas_telefone ADD CONSTRAINT tipos_pessoas_telefone_pessoas_telefone_fk
FOREIGN KEY                           (codigo_tipo)
REFERENCES   tipos_pessoas_telefone   (codigo_tipo)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE  imoveis ADD CONSTRAINT tipos_imoveis_imoveis_fk
FOREIGN KEY                  (codigo_tipo)
REFERENCES   tipos_imoveis   (codigo_tipo)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE  herdeiros_telefone ADD CONSTRAINT tipos_herdeiros_telefone_fk
FOREIGN KEY                             (codigo_tipo)
REFERENCES   tipos_herdeiros_telefone   (codigo_tipo)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE  pessoas ADD CONSTRAINT cep_pessoas_fk
FOREIGN KEY        (cep)
REFERENCES   cep   (cep)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE  herdeiros ADD CONSTRAINT cep_herdeiros_fk
FOREIGN KEY        (cep)
REFERENCES   cep   (cep)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE  cartorios ADD CONSTRAINT cep_cartorios_fk
FOREIGN KEY        (cep)
REFERENCES   cep   (cep)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE  imoveis ADD CONSTRAINT cep_imoveis_fk
FOREIGN KEY        (cep)
REFERENCES   cep   (cep)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE  bancos ADD CONSTRAINT cep_bancos_fk
FOREIGN KEY        (cep)
REFERENCES   cep   (cep)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE  pessoas ADD CONSTRAINT uf_pessoas_fk
FOREIGN KEY       (uf)
REFERENCES   uf   (sigla)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE  herdeiros ADD CONSTRAINT uf_herdeiros_fk
FOREIGN KEY       (uf)
REFERENCES   uf   (sigla)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE  cartorios ADD CONSTRAINT uf_cartorios_fk
FOREIGN KEY       (uf)
REFERENCES   uf   (sigla)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE  imoveis ADD CONSTRAINT uf_imoveis_fk
FOREIGN KEY       (uf)
REFERENCES   uf   (sigla)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE  bancos ADD CONSTRAINT uf_bancos_fk
FOREIGN KEY       (uf)
REFERENCES   uf   (sigla)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE  pessoas ADD CONSTRAINT cidades_pessoas_fk
FOREIGN KEY            (codigo_cidade)
REFERENCES   cidades   (codigo_cidade)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE  herdeiros ADD CONSTRAINT cidades_herdeiros_fk
FOREIGN KEY            (codigo_cidade)
REFERENCES   cidades   (codigo_cidade)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE  cartorios ADD CONSTRAINT cidades_cartorios_fk
FOREIGN KEY            (codigo_cidade)
REFERENCES   cidades   (codigo_cidade)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE  imoveis ADD CONSTRAINT cidades_imoveis_fk
FOREIGN KEY            (codigo_cidade)
REFERENCES   cidades   (codigo_cidade)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE  bancos ADD CONSTRAINT cidades_bancos_fk
FOREIGN KEY           (codigo_cidade)
REFERENCES   cidades  (codigo_cidade)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE  pessoas ADD CONSTRAINT bairros_pessoas_fk
FOREIGN KEY            (codigo_bairro)
REFERENCES   bairros   (codigo_bairro)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE  herdeiros ADD CONSTRAINT bairros_herdeiros_fk
FOREIGN KEY            (codigo_bairro)
REFERENCES   bairros   (codigo_bairro)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE  cartorios ADD CONSTRAINT bairros_cartorios_fk
FOREIGN KEY            (codigo_bairro)
REFERENCES   bairros   (codigo_bairro)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE  imoveis ADD CONSTRAINT bairros_imoveis_fk
FOREIGN KEY            (codigo_bairro)
REFERENCES   bairros   (codigo_bairro)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE  bancos ADD CONSTRAINT bairros_bancos_fk
FOREIGN KEY            (codigo_bairro)
REFERENCES   bairros   (codigo_bairro)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE  bancos_telefone ADD CONSTRAINT bancos_bancos_telefone_fk
FOREIGN KEY           (codigo_banco)
REFERENCES   bancos   (codigo_banco)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE  gerenciam ADD CONSTRAINT bancos_gerenciam_fk
FOREIGN KEY           (codigo_banco)
REFERENCES   bancos   (codigo_banco)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE  usam_cartorios ADD CONSTRAINT imagens_usam_cartorio_fk
FOREIGN KEY            (codigo_imagem)
REFERENCES   imagens   (codigo_imagem)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE  usam_herdeiros ADD CONSTRAINT imagens_usam_herdeiros_fk
FOREIGN KEY            (codigo_imagem)
REFERENCES   imagens   (codigo_imagem)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE  usam_testamentos ADD CONSTRAINT imagens_usam_testamentos_fk
FOREIGN KEY            (codigo_imagem)
REFERENCES   imagens   (codigo_imagem)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE  registram ADD CONSTRAINT imagens_registram_fk
FOREIGN KEY            (codigo_imagem)
REFERENCES   imagens   (codigo_imagem)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE  testamentos ADD CONSTRAINT cartorios_testamentos_fk
FOREIGN KEY              (codigo_cartorio)
REFERENCES   cartorios   (codigo_cartorio)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE  usam_cartorios ADD CONSTRAINT cartorios_usam_cartorio_fk
FOREIGN KEY              (codigo_cartorio)
REFERENCES   cartorios   (codigo_cartorio)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE  herdeiros_telefone ADD CONSTRAINT herdeiros_herdeiros_telefone_fk
FOREIGN KEY              (codigo_herdeiro)
REFERENCES   herdeiros   (codigo_herdeiro)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE  envolvem ADD CONSTRAINT herdeiros_envolvem_fk
FOREIGN KEY              (codigo_herdeiro)
REFERENCES   herdeiros   (codigo_herdeiro)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE  heranca ADD CONSTRAINT herdeiros_heranca_fk
FOREIGN KEY              (codigo_herdeiro)
REFERENCES   herdeiros   (codigo_herdeiro)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE  usam_herdeiros ADD CONSTRAINT herdeiros_usam_herdeiros_fk
FOREIGN KEY              (codigo_herdeiro)
REFERENCES   herdeiros   (codigo_herdeiro)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE  testemunhas ADD CONSTRAINT testamentos_testemunhas_fk
FOREIGN KEY                (codigo_testamento)
REFERENCES   testamentos   (codigo_testamento)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE  realizam ADD CONSTRAINT testamentos_realizam_fk
FOREIGN KEY                (codigo_testamento)
REFERENCES   testamentos   (codigo_testamento)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE  envolvem ADD CONSTRAINT testamentos_envolvem_fk
FOREIGN KEY                (codigo_testamento)
REFERENCES   testamentos   (codigo_testamento)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE  usam_testamentos ADD CONSTRAINT testamentos_usam_testamentos_fk
FOREIGN KEY                (codigo_testamento)
REFERENCES   testamentos   (codigo_testamento)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE  pessoas_telefone ADD CONSTRAINT pessoas_pessoas_telefone_fk
FOREIGN KEY            (codigo_pessoa)
REFERENCES   pessoas   (codigo_pessoa)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE  realizam ADD CONSTRAINT pessoas_realizam_fk
FOREIGN KEY            (codigo_pessoa)
REFERENCES   pessoas   (codigo_pessoa)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE  bens ADD CONSTRAINT pessoas_bens_fk
FOREIGN KEY            (codigo_pessoa)
REFERENCES   pessoas   (codigo_pessoa)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE  obras_de_arte ADD CONSTRAINT bens_obras_de_arte_fk
FOREIGN KEY         (codigo_bem)
REFERENCES   bens   (codigo_bem)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE  monetarios ADD CONSTRAINT bens_monetarios_fk
FOREIGN KEY         (codigo_bem)
REFERENCES   bens   (codigo_bem)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE  imoveis ADD CONSTRAINT bens_imoveis_fk
FOREIGN KEY         (codigo_bem)
REFERENCES   bens   (codigo_bem)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE  heranca ADD CONSTRAINT bens_heranca_fk
FOREIGN KEY         (codigo_bem)
REFERENCES   bens   (codigo_bem)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE  registram ADD CONSTRAINT heranca_registram_fk
FOREIGN KEY            (codigo_herdeiro, codigo_bem)
REFERENCES   heranca   (codigo_herdeiro, codigo_bem)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE  gerenciam ADD CONSTRAINT monetarios_gerenciam_fk
FOREIGN KEY               (codigo_bem)
REFERENCES   monetarios   (codigo_bem)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

--Criar regras de integridade
ALTER TABLE  pessoas    ADD CONSTRAINT   CHK_pessoas_sexo    CHECK(sexo = 'M' OR sexo = 'F');
ALTER TABLE  herdeiros  ADD CONSTRAINT   CHK_herdeiros_sexo  CHECK(sexo = 'M' OR sexo = 'F');
ALTER TABLE  pessoas    ADD CONSTRAINT   CHK_pessoas_EC      CHECK(estado_civil = 'solteiro' OR estado_civil = 'casado' OR estado_civil = 'separado' OR estado_civil = 'divorciado' OR estado_civil = 'viúvo');
ALTER TABLE  herdeiros    ADD CONSTRAINT   CHK_herdeiros_EC  CHECK(estado_civil = 'solteiro' OR estado_civil = 'casado' OR estado_civil = 'separado' OR estado_civil = 'divorciado' OR estado_civil = 'viúvo');


