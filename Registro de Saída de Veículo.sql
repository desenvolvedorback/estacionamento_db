USE estacionamento_db;

-- Apaga a versão com erro antes de recriar
DROP PROCEDURE IF EXISTS atualizar_veiculo_saida;

-- Cria o procedimento com a sintaxe correta (usando vírgula)
DELIMITER $$
CREATE PROCEDURE atualizar_veiculo_saida (
    IN p_id INT,
    IN p_data_saida DATETIME,
    IN p_valor_pago DECIMAL(10,2)
)
BEGIN
    UPDATE veiculos
    SET data_saida = p_data_saida, valor_pago = calcular_valor(data_entrada, p_data_saida)
    WHERE id = p_id;
END $$
DELIMITER ;

-- Executa os testes novamente
CALL atualizar_veiculo_saida(1, '2026-10-29 09:00:00', 16.00);
CALL atualizar_veiculo_saida(2, '2026-10-29 12:10:00', 32.00);
CALL atualizar_veiculo_saida(3, '2026-10-29 08:55:00', 8.00);

-- Confere a atualização
SELECT * FROM veiculos;