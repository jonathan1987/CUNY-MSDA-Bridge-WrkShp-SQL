# Jonathan Hernandez
# Email: jayhernandez1987@gmail.com
# Week 3 Assignment - Building a relational Database Management System

drop database if exists key_card;
create database key_card;
use key_card;

# Relationships: 
# A user can only be in one group 1:1
# A group can have many users 1:n
# A group can access many rooms 1:n
# A room can be accessed by many groups 1:n
# It's a many-to-many relationship between groups and rooms

# Create the groups table
create table Groups
(
	GID int primary key auto_increment,
    groupname varchar(20)
);

# Create the rooms table
create table Rooms
(
	RID int primary key auto_increment,
    roomname varchar(20)
);

# Create the users table
create table Users
(
	UID int primary key auto_increment,
    user varchar(20),
    GID int,
    foreign key (GID) references Groups(GID)
);

create table Rooms_Groups
(
	RGID int primary key auto_increment,
    RID int,
    GID int,
    foreign key (RID) references Rooms(RID),
    foreign key (GID) references Groups(GID)
);

# Populate the groups table
insert into Groups(groupname) values
('I.T'),
('Sales'),
('Administration'),
('Operations');

# Populate the rooms table
insert into Rooms(roomname) values
('101'),
('102'),
('Auditorium A'),
('Auditorium B');

# Populate the users table
insert into Users(user,GID) values
('Modesto',1),
('Ayline',1),
('Christopher',2),
('Cheong woo',2),
('Saulat',3),
('Heidy',null);

# Populate the Rooms_Groups table (many to many relationship)
insert into Rooms_Groups(RID,GID) values
(1,1),
(2,1),
(2,2),
(3,2);

# 1. All groups, and the users in each group. A group should apppear even if there are no users assigned to the group
select groupname, user from Groups g 
left join Users u 
on g.GID = u.GID;

# 2. All rooms, and the groups assigned to each room. The rooms should appear even if no groups have been assigned to them.
select groupname, roomname from Groups g 
left join Rooms_Groups rg 
on rg.GID=g.GID
	left join Rooms r
    on rg.RID = r.RID;

# 3. A list of users, the groups that they belong to, and the rooms to which they are assigned. This should be sorted alphabetically by user, then by group, then by room.
select user, groupname, roomname from Users u 
left join Groups g
on u.GID=g.GID
	left join Rooms_Groups rg
    on rg.GID = g.GID
		left join Rooms r
        on r.RID = rg.RID
order by user, groupname, roomname;