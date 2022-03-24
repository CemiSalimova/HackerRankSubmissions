WITH 
  unique_hackers_on_dates AS
(
   SELECT   
      Submissions.submission_date,
      Submissions.hacker_id,
      COUNT(1) subs_per_hacker_per_day,
      MAX(COUNT(1)) OVER (PARTITION BY submission_date) max_subs_per_day
   FROM
      Submissions
   GROUP BY
      Submissions.submission_date,
      Submissions.hacker_id      
), 
   hacker_with_max_sub AS
(
   SELECT
      unique_hackers_on_dates.submission_date,
      MIN(hacker_id) min_hacker_id
   FROM
      unique_hackers_on_dates
   WHERE
      unique_hackers_on_dates.subs_per_hacker_per_day = unique_hackers_on_dates.max_subs_per_day
   GROUP BY
      unique_hackers_on_dates.submission_date
), 
   dates AS
(
   SELECT   
      unique_hackers_on_dates.submission_date, 
      unique_hackers_on_dates.hacker_id
   FROM
      unique_hackers_on_dates
   WHERE
      unique_hackers_on_dates.submission_date = CAST('2016-03-01' AS Date)
   UNION ALL
      SELECT   
         unique_hackers_on_dates.submission_date, 
         unique_hackers_on_dates.hacker_id
      FROM     
         dates
      INNER JOIN
         unique_hackers_on_dates 
         ON dates.hacker_id = unique_hackers_on_dates.hacker_id AND
            DATEADD(DAY, 1, dates.submission_date) = unique_hackers_on_dates.submission_date
), 
   consec_hackers as
(
   SELECT 
      submission_date,
      count(1) num_consec_hackers
   FROM 
      dates
   GROUP BY
      submission_date
)
SELECT
   consec_hackers.submission_date,
   consec_hackers.num_consec_hackers,
   hacker_with_max_sub.min_hacker_id,
   Hackers.name
FROM
   consec_hackers
INNER JOIN
   hacker_with_max_sub
   on consec_hackers.submission_date = hacker_with_max_sub.submission_date
INNER JOIN
   Hackers 
   ON hacker_with_max_sub.min_hacker_id = Hackers.hacker_id
ORDER BY 
    consec_hackers.submission_date;