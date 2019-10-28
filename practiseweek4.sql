#1
select er.eventno, er.dateheld, c.custno, c.custname, f.facno, f.facname
from eventrequest er, customer c, facility f 
where year(er.dateheld) = 2018
and city = 'Boulder'
and er.custno = c.custno
and er.facno = f.FacNo;

#2
select c.custno, c.custname, er.eventno, dateheld, f.facno, facname, (estcost/estaudience) as cost_per_person
from customer c, eventrequest er, facility f 
where year(er.dateheld) = 2018
and estcost/estaudience < 0.2
and er.custno = c.custno
and er.facno = f.FacNo;

#3
select c.custno, c.custname, SUM(er.EstCost) 
from customer c, eventrequest er
where er.status = 'Approved'
and c.custno = er.custno
group by c.custno, c.custname;

#4
insert into customer
values ('C666','Cricket','xyz street','Y', 'Self', '720000', 'Denver', 'CO', '80204');

#5
update resourcetbl
set rate = rate * 1.1
where resname = 'Nurse';

#6
DELETE FROM Customer
WHERE CustNo = 'C666';
