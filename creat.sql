-- 1. Tabela CLIENTE
CREATE TABLE cliente (
    id_cliente SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf_cnpj VARCHAR(20) UNIQUE NOT NULL,
    telefone VARCHAR(15),
    endereco VARCHAR(255)
);

-- 2. Tabela VEICULO
CREATE TABLE veiculo (
    id_veiculo SERIAL PRIMARY KEY,
    placa VARCHAR(10) UNIQUE NOT NULL,
    marca VARCHAR(50),
    modelo VARCHAR(50),
    ano INT,
    id_cliente INT NOT NULL,
    CONSTRAINT fk_veiculo_cliente FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente) ON DELETE CASCADE
);

-- 3. Tabela EQUIPE
CREATE TABLE equipe (
    id_equipe SERIAL PRIMARY KEY,
    nome_equipe VARCHAR(50) NOT NULL
);

-- 4. Tabela MECANICO
CREATE TABLE mecanico (
    id_mecanico SERIAL PRIMARY KEY,
    codigo_mecanico VARCHAR(20) UNIQUE NOT NULL,
    nome VARCHAR(100) NOT NULL,
    endereco VARCHAR(255),
    especialidade VARCHAR(50),
    id_equipe INT,
    CONSTRAINT fk_mecanico_equipe FOREIGN KEY (id_equipe) REFERENCES equipe(id_equipe) ON DELETE SET NULL
);

-- 5. Tabela SERVICO (Catálogo de Referência)
CREATE TABLE servico (
    id_servico SERIAL PRIMARY KEY,
    descricao VARCHAR(255) NOT NULL,
    valor_mao_de_obra DECIMAL(10, 2) NOT NULL
);

-- 6. Tabela PECA (Catálogo)
CREATE TABLE peca (
    id_peca SERIAL PRIMARY KEY,
    descricao VARCHAR(255) NOT NULL,
    valor_peca DECIMAL(10, 2) NOT NULL
);

-- 7. Tabela OS (Ordem de Serviço)
CREATE TABLE os (
    id_os SERIAL PRIMARY KEY,
    numero_os INT UNIQUE NOT NULL,
    data_emissao DATE NOT NULL DEFAULT CURRENT_DATE,
    data_conclusao DATE,
    valor_total DECIMAL(10, 2) DEFAULT 0.00,
    status VARCHAR(20) DEFAULT 'Aberta',
    id_veiculo INT NOT NULL,
    id_equipe INT NOT NULL,
    CONSTRAINT fk_os_veiculo FOREIGN KEY (id_ve
