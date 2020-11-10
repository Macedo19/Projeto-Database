use projeto;

SELECT  e.Nome, c.Nome  FROM Empregado e
JOIN Trabalha a
ON e.CodEmpregado = a.CodEmpregado
JOIN Companhia c
ON c.CodCompanhia = a.CodCompanhia
WHERE c.Nome Like '%Casas Bahia%'
ORDER BY e.Nome;



SELECT e.CodEmpregado, e.Nome, c.Nome, c.Cidade  FROM Empregado e
JOIN Trabalha a
ON e.CodEmpregado = a.CodEmpregado
JOIN Companhia c
ON c.CodCompanhia = a.CodCompanhia
WHERE c.Nome Like '%GVT%'
ORDER BY e.Nome;


SELECT  e.Nome, e.Rua, e.Cidade, c.Nome, a.salario  FROM Empregado e
JOIN Trabalha a
ON e.CodEmpregado = a.CodEmpregado
JOIN Companhia c
ON c.CodCompanhia = a.CodCompanhia
WHERE c.Nome Like '%TIM%' AND a.salario > 3000
ORDER BY e.Nome;


SELECT  e.Nome, c.Nome  FROM Empregado e
JOIN Trabalha a
ON e.CodEmpregado = a.CodEmpregado
JOIN Companhia c
ON c.CodCompanhia = a.CodCompanhia
WHERE NOT c.Nome Like '%Casas Bahia%'
ORDER BY e.Nome;


SELECT   e.Cidade, c.Nome, a.salario  FROM Empregado e
JOIN Trabalha a
ON e.CodEmpregado = a.CodEmpregado
JOIN Companhia c
ON c.CodCompanhia = a.CodCompanhia
WHERE c.Nome Like '%TIM%' AND a.salario > 5000
ORDER BY e.Nome;


SELECT e.Nome, c.Nome, c.Cidade  FROM Empregado e
JOIN Trabalha a
ON e.CodEmpregado = a.CodEmpregado
JOIN Companhia c
ON c.CodCompanhia = a.CodCompanhia
WHERE  c.Cidade Like '%Cianorte%'
ORDER BY e.Nome;


SELECT e.Nome, e.Rua, e.Cidade, g.CodGerente FROM Setor s
JOIN Empregado e
ON e.CodEmpregado = s.CodEmpregado
JOIN Gerente g
ON g.CodGerente = s.CodGerente
WHERE e.CodEmpregado = s.CodEmpregado and s.CodGerente = 300;


SELECT e.CodEmpregado, e.Nome, e.Rua, e.Cidade, c.Nome, s.CodGerente FROM Empregado e
JOIN Trabalha t
ON e.CodEmpregado = t.CodEmpregado
JOIN Companhia c
ON c.CodCompanhia = t.CodCompanhia
JOIN Setor s
ON e.CodEmpregado = s.CodEmpregado
WHERE c.Cidade LIKE "%Cianorte%" and s.Codgerente = 302;

#J)
SELECT e.Nome, e.Cidade, c.Nome, c.Cidade  FROM Empregado e
JOIN Trabalha a
ON e.CodEmpregado = a.CodEmpregado
JOIN Companhia c
ON c.CodCompanhia = a.CodCompanhia
WHERE  e.Cidade Like '%Cianorte%' AND c.Cidade LIKE '%Cianorte%'
ORDER BY e.Nome;





SELECT e.Nome, e.Cidade, c.Nome  FROM Empregado e
JOIN Trabalha a
ON e.CodEmpregado = a.CodEmpregado
JOIN Companhia c
ON c.CodCompanhia = a.CodCompanhia
WHERE  c.Nome Like '%Varig%' OR e.Cidade LIKE '%Curitiba%'
ORDER BY e.Nome;

SELECT e.Nome, c.Nome, c.Cidade  FROM Empregado e
JOIN Trabalha a
ON e.CodEmpregado = a.CodEmpregado
JOIN Companhia c
ON c.CodCompanhia = a.CodCompanhia
WHERE  c.Nome Like '%TAM%' AND NOT c.Cidade LIKE '%Sao Paulo%'
ORDER BY e.Nome;


SELECT e.Nome, c.Nome, c.Cidade  FROM Empregado e
JOIN Trabalha a
ON e.CodEmpregado = a.CodEmpregado
JOIN Companhia c
ON c.CodCompanhia = a.CodCompanhia
WHERE  c.Nome Like '%TAM%' AND  c.Cidade LIKE '%Maceio%'
ORDER BY e.Nome;




SELECT  t.CodCompanhia, count(t.CodEmpregado), c.Nome FROM  Trabalha t
JOIN Companhia c
ON c.CodCompanhia = t.CodCompanhia
GROUP BY t.CodCompanhia
order by t.CodEmpregado asc;


SELECT e.Nome, c.Nome, MAX(t.salario) as Maior FROM Empregado e
JOIN Trabalha t
ON e.CodEmpregado = t.CodEmpregado
JOIN Companhia c
ON c.CodCompanhia= t.CodCompanhia;


UPDATE  Empregado
Set Cidade = "Brasilia"
WHERE CodEmpregado = 39;


SELECT   distinct c.Nome,e.Nome, (t.salario/100) + t.salario  FROM Empregado e
JOIN Trabalha t
ON e.CodEmpregado = t.CodEmpregado
JOIN Companhia c
ON c.CodCompanhia = t.CodCompanhia
WHERE c.Nome = "Varig";

SELECT   e.Nome, t.CodCompanhia, (t.salario/30) + t.salario  FROM Empregado e
JOIN Trabalha t
ON e.CodEmpregado = t.CodEmpregado
JOIN Gerente g
ON e.CodEmpregado = g.CodEmpregado;






#DELETE FROM Trabalha t
#WHERE t.CodCompanhia = 124;
#DELETE FROM Trabalha t
#WHERE t.CodCompanhia = 125;
#DELETE FROM Trabalha t
#WHERE t.CodCompanhia = 126;
#DELETE FROM Trabalha t
#WHERE t.CodCompanhia = 127;



SELECT p.CodCliente,pro.Descricao, i.Quantidade, pro.Valor, (i.Quantidade * pro.Valor) AS Total, p.DataPedido FROM Pedido p
JOIN ItensPedidos i
ON p.CodPedido = i.CodPedido
JOIN Produto pro
ON pro.CodProduto = i.CodProduto
WHERE p.DataPedido BETWEEN "2020-10-01" AND "2020-10-31"
group by p.CodCliente;


SELECT c.Cidade,  count(i.CodPedido) as Total from Cliente c
JOIN Pedido p
ON c.CPF =p.CodCliente
JOIN ItensPedidos i
ON p.CodPedido = i.CodPedido
GROUP BY c.Cidade;


SELECT  c.Nome, (d.Valor * i.Quantidade) as Total, p.DataPedido  FROM Cliente c
JOIN Pedido p
ON c.CPF = p.CodCliente
JOIN ItensPedidos i
ON p.CodPedido = i.CodPedido
JOIN Produto d
ON d.CodProduto = i.CodProduto
WHERE c.Nome LIKE "%Maria%" and p.DataPedido between "2020-01-01"  and "2020-12-31";


SELECT p.Descricao, MAX(I.Quantidade) FROM ItensPedidos i
JOIN Produto p
ON p.CodProduto = i.CodProduto
JOIN Pedido a
ON a.CodPedido = i.CodPedido
WHERE a.DataPedido between "2020-09-01" and "2020-09-30";


SELECT c.Nome, p.CodPedido, MAX(p.CodCliente), p.DataPedido from ItensPedidos i
JOIN Pedido p
ON p.CodPedido = i.CodPedido
JOIN Cliente c
ON c.Cpf = p.CodCliente
WHERE p.DataPedido between "2020-09-01" and "2020-11-01" 
ORDER BY p.CodPedido;


SELECT a.Descricao, min(i.Quantidade)  from ItensPedidos i
JOIN Pedido p
ON p.CodPedido = i.CodPedido
JOIN Produto a
ON a.CodProduto = i.CodProduto
WHERE p.DataPedido between "2020-11-01" and "2020-11-30";




SELECT p.CodProduto, p.Descricao, p.QuantidadedeEstoque  FROM Produto p
WHERE p.QuantidadedeEstoque < 5;


SELECT c.Cidade, i.Quantidade , a.Descricao FROM ItensPedidos i
JOIN Pedido p
ON p.CodPedido = i.CodPedido
Join Cliente c
ON c.CPF = p.CodCliente
JOIN Produto a
ON a.CodProduto = i.CodProduto
WHERE c.Cidade LIKE "%Curitiba%" and p.Datapedido between "2020-10-01" and "2020-11-18"
ORDER BY  i.Quantidade desc;


SELECT c.Nome, o.Descricao  FROM Cliente c
JOIN Pedido p
ON c.CPF = p.CodPedido
JOIN ItensPedidos i
ON p.CodPedido = i.CodPedido
JOIN Produto o
ON o.CodProduto = i.CodProduto
WHERE o.Descricao LIKE "%Coca-cola%" AND NOT o.Descricao LIKE "%Suco de Uva%";


SELECT c.Nome, o.Descricao  FROM Cliente c
JOIN Pedido p
ON c.CPF = p.CodPedido
JOIN ItensPedidos i
ON p.CodPedido = i.CodPedido
JOIN Produto o
ON o.CodProduto = i.CodProduto
WHERE o.Descricao LIKE "%Kinder ovo%" AND o.Descricao LIKE "%Leite%" AND NOT o.Descricao LIKE "%Suco de maracuja%";




