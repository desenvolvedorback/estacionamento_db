-- Define o uso da base de dados.
USE estacionamento_db;
-- Cria um procedimento que atualiza o telefone de um proprietário.
DELIMITER $$
CREATE PROCEDURE atualizar_proprietario (
IN p_id INT,
IN p_telefone VARCHAR(20)
)
BEGIN
UPDATE proprietarios
SET telefone = p_telefone
WHERE id = p_id;
END $$
DELIMITER ;
-- Atualiza o telefone da proprietária de ID 2.
CALL atualizar_proprietario(2, '(14) 99100-5566');
-- Confere a atualização.
SELECT * FROM proprietarios;




-- atualiza a placa do gol
DELIMITER $$
CREATE PROCEDURE atualizar_veiculo (
IN p_id INT,
IN p_placa VARCHAR(20)
)
BEGIN
UPDATE veiculos
SET placa = p_placa
WHERE id = p_id;
END $$
DELIMITER ;
-- Atualiza a placa do id 3
CALL atualizar_veiculo(3, 'IJK7L98');
-- Confere a atualização.
SELECT * FROM veiculos;
