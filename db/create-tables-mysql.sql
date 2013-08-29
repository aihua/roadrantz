drop table if exists rant; 
drop table if exists vehicle;
drop table if exists motorist_privileges;
drop table if exists Motorist;

create table rant (
  id integer AUTO_INCREMENT primary key,
  vehicle_id integer not null,
  ranttext varchar(2000) not null,
  posteddate date not null
);

create table motorist (
  id integer AUTO_INCREMENT primary key,
  email varchar(255) not null,
  password varchar(50) not null,
  firstName varchar(30) not null,
  lastName varchar(30) not null
);

create table vehicle (
  id integer AUTO_INCREMENT primary key,
  motorist_id integer,
  state varchar(2) not null,
  platenumber varchar(10) not null
);

create table motorist_privileges (
  motorist_id integer not null,
  privilege varchar(30) not null
);

alter table vehicle add constraint vehicle_motorist foreign key (motorist_id) references motorist (id);
alter table rant add constraint rant_vehicle foreign key (vehicle_id) references vehicle (id);
alter table motorist_privileges add constraint priv_motorist foreign key (motorist_id) references motorist (id);
