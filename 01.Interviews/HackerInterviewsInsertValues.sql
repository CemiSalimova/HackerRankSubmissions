--INSERT INTO Customers (CustomerName, ContactName, Address, City, PostalCode, Country)
--VALUES ('Cardinal', 'Tom B. Erichsen', 'Skagen 21', 'Stavanger', '4006', 'Norway');

INSERT INTO Contests(contest_id,hacker_id,name)
VALUES(66406,17973,'Rose'),
      (66556,79153,'Angela'),
	  (94828,80276,'Frank');

	  
 INSERT INTO Colleges(college_id,contest_id)
VALUES(11219,66406),
	  (32473,66556),
	  (56685,94828);
 
 INSERT INTO Challenges(challenge_id,college_id)
VALUES(18765,11219),
	  (47127,11219),
	  (60292,32473),
	   (72974,56685);

 INSERT INTO View_Stats(challenge_id,total_views,total_unique_views)
VALUES(47127,26,19),
(47127,15,14),
(18765,43,10),
(18765,72,13),
(75516,35,17),
(60292,11,10),
(72974,41,15),
(75516,75,11);
	
	 INSERT INTO Submission_Stats(challenge_id,total_submissions,total_accepted_submissions)
VALUES
(75516,34,12),
(47127,27,10),
(47127,56,18),
(75516,74,12),
(75516,83,8),
(72974,68,24),
(72974,82,14),
(47127,28,11);



