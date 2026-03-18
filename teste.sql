-- 1. Inserindo Clientes
INSERT INTO cliente (nome, cpf_cnpj, telefone, endereco) VALUES
('João Silva', '111.222.333-44', '(11) 98888-7777', 'Rua das Flores, 123'),
('Dolp Engenharia', '12.345.678/0001-90', '(11) 3333-4444', 'Av. Central, 1000'),
('Energisa S/A', '98.765.432/0001-10', '(11) 4444-5555', 'Rodovia Principal, Km 5');

-- 2. Inserindo Veículos
INSERT INTO veiculo (placa, marca, modelo, ano, id_cliente) VALUES
('ABC-1234', 'Fiat', 'Argo', 2021, 1),
('DLP-0001', 'Chevrolet', 'S10', 2023, 2), 
('ENG-9999', 'Toyota', 'Hilux', 2022, 3); 

-- 3. Inserindo Equipes
INSERT INTO equipe (nome_equipe) VALUES
('Equipe Alfa - Manutenção Leve'),
('Equipe Beta - Diesel e Pesados');

-- 4. Inserindo Mecânicos
INSERT INTO mecanico (codigo_mecanico, nome, endereco, especialidade, id_equipe) VALUES
('MEC-001', 'Carlos Souza', 'Rua A, 10', 'Suspensão e Freios', 1),
('MEC-002', 'Roberto Alves', 'Rua B, 20', 'Motor', 1),
('MEC-003', 'Fernanda Lima', 'Rua C, 30', 'Injeção Eletrônica', 2);

-- 5. Inserindo Serviços no Catálogo Base
INSERT INTO servico (descricao, valor_mao_de_obra) VALUES
('Troca de Óleo e Filtros', 50.00),
('Alinhamento e Balanceamento', 120.00),
('Revisão Geral de Freios', 250.00);

-- 6. Inserindo Peças no Catálogo Base
INSERT INTO peca (descricao, valor_peca) VALUES
('Óleo Sintético 5W30 (Litro)', 45.00),
('Filtro de Óleo', 35.00),
('Pastilha de Freio (Par)', 150.00),
('Pneu Aro 15', 380.00);

-- 7. Emitindo Ordens de Serviço (OS)
INSERT INTO os (numero_os, data_emissao, data_conclusao, valor_total, status, id_veiculo, id_equipe) VALUES
(1001, '2026-03-10', '2026-03-11', 265.00, 'Concluída', 1, 1),
(1002, '2026-03-15', NULL, 0.00, 'Em Andamento', 2, 2),
(1003, CURRENT_DATE, NULL, 0.00, 'Aberta', 3, 2);

-- 8. Vinculando Serviços às OS
INSERT INTO os_servico (id_os, id_servico, valor_aplicado) VALUES
(1, 1, 50.00),  -- OS id 1 (1001) executou Troca de Óleo
(2, 3, 250.00), -- OS id 2 (1002) executou Revisão de Freios
(3, 2, 120.00); -- OS id 3 (1003) executou Alinhamento

-- 9. Vinculando Peças às OS
INSERT INTO os_peca (id_os, id_peca, quantidade, valor_unitario_aplicado) VALUES
(1, 1, 4, 45.00), -- OS id 1 utilizou 4 litros de óleo
(1, 2, 1, 35.00), -- OS id 1 utilizou 1 filtro de óleo
(2, 3, 2, 150.00); -- OS id 2 utilizou 2 pares de pastilha
