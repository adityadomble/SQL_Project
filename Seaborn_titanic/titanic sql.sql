CREATE DATABASE peractise;
use  peractise;

select * from seaborn_titanic;

select count(*) from seaborn_titanic;


# survived and non survived

select survived,count(*)as count
from seaborn_titanic
group by survived; 


select sex,avg(survived) as survival_rate
from seaborn_titanic
group by sex;


# age distibution by pclass
select pclass, min(age),max(age), avg(age) from seaborn_titanic
group by pclass
order by pclass asc;


# age < 12, survived or not?

select survived, count(*) as count
from seaborn_titanic
where age<12
group by survived;



#avg fare class 

SELECT  pclass ,avg (fare)as avg_fare from seaborn_titanic
group by pclass
order by pclass asc;


# embarked town,
SELECT embarked , count(*) as count
from titanic
GROUP BY embarked
ORDER BY count desc;
 


SELECT EMBARKED ,COUNT(*) AS COUNT
FROM SEABORN_TITANIC
GROUP BY embarked
order by count desc;

update SEABORN_TITANIC
 set embarked="s"
 where  embarked="";




