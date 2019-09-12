-- Quais os nomes dos empregados que ganham os 3 maiores salários da empresa?

create table if not exists emp (
  id integer primary key autoincrement,
  nome text,
  salario float
);

-- SQL Estendido

select id, nome from emp where salario in (
  select distinct salario from emp order by salario desc limit 3
);

-- SQL ANSI

select emp3.id, emp3.nome
from (
  select distinct
    emp1.salario, (
      select count(distinct emp2.salario)
      from emp emp2
      where emp1.salario < emp2.salario
    ) qtd
  from emp emp1
) tmp, emp emp3
where emp3.salario = tmp.salario
  and tmp.qtd < 3
;

-- Turma do Funil
-- Venda (Bar, Cerveja)
-- Gostam (Pessoa, Cerveja)

create table if not exists venda (
  bar text,
  cerveja text
);

create table if not exists gostam (
  pessoa text,
  cerveja text
);

-- Listar todas as pessoas que gostam das cervejas vendidas no Pires

select distinct pessoa
from gostam where cerveja in (
  select cerveja from venda where bar = 'Pires'
);

-- Listar todas as pessoas que gostam apenas das cervejas vendidas no Pires

select distinct pessoa
from gostam
where pessoa not in (
  select pessoa
  from gostam
  where cerveja not in (
    select cerveja
    from venda
    where bar = 'Pires'
  )
);

-- Listar todas as pessoas que gostam das cervejas vendidas apenas no Pires

select distinct pessoa
from gostam
where cerveja not in (
  select cerveja from venda where bar <> 'Pires'
)
;
