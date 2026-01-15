create database freedom;
use freedom;
show tables;
select * from country_ab;
select * from country_cd;
select * from country_cl;
select * from country_efg;


-- Find out top 10 countries' which have maximum A and D values.
select ab.country ,max(ab.a) as a_count,max(cd.d) as d_count
from country_ab ab
join country_cd cd on
cd.country = ab.country
group by ab.country
order by max(a) desc
limit 10;


-- Find out highest CL value for 2020 for every region.
--  Also sort the result in descending order. Also display the CL values in descending order
select * from country_cl;
select country ,max(cl) 
from country_cl
where edition = 2020
group by country
order by country asc , max(cl) desc;

select t2.region , max(t1.cl)
from country_cl t1
join country_ab t2
on t1.country =t2.country
where t1.edition = 2020
group by t2.region
order by t2.region , max(t1.cl) desc
;
-- Overall democracy score for each country
-- “Create a single view of each country’s overall democracy score by combining all indicators.”
SELECT 
     ab.Country,
    (ab.A + ab.B + cd.C + cd.D + efg.E + efg.F + efg.G) AS total_score
FROM Country_ab ab
JOIN Country_cd cd 
    ON ab.Country = cd.Country 
   AND ab.Edition = cd.Edition 
   AND ab.Region = cd.Region
JOIN Country_efg efg
    ON ab.Country = efg.Country
   AND ab.Edition = efg.Edition
   AND ab.Region = efg.Region
order by total_score desc;

-- Among Free countries, which ones have weak elections (A < 5)?

select * from country_cl
where status = 'F';

select *
from country_ab t1
join country_cl t2
on t1.country=t2.country AND t1.Edition = t2.Edition
where t2.status ='F'
and t1.A<10;

-- How do regions compare in civil liberties?
SELECT 
    ab.region, AVG(cl.cl)
FROM
    country_ab ab
        JOIN
    country_cl cl ON ab.country = cl.country
        AND ab.Edition = cl.Edition
GROUP BY ab.Region;

/* “Find countries where political institutions are strong but civil freedoms lag.”

Logic
Political Rights = A+B+C+D >>>>>
Civil Liberties = E+F+G
*/

SELECT 
    ab.country,ab.edition,
    (ab.A + ab.B + cd.C + cd.D) AS Political_Rights,
    (efg.E + efg.F + efg.G) AS Civil_liberties
FROM
    country_ab ab
        JOIN
    country_cd cd ON ab.country = cd.country
        AND ab.edition = cd.edition
        JOIN
    country_efg efg ON efg.country = ab.country
        AND efg.edition = ab.edition
WHERE
    (ab.A + ab.B + cd.C + cd.D) > (efg.E + efg.F + efg.G)
ORDER BY Political_Rights DESC , Civil_liberties DESC
;

-- “Among Partly Free countries, which country gives people the most autonomy?” Top 3 country
-- Personal Freedom = G (Personal Autonomy & Individual Rights)
SELECT 
   distinct t1.country, (t1.G) AS Personal_Autonomy
FROM
    country_efg t1
        JOIN
    country_cl t2 ON t1.country = t2.country
        AND t1.edition = t2.edition
WHERE
    status = 'PF'
ORDER BY Personal_Autonomy DESC
limit 7;

-- Show all countries and their total democracy score, even if some indicators are missing.”

SELECT 
    cl.Country,
    cl.Edition,
    cl.Status,
    COALESCE(ab.A,0) + COALESCE(ab.B,0) +
    COALESCE(cd.C,0) + COALESCE(cd.D,0) +
    COALESCE(efg.E,0) + COALESCE(efg.F,0) + COALESCE(efg.G,0) 
    AS total_score
FROM Country_cl cl
LEFT JOIN Country_ab ab
    ON cl.Country = ab.Country AND cl.Edition = ab.Edition
LEFT JOIN Country_cd cd
    ON cl.Country = cd.Country AND cl.Edition = cd.Edition
LEFT JOIN Country_efg efg
    ON cl.Country = efg.Country AND cl.Edition = efg.Edition;

/*“List regions where at least one ‘Not Free’ country has higher civil liberties than the regional average.”
This is JOIN + GROUP BY + subquery logic. */

SELECT DISTINCT
    ab.Region
FROM Country_ab ab
JOIN Country_efg efg
    ON ab.Country = efg.Country AND ab.Edition = efg.Edition
JOIN Country_cl cl
    ON ab.Country = cl.Country AND ab.Edition = cl.Edition
JOIN (
    SELECT 
        ab.Region,
        AVG(efg.E + efg.F + efg.G) AS avg_civil
    FROM Country_ab ab
    JOIN Country_efg efg
        ON ab.Country = efg.Country AND ab.Edition = efg.Edition
    GROUP BY ab.Region
) r
ON ab.Region = r.Region
WHERE cl.Status = 'NF'
AND (efg.E + efg.F + efg.G) > r.avg_civil;