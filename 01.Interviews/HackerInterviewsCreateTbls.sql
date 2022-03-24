CREATE TABLE Contests (
    contest_id int primary key,
     hacker_id int,
	 name nvarchar(50)
);

CREATE TABLE Colleges (
 college_id int primary key,
 contest_id int FOREIGN KEY REFERENCES Contests(contest_id)
);

CREATE TABLE Challenges (
 challenge_id int primary key,
 college_id int FOREIGN KEY REFERENCES Colleges(college_id)
);

CREATE TABLE View_Stats (
 challenge_id int ,
 total_views int ,
 total_unique_views int 
);


CREATE TABLE Submission_Stats (
 challenge_id int ,
 total_submissions int ,
 total_accepted_submissions int 
);