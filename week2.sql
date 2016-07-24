drop database if exists howto;
create database howto;
use howto;
create table Videos
(
	video_id int primary key auto_increment,
    title varchar(100),
    length int,
    URL varchar(255)
);

create table Reviewers
(
	reviewer_id int primary key auto_increment,
    video_id int,
	uname varchar(20),
    rating smallint,
    review varchar(30),
	foreign key (video_id) references Videos(video_id)
);

# add some data for videos from youtube

insert into Videos(title,length,URL) values
('MySQL Tutorial', 41, 'https://www.youtube.com/watch?v=yPu6qV5byu4'),
('MySQL Database Tutorial - 22 - How to Join Tables',8,'https://www.youtube.com/watch?v=6BfofgkrI3Y'),
('MySQL Database Tutorial - 4 - SHOW and SELECT', 6, 'https://www.youtube.com/watch?v=HQQ_hDCUUuI'),
('How to install MySql on Linux', 1, 'https://www.youtube.com/watch?v=3vz4FltGo0A');

# add some data to the reviews table

insert into Reviewers(uname,rating,review,video_id) values
('jonathan', 5, 'great tutorial for MySQL & Linux',4),
('jonathan', 5, 'recommended for any MySQL noob',1),
('philip', 4, null, 2),
('philip', 3, null, 3),
('someguy',1,'needs more detail/explaning',4),
('someguy',3, 'okay',2);

# Query to join the two tables

select v.video_id, title, length, URL, uname, review, rating 
from Videos v inner join Reviewers r
on r.video_id = v.video_id
order by title;