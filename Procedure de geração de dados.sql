DELIMITER $$

CREATE PROCEDURE InsertCarros()
BEGIN
    DECLARE i INT DEFAULT 1;
    
    WHILE i <= 60000 DO
        INSERT INTO tbl_carro (
            chassi, marca, modelo, anocarro, anomodelo, carroceria, cor, nroportas, transmissao, motorizacao, tracao
        ) VALUES (
            CONCAT('1HGCM82633A', LPAD(i, 6, '0')),  -- Gera um chassi único
            ELT(FLOOR(1 + (RAND() * 5)), 'Toyota', 'Honda', 'Ford', 'Chevrolet', 'Volkswagen'),  -- Escolhe uma marca aleatória
            ELT(FLOOR(1 + (RAND() * 5)), 'Corolla', 'Civic', 'Focus', 'Onix', 'Golf'),  -- Escolhe um modelo aleatório
            FLOOR(2015 + (RAND() * 10)),  -- Ano do carro entre 2015 e 2024
            FLOOR(2016 + (RAND() * 10)),  -- Ano modelo entre 2016 e 2025
            ELT(FLOOR(1 + (RAND() * 3)), 'Sedan', 'Hatch', 'SUV'),  -- Tipo de carroceria aleatória
            ELT(FLOOR(1 + (RAND() * 5)), 'Preto', 'Branco', 'Prata', 'Vermelho', 'Azul'),  -- Cor aleatória
            ELT(FLOOR(1 + (RAND() * 3)), 2, 4, 5),  -- Número de portas aleatório
            ELT(FLOOR(1 + (RAND() * 2)), 'Manual', 'Automática'),  -- Tipo de transmissão aleatória
            ELT(FLOOR(1 + (RAND() * 3)), '1.0', '1.6', '2.0'),  -- Motorização aleatória
            ELT(FLOOR(1 + (RAND() * 2)), 'Dianteira', 'Traseira')  -- Tipo de tração aleatória
        );
        
        SET i = i + 1;
    END WHILE;
END $$

DELIMITER ;

-- Executando o procedimento para inserir os 1000 registros
CALL InsertCarros();
