--Abrir o terminal
--Utilizar esse comando no terminal para acessar o mysql com usuário root
mysql -u root -p

--Usar o banco de dados criado no Pset 1
use uvv


--Questão 1:
SELECT   numero_departamento, AVG(salario) AS media_salarial
FROM     funcionario 
GROUP BY numero_departamento;


--Questão 2:
SELECT   sexo, AVG(salario) AS media_salarial
FROM     funcionario 
GROUP BY sexo;


--Questão 3:
SELECT     nome_departamento, CONCAT (primeiro_nome," ", nome_meio," ", ultimo_nome)
AS         nome_completo, data_nascimento, TIMESTAMPDIFF(YEAR, funcionario.data_nascimento, NOW())
AS         idade, salario 
FROM       departamento 
INNER JOIN funcionario
ON         departamento.numero_departamento = funcionario.numero_departamento;


--Questão 4:
SELECT  CONCAT (primeiro_nome," ", nome_meio," ", ultimo_nome) AS nome_completo,
        TIMESTAMPDIFF(YEAR, funcionario.data_nascimento, NOW()) AS idade, salario,
CASE
WHEN    salario < 35000 THEN salario * 1.2
WHEN    salario > 35000 THEN salario * 1.15
ELSE    salario
END AS  reajuste_salarial
FROM    funcionario;


--Questão 5:
SELECT     nome_departamento, primeiro_nome,
CASE
WHEN       funcionario.cpf = departamento.cpf_gerente THEN 'gerente'
WHEN       funcionario.cpf != departamento.cpf_gerente THEN 'funcionario'
END AS     cargo, salario
FROM       funcionario
INNER JOIN departamento
ON         funcionario.numero_departamento = departamento.numero_departamento
ORDER BY   nome_departamento ASC, salario DESC;


--Questão 6:
SELECT     CONCAT (primeiro_nome," ", nome_meio," ", ultimo_nome) AS nome_funcionario,
           numero_departamento, nome_dependente, 
           TIMESTAMPDIFF(YEAR, dependente.data_nascimento, NOW()) AS idade_dependente,
CASE
WHEN       dependente.sexo = "M" THEN "masculino"
WHEN       dependente.sexo = "F" THEN "feminino"
END AS     sexo_dependente
FROM       dependente
INNER JOIN funcionario 
ON         dependente.cpf_funcionario = funcionario.cpf;


--Questão 7:
SELECT     CONCAT (primeiro_nome," ", nome_meio," ", ultimo_nome) AS nome_completo,
           numero_departamento, salario
FROM       funcionario
EXCEPT
SELECT     CONCAT (primeiro_nome," ", nome_meio," ", ultimo_nome) AS nome_completo,
           numero_departamento, salario
FROM       funcionario
INNER JOIN dependente
ON         funcionario.cpf = dependente.cpf_funcionario
ORDER BY   numero_departamento ASC;


--Questão 8:
SELECT     numero_departamento, numero_projeto, 
           CONCAT (primeiro_nome," ", nome_meio," ",ultimo_nome) AS nome_completo, horas 
FROM       funcionario
INNER JOIN trabalha_em
ON         funcionario.cpf = trabalha_em.cpf_funcionario;


--Questão 9:
SELECT     nome_departamento, nome_projeto, SUM(horas) AS horas_totais
FROM       projeto
INNER JOIN departamento
ON         projeto.numero_departamento = departamento.numero_departamento
INNER JOIN trabalha_em
ON         projeto.numero_projeto = trabalha_em.numero_projeto 
GROUP BY   nome_projeto;


--Questão 10:
SELECT   numero_departamento, AVG(salario) AS media 
FROM     funcionario 
GROUP BY numero_departamento;


--Questão 11:
SELECT     CONCAT (primeiro_nome," ", nome_meio," ", ultimo_nome) as nome_completo, nome_projeto,
CASE
WHEN       horas THEN horas * 50
END AS     pagamento
FROM       trabalha_em
INNER JOIN funcionario
ON         trabalha_em.cpf_funcionario = funcionario.cpf
INNER JOIN projeto
ON         trabalha_em.numero_projeto = projeto.numero_projeto;


--Questão 12:
SELECT     nome_departamento, nome_projeto, primeiro_nome, horas
FROM       funcionario
INNER JOIN departamento
ON         funcionario.numero_departamento = departamento.numero_departamento
INNER JOIN projeto
ON         departamento.numero_departamento = projeto.numero_departamento
INNER JOIN trabalha_em
ON         projeto.numero_projeto = trabalha_em.numero_projeto
WHERE      horas = 0;


--Questão 13:
SELECT   CONCAT (primeiro_nome," ", nome_meio," ", ultimo_nome) as nome_completo, 
         funcionario.sexo, TIMESTAMPDIFF(YEAR, funcionario.data_nascimento, NOW()) AS idade
FROM     funcionario
UNION
SELECT   nome_dependente, dependente.sexo, TIMESTAMPDIFF(YEAR, dependente.data_nascimento, NOW())
AS       idade 
FROM     dependente 
ORDER BY idade DESC;


--Questão 14:
SELECT   numero_departamento, COUNT(funcionario.cpf) AS numero_de_funcionarios
FROM     funcionario 
GROUP BY numero_departamento;


--Questão 15:
SELECT     CONCAT (primeiro_nome," ", nome_meio," ", ultimo_nome) as nome_completo, nome_departamento, nome_projeto
FROM       departamento
RIGHT JOIN funcionario
ON         departamento.numero_departamento = funcionario.numero_departamento
RIGHT JOIN projeto
ON         departamento.numero_departamento = projeto.numero_departamento
ORDER by   nome_projeto;