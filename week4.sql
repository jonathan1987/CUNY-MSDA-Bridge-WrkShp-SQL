# Author: Jonathan Hernandez
# Email: jayhernandez1987@gmail.com

# Week 4 Assignment: implementing a Self Join in MySQL
# I Will be using the example provided by the professor (but not every employee in specified chart)

drop database if exists companyHierachy;
create database companyHierachy;
use companyHierachy;

CREATE TABLE organization
(
    orgID INT PRIMARY KEY AUTO_INCREMENT,
    empName VARCHAR(100),
    supervisor VARCHAR(100),
    jobTitle VARCHAR(100)
);

# Populate the table with the example in this assignment
insert into organization(empName,supervisor,jobTitle) values
('Steve Jobs', null, 'CEO'),
('Timothy Cook', 'Steve Jobs', 'Chief Operating Officer'),
('Jeffrey Williams','Timothy Cook', 'SVP, Operations'),
('Jonathan Ive','Steve Jobs', 'SVP, Industrial Design'),
('Ronald Johnson','Steve Jobs', 'SVP, Retail'),
('Hiroki Asai','Steve Jobs','VP, Creative Director'),
('Scott Forstall','Steve Jobs','SVP, IOS Software'),
('Eddy Cue', 'Steve Jobs', 'VP, Internet Services'),
('Craig Federighi', 'Steve Jobs','VP, Mac Software Engineering'),
('Philip Schiller', 'Steve Jobs', 'SVP, Marketing'),
('Andy Miller','Steve Jobs','VP, Mobile Advertising/IAD'),
('Peter Oppenheimer', 'Steve Jobs', 'SVP, Marketing'),
('Bruce Sewell','Steve Jobs','SVP, General Counsel'),
('Bob Mansfield','Timothy Cook','SVP, Mac Hardware Engineering'),
('Katie Cotton','Steve Jobs', 'VP, Communications'),
('Joel Pooolny','Steve Jobs','VP, HR'),
('John Brandon','Timothy Cook','VP, Channel Sales'),
('William Frederick','Jeffrey Williams','VP, Fulfillment'),
('Rita Lane','Jeffrey Willams','VP, Operations'),
('Jeff Robbin','Eddy Cue','VP, Internet Services'),
('David Moody','Philip Schiller','VP, Mac Marketing'),
('Ron Okamoto','Philip Schiller','VP, Developer Relations'),
('John Theriault','Bruce Sewell','VP, Global Security');

# Create the self join table
SELECT org1.empName as Employee, org2.empName as Manager
FROM organization org1, organization org2 
where org1.supervisor = org2.empName;