#1
select er.eventno, er.datereq, er.dateheld, count(p.planno)
from eventrequest er, eventplan p
where er.eventno = p.eventno
and month(p.workdate) = 12
group by er.eventno
having count(p.planno) > 1;

#2
select p.planno, p.eventno, p.workdate, p.activity 
from eventplan p, eventrequest er, facility f
where month(p.workdate) = 12
and f.facname like 'Basket%'
and p.eventno = er.eventno
and er.facno = f.facno;

#3
select er.eventno, er.dateheld, er.status, er.estcost
from eventrequest er, employee e, facility f, eventplan p
where e.empname like 'Mary%'
and f.facname like 'Basket%'
and month(er.dateheld) in (10,11,12)
and er.facno = f.facno
and er.eventno = p.eventno
and p.empno = e.empno;

#4
select l.planno, l.lineno, r.resname, l.numberfld, lo.locname, l.timestart, l.timeend
from eventplanline l, resourcetbl r, location lo, eventrequest er, facility f, eventplan p
where f.facname like 'Basket%'
and p.Activity = 'Operation'
and month(p.workdate) in (10,11,12)
and er.facno = f.facno
and er.eventno = p.eventno
and p.planno = l.PlanNo
and l.resno = r.resno
and f.facno = lo.facno;

#1
insert into facility
values (10, 'Swimming Pool');
select * from facility;

#2
insert into location
values (1,10, 'Door');
select * from location;

#3
insert into location
values (2,10, 'Locker Room');

#4
SET SQL_SAFE_UPDATES = 0;
update location
set locname = 'Gate'
where locname = 'Door';
select * from location;

#5
delete from location
where locno = '2';