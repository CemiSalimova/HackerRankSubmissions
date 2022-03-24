CREATE TABLE Hackers (
    hacker_id int primary key,
	 name nvarchar(50)
);


CREATE TABLE Submissions (
    submission_date date,
	submission_id int,
	hacker_id int foreign key references Hackers(hacker_id),
	score int
	
);