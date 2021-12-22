/*LR2*/
create table driver(
	"id" serial primary key,
	"name" varchar(50),
	"surname" varchar(50),
	"birthday" date,
	"married" bool,
	"childrens" int
);

create table bus(
	"id" serial primary key,
	"driver_id" int,
	"count_of_passangers" int,
	"rest" bool,
	"oil" varchar(50),
	foreign key ("driver_id") references driver("id")
);

create table passanger(
	"id" serial primary key,
	"name" varchar(50),
	"surname" varchar(50),
	"reserv_num" int,
	"payed" bool
);

create table autovokzal(
	"id" serial primary key,
	"bus_nums" int,
	"pass_num" int,
	"driver_num" int,
	"name" varchar(50),
	"count_of_buses" int,
	"vip_zal" bool,
	foreign key (pass_num) references passanger("id") on delete cascade,
	foreign key (driver_num) references driver("id") on delete cascade
);
create table rozklad(
	"name" varchar(30),
	"time_to_go" time,
	"time_to_back" time,
	"bus_id" int,
	"driver_id" int,
	foreign key ("driver_id") references driver("id") on delete cascade
);

drop table rozklad, autovokzal, passanger, bus, driver;

/*LR3*/
/*1*/
alter table autovokzal drop constraint autovokzal_pass_num_fkey;
/*2*/
alter table rozklad drop column "name";
alter table rozklad add "punkt_priz" varchar(100);
/*3*/
alter table autovokzal rename column "vip_zal" to "vip_room";
alter table passanger add constraint passanger unique ("reserv_num");
/*4*/
alter table autovokzal drop constraint autovokzal_driver_num_fkey;
alter table autovokzal add constraint bus_nums foreign key (bus_nums) references bus(id);

/*LR4*/
insert into passanger ("id","name","surname","reserv_num","payed") values (1, 'Захарчук', 'Олег', 111 , 't');
insert into passanger ("id","name","surname","reserv_num","payed") values (2, 'Василевський', 'Василь', 222, 't');
insert into passanger ("id","name","surname","reserv_num","payed") values (3, 'Михайленко', 'Михайло', 333, 'f');
insert into passanger ("id","name","surname","reserv_num","payed") values (4, 'Іванов', 'Іван', 444, 'f');
insert into passanger ("id","name","surname","reserv_num","payed") values (5, 'Холмогоров', 'Космос', 555, 'f');

insert into driver ("id","name","surname","birthday") values 
	(1, 'Броварчук', 'Владислав', '1999-03-01'),
    (2, 'Крамарчук', 'Олена', '2000-05-03'),
    (3, 'Дмитренко', 'Анастасія', '2000-11-08'),
    (4, 'Сергінко', 'Ілля', '2000-12-21'),
	(5, 'Захарчук', 'Тетяна', '2000-10-30'),
	(6, 'Захаренко', 'Тетяна', '2000-10-30');

update passanger set "reserv_num" = 666 where "reserv_num" = 555;

delete from driver where "id" = 3;
delete from passanger where "surname" = 'Іванов';
delete from passanger all;

/*LR5*/
create table card1 as select * from driver where id <= 5;
create table card2 as select * from driver where id >= 4;

select * from card1 union select * from card2;
select * from card1 union all select * from card2;

select * from card1 intersect select * from card2;

select * from card1, card2;










