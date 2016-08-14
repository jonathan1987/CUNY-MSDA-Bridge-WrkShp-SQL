# Author: Jonathan Hernandez
# Email: jayhernandez1987@gmail.com

# SQL - Final Project - Building Energy

# 1. Create the Database BuildingEnergy
drop database if exists BuildingEnergy;
create database BuildingEnergy;
use BuildingEnergy;

# 2. Create the two tables EnergyCategories and EnergyTypes
create table EnergyCategories
(
	ec_ID int primary key auto_increment,
    energycategory varchar(100)
);

create table EnergyTypes
(
	et_ID int primary key auto_increment,
    energytype varchar(100),
    ec_ID int,
    foreign key (ec_ID) references EnergyCategories(ec_ID)
);

# Populate the tables
insert into EnergyCategories(energycategory) values
("Fossil"),
("Renewable");

insert into EnergyTypes(energytype,ec_ID) values
("Electricity",1),
("Gas",1),
("Steam",1),
("Fuel Oil",1),
("Solar",2),
("Wind",2);

# 3. Join Statement that shows the energy categories and associated energy types that were entered
select energycategory, energytype
from EnergyCategories e
	inner join EnergyTypes t
    on e.ec_ID = t.ec_ID;

# 4. Create a table called "Buildings"; make it a many-to-many relationship between Buildings and EnergyTypes
create table Buildings
(
	BID int primary key auto_increment,
    building varchar(100)
);

# Create the table that will maintain this many to many relationship
create table Buildings_EnergyTypes
(
	BID_et_ID int primary key auto_increment,
    BID int,
    et_ID int,
    foreign key (BID) references Buildings(BID),
    foreign key (et_ID) references EnergyTypes(et_ID)
);

# Populate the buildings table
insert into Buildings(building) values
("Borough of Manhattan Community College"),
("Chrysler Building"),
("Empire State Building");

# Insert into the Buildings_EnergyTypes table
insert into Buildings_EnergyTypes(BID,et_ID) values
(1,5),
(1,3),
(1,1),
(2,1),
(2,3),
(3,1),
(3,2),
(3,3);

# 5. Write a join statement that shows the buildings and associates energy types for each building
select building, energytype
from Buildings b
	inner join Buildings_EnergyTypes be
    on be.BID = b.BID
		inner join EnergyTypes e
        on e.et_ID = be.et_ID;

# 6. Insert  the following data into the database
# Building: Bronx Lion House; Energy Types: Geothermal
# Brooklyn Childrens Museum: Energy Types: Electricity, Geothermal

insert into Buildings(building) values 
("Bronx Lions House"),
("Brooklyn Childrens Museum");

insert into EnergyTypes(energytype,ec_ID) values
("Geothermal",2);

insert into Buildings_EnergyTypes(BID,et_ID) values
(4,7),
(5,7),
(5,1);

# 7. Write a SQL query that display all of the buildings that use Renewable Energies
select building, energytype, energycategory
from Buildings b
	inner join Buildings_EnergyTypes be
    on be.BID = b.BID
		inner join EnergyTypes e
        on e.et_ID = be.et_ID
			inner join EnergyCategories ec
            on ec.ec_ID = e.ec_ID
where energycategory = "Renewable";


# 8. Write a SQL Query that shows the frequency with which energy types are used in various buildings
select energytype, count(energytype)
from EnergyTypes e
	inner join Buildings_EnergyTypes be
    on be.et_ID = e.et_ID
		inner join Buildings b
        on b.BID = be.BID
group by energytype
order by count(energytype) desc;