drop table light;
create table light(
	id int(3) not null AUTO_INCREMENT,
	power int(3) not null,
	state int(3) not null default 0,
	date varchar(500) not null,
	constraint light_pk primary key(id)
);
insert into light(power, state, date) values(80, 1, now());