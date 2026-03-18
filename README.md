# Esquema Conceitual - Oficina Mecânica 🚗🔧

Este repositório contém o modelo conceitual de um banco de dados para o gerenciamento de ordens de serviço (OS) em uma oficina mecânica, desenvolvido como parte de um desafio de projeto.

## 🎯 Objetivo do Projeto
Criar um esquema conceitual do zero a partir de uma narrativa de regras de negócio, modelando entidades, relacionamentos e atributos para um sistema de controle de execução de ordens de serviço.

## 📖 Narrativa e Regras de Negócio
- Clientes levam veículos à oficina para consertos ou revisões periódicas.
- Cada veículo é designado a uma equipe de mecânicos que identifica os serviços a serem executados e preenche uma OS com data de entrega.
- A partir da OS, calcula-se o valor de cada serviço, consultando-se uma tabela de referência de mão-de-obra.
- O valor de cada peça também irá compor a OS.
- O cliente autoriza a execução dos serviços.
- A mesma equipe avalia e executa os serviços.
- Os mecânicos possuem código, nome, endereço e especialidade.
- Cada OS possui: n°, data de emissão, um valor, status e uma data para conclusão dos trabalhos.

## 🏗️ Entidades e Relacionamentos
O modelo foi estruturado com as seguintes entidades principais:
- **Cliente:** Armazena os dados dos donos dos veículos.
- **Veículo:** Associado a um cliente, guarda as informações do carro.
- **Equipe:** Grupo de mecânicos responsáveis por avaliar e executar a OS.
- **Mecânico:** Profissionais da oficina, vinculados a uma equipe.
- **OS (Ordem de Serviço):** Documento central que registra o serviço prestado a um veículo por uma equipe.
- **Serviço (Tabela de Referência):** Catálogo de serviços com os valores base de mão-de-obra.
- **Peça:** Catálogo de peças disponíveis para uso nas manutenções.

Para resolver relacionamentos de Muitos-para-Muitos (N:M), foram criadas as entidades associativas:
- **OS_Serviço:** Relaciona quais serviços foram feitos em uma OS específica.
- **OS_Peça:** Relaciona quais peças foram utilizadas em uma OS específica, incluindo as quantidades.

## 📌 Premissas Assumidas (Contexto Adicionado)
Como a narrativa original não detalhava todos os atributos necessários para um sistema real, as seguintes adições foram feitas para garantir a integridade e lógica do banco de dados:
1. **Atributos de Cliente e Veículo:** Foram adicionados atributos básicos não mencionados, como `cpf_cnpj`, `telefone` para Cliente, e `placa`, `marca`, `modelo`, `ano` para Veículo, essenciais em qualquer oficina.
2. **Entidade `Equipe`:** Criada como uma entidade separada (ao invés de apenas um atributo) para permitir que múltiplos mecânicos sejam alocados a um mesmo grupo de trabalho de forma normalizada.
3. **Entidades Associativas (N:M):** As tabelas `OS_Servico` e `OS_Peca` foram criadas. Uma OS pode ter várias peças e serviços, e uma mesma peça/serviço pode aparecer em várias OS.
4. **Histórico de Preço:** Atributos como `valor_aplicado` e `valor_unitario_aplicado` foram colocados nas entidades associativas (`OS_Servico` e `OS_Peca`). Isso garante que, se o preço base de uma peça ou serviço mudar no futuro no catálogo, o histórico de valor das OS antigas não seja alterado.
