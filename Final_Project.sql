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

create VIEW Job_view as 
select * 
from Jobs 
where Jobs.JobID in (select Agencies.Agency_id from Agencies);

----------------------------------------------------------------------------------------------------

create TRIGGER Job_trigger
after insert on Jobs
begin
  insert into Jobs (JobID, BusinessTitle, SalaryRangeFrom,SalaryRangeTo)
  values (Jobs.JobID, Jobs.BusinessTitle, Jobs.SalaryRangeFrom, Jobs.SalaryRangeTo);
end;

----------------------------------------------------------------------------------------------------

with Jobs_cte as (
    select * from Jobs
    where BusinessTitle like '%programming%'
)
select *
from Jobs_cte
where SalaryRangeTo <= 150000;

