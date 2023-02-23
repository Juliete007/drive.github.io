select * from client
where cod_cli=306;
--6.93 Inserir en la taula CATEGORIA les següents files:
insert into categoria
values ('BjcOlimpia2','Components Bjc Seria Olimpia2'),('Legrand2','Components marca Legrand2'),('IntMagn2','Interruptor Magnetotérmico2'),('Niessen2','Components Niesen Serie Lisa');

--6.94 Inserir els següents articles.
insert into article
values ('B10028B','Cruzamiento Bjc Serie Olimpia',4.38,2,1,'BjcOlimpia'),('B10200B','Cruzamiento Bjc Olimpia Con Visor',0.88,29,null,'BjcOlimpia'),
('L16550','Cartucho Fusible Legrand T2 250 A',5.89,1,1,'Legrand'),('L16555','Cartucho Fusible Legrand T2 315 A',5.89,3,3,'Legrand'),
('IM2P10L','Interruptor Magnetotermico  2p, 4',14.84,2,1,'IntMagn'),('N8008BA','Base Tt Lateral Niessen Trazo Bla',4.38,6,6,'Niessen')

--6.95 Inserir en la taula CLIENT tres files amb les següents dades
insert into client (cod_cli,nom,adreca,cp,cod_pob) 
values (3030,'MIRAVET SALA, MARIA MERCEDES','URBANIZACION EL BALCO, 84-11',null,null),
(3060,'SAMPEDRO SIMO, MARIA MERCEDES','FINELLO, 161', 12217,null),
(3870,'TUR MARTIN, MANUEL FRANCISCO','CALLE PEDRO VIRUELA, 108-8',12008,null)

--6.96 Inserir la següent factura

insert into factura (num_f,data,cod_cli,cod_ven,iva,dte)
values (65350,'2015-01-01',306,null,21,10)
insert into linia_fac (num_f,num_l,cod_a,quant,preu,dte)
values (65350,1,'L16555',2,5.89,25)

--6.97 Inserir la següent factura (aquesta té més d'una línia de factura)
insert into factura(num_f,data,cod_cli,cod_ven,iva,dte)
values (65590,'2015-02-16',387,null,10,10)
insert into linia_fac (num_f,num_l,cod_a,quant,preu,dte)
values(65590,1,'IM2P10L',3,14.84,null),(65590,2,'N8008BA',6,4.38,20)

--6.98 Esborrar la factura 6559. Comprovar que també s'han esborrat les seues línies de factura

alter table linia_fac drop constraint ce_lin_art;
alter table linia_fac
add constraint ce_lin_art foreign key (num_f)
references factura (num_f) on delete cascade on update cascade;

delete from factura
where num_f=65590;

select * from factura
where num_f=65590;

--6.99 Esborrar els articles dels quals no tenim stock mínim.
delete from article
where stock_min is null;
--6.100 Llevar tots els codis postals dels clients.
update client
set cp=null;
--6.101 Pujar el preu dels articles de la categoria BjcOlimpia un 5% (el resultat serà que l'únic article d'aquesta categoria haurà passat d'un preu de 4.38 a 4.60€)
update article
set preu=preu*1.05
where cod_cat='BjcOlimpia'
select * from article
where cod_cat='BjcOlimpia'