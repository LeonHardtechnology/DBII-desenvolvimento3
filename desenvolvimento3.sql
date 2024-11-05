-- Tabela de Vendas
CREATE TABLE Vendas (
    venda_id SERIAL PRIMARY KEY,
    produto_id INT,
    quantidade INT NOT NULL,
    data_venda DATE NOT NULL
);

-- Inserir dados de vendas para exemplo
INSERT INTO Vendas (produto_id, quantidade, data_venda) VALUES
(1, 10, '2024-11-01'),
(2, 5, '2024-11-01'),
(1, 7, '2024-11-02'),
(3, 3, '2024-11-02'),
(2, 6, '2024-11-03');

CREATE OR REPLACE PROCEDURE relatorio_diario_vendas()
LANGUAGE plpgsql
AS $$
BEGIN
    -- Exibir o relatório diário da quantidade de produtos vendidos
    SELECT data_venda, 
           SUM(quantidade) AS total_vendido
    FROM Vendas
    GROUP BY data_venda
    ORDER BY data_venda;
END;
$$;

CALL relatorio_diario_vendas();


