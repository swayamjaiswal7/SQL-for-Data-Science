use company;
select * from insurance;

-- How many patients have claimed more than the average claim amount 
-- for patients who are smokers and have at least one child, and belong to the southeast region?

SELECT 
    COUNT(claim)
FROM
    insurance
WHERE
    claim > (SELECT 
            AVG(claim)
        FROM
            insurance
        WHERE
            smoker = 'Yes' AND children >= 1
                AND region = 'southeast');

-- How many patients have claimed more than the average claim amount for patients who are not smokers and 
-- have a BMI greater than the average BMI for patients who have at least one child
SELECT 
    COUNT(patientid)
FROM
    insurance
WHERE
    claim > (SELECT 
            AVG(claim)
        FROM
            insurance
        WHERE
            smoker = 'No' AND children >= 1
                AND bmi >= (SELECT 
                    AVG(bmi)
                FROM
                    insurance))
;

-- How many patients have claimed more than the average claim amount 
-- for patients who have a BMI greater than the average B
-- MI for patients who are diabetic, have at least one child, and are from the southwest region?
SELECT 
    COUNT(claim)
FROM
    insurance
WHERE
    claim > (SELECT 
            AVG(claim)
        FROM
            insurance
        WHERE
            bmi > (SELECT 
                    AVG(bmi)
                FROM
                    insurance
                WHERE
                    children >= 1 AND diabetic = 'Yes'
                        AND region = 'southwest'));

-- What is the difference in the average claim amount between patients who 
-- are smokers and patients who are non-smokers, and have the same BMI and number of children?
SELECT 
    ROUND(AVG(a.claim)) - ROUND(AVG(b.claim))
FROM
    insurance a
        JOIN
    insurance b ON a.bmi = b.bmi
        AND a.children = b.children
        AND a.smoker != b.smoker;
        

select avg(claim) from insurance where smoker ='Yes';
select avg(claim) from insurance where smoker ='No';

