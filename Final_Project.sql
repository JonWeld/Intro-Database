select Salary
from Jobs
where BusinessTitle like '%programming%'

----------------------------------------------------------------------------------------------------

select Salary
from Jobs
where BusinessTitle like '%network engineer%'

----------------------------------------------------------------------------------------------------

select SalaryRangeFrom, SalaryRangeTo
from Jobs
where SalaryRangeFrom >= 100000 and SalaryRangeTo <= 150000

----------------------------------------------------------------------------------------------------

select BusinessTitle
from Jobs
where BusinessTitle like '%attorney%'

----------------------------------------------------------------------------------------------------

CREATE VIEW Job_view AS 
SELECT * 
FROM Jobs 
WHERE Jobs.JobID IN (SELECT Agencies.Agency_id FROM Agencies);

----------------------------------------------------------------------------------------------------

CREATE TRIGGER Job_trigger
AFTER INSERT ON Jobs
BEGIN
  INSERT INTO Jobs (JobID, BusinessTitle, SalaryRangeFrom,SalaryRangeTo)
  VALUES (Jobs.JobID, Jobs.BusinessTitle, Jobs.SalaryRangeFrom, Jobs.SalaryRangeTo);
END;

----------------------------------------------------------------------------------------------------

with Jobs_cte as (
    select * from Jobs
    where BusinessTitle like '%programming%'
)
select *
from Jobs_cte
where SalaryRangeTo <= 150000;

