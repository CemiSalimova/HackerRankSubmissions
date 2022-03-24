SELECT TBL01.contest_id,TBL02.hacker_id,TBL01.name
,TBL01.C1,TBL01.C2
,TBL02.C3,TBL02.C4
FROM
(SELECT Contests.contest_id, Contests.hacker_id,Contests.name
,ISNULL(SUM(SS.total_submissions ),0) AS C1
,ISNULL(SUM(SS.total_accepted_submissions ),0) AS C2

FROM Challenges
LEFT JOIN Submission_Stats AS SS
ON Challenges.challenge_id=SS.challenge_id
LEFT JOIN Colleges
ON Colleges.college_id=Challenges.college_id
LEFT JOIN Contests
ON Contests.contest_id=Colleges.contest_id
GROUP BY Contests.contest_id, Contests.hacker_id,Contests.name) AS TBL01

JOIN 

(SELECT Contests.contest_id, Contests.hacker_id,Contests.name

,ISNULL(SUM(VS.total_views ),0) AS C3
,ISNULL(SUM(VS.total_unique_views ),0) AS C4
FROM Challenges
LEFT JOIN View_Stats AS VS
ON Challenges.challenge_id=VS.challenge_id
LEFT JOIN Colleges
ON Colleges.college_id=Challenges.college_id
LEFT JOIN Contests
ON Contests.contest_id=Colleges.contest_id
GROUP BY Contests.contest_id, Contests.hacker_id,Contests.name) AS TBL02
ON TBL01.contest_id=TBL02.contest_id
ORDER BY TBL01.contest_id;

