#1
Select distinct city, state, zip 
from customer;

#2
select empname, department, phone, email
from employee
where phone like '3-%';

#3
select * from resourcetbl
where rate between 10 and 20
order by rate;

#4
select eventno, dateauth, status
from eventrequest
where status in ('Approved','Denied')
and dateauth between '2018-07-01' and '2018-07-31';

#5
select locno, locname 
from location, facility
where facname like 'Basket%'
and location.facno = facility.FacNo;

#6
select planno, count(lineno) as total_plan_lines, sum(numberfld) as total_resources
from eventplanline
group by planno
having count(lineno) > 0;
