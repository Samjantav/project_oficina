erDiagram
    CLIENTE ||--o{ VEICULO : possui
    VEICULO ||--o{ OS : gera
    EQUIPE ||--o{ MECANICO : composta_por
    EQUIPE ||--o{ OS : avalia_e_executa
    OS ||--|{ OS_SERVICO : contem
    SERVICO ||--o{ OS_SERVICO : listado_em
    OS ||--o{ OS_PECA : utiliza
    PECA ||--o{ OS_PECA : fornecida_para

    CLIENTE {
        int id_cliente PK
        string nome
        string cpf_cnpj
        string telefone
        string endereco
    }

    VEICULO {
        int id_veiculo PK
        string placa
        string marca
        string modelo
        int ano
        int id_cliente FK
    }

    EQUIPE {
        int id_equipe PK
        string nome_equipe
    }

    MECANICO {
        int id_mecanico PK
        string codigo_mecanico
        string nome
        string endereco
        string especialidade
        int id_equipe FK
    }

    OS {
        int id_os PK
        int numero_os
        date data_emissao
        date data_conclusao
        decimal valor_total
        string status
        int id_veiculo FK
        int id_equipe FK
    }

    SERVICO {
        int id_servico PK
        string descricao
        decimal valor_mao_de_obra
    }

    PECA {
        int id_peca PK
        string descricao
        decimal valor_peca
    }

    OS_SERVICO {
        int id_os FK
        int id_servico FK
        decimal valor_aplicado
    }

    OS_PECA {
        int id_os FK
        int id_peca FK
        int quantidade
        decimal valor_unitario_aplicado
    }
