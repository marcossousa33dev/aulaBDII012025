select * from tbl_endereco
where cidade = 'Taboão da Serra'
   or bairro = 'Jardim Caner';
   
select * from tbl_endereco
where bairro in ('Jardim Caner', 'Jardim Pazini','Cidade Intercap');

select * from tbl_endereco
where bairro = 'Jardim Caner'
   or bairro = 'Jardim Pazini'
   or bairro = 'Cidade Intercap';

select * from tbl_cliente;

select bairro from tbl_endereco
where cep in (select cep 
              from tbl_cliente 
			  where cod_cliente in (1,9));
              
select * from tbl_cliente
where nome_cliente like ('M%')
  and nome_cliente like ('%A');

select * from tbl_cliente
where nome_cliente like 'C_E%';

select * from tbl_produto
where estoque_min between 10 and 20;

select * from tbl_cliente
where data_nasc  between '1980-01-01' and '1989-12-31';
;
select * from tbl_cliente
where month(data_nasc) in (2,12);
;
select count(*) from tbl_cliente
where data_nasc  between '1980-01-01' and '1989-12-31';
;
select count(*) as total, bairro
from tbl_endereco
where cidade = 'Taboão da Serra'
group by bairro
order by 1,2;

select count(*) total, month(data_nasc) mes_nasc
from tbl_cliente
where year(data_nasc) > 1930
group by month(data_nasc)
order by 2;

select sum(estoque_min) as total from tbl_produto;
select avg(estoque_min) as media from tbl_produto;
select min(estoque_min) from tbl_produto;
select max(estoque_min) from tbl_produto;