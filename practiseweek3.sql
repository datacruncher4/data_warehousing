select CustNo, Custname, Phone, City
from Customer;


select CustNo, Custname, Phone, City
from Customer
where State = 'CO';


SELECT * FROM eventrequest 
where EstCost > 4000
order by DateHeld;


SELECT eventno, dateheld, status, estaudience
FROM EventRequest
WHERE (Status = 'Approved' AND EstAudience > 9000) 
   OR (Status = 'Pending' AND EstAudience > 7000);



SELECT e.eventno, e.dateheld, e.custno, c.custname
from eventrequest e, customer c
where YEAR(e.DateHeld) = 2018
and month(e.DateHeld) = 12
and c.city = 'Boulder'
and e.custno = c.custno;



SELECT PlanNo, AVG(NumberFld) AS AvgNumResources, 
               COUNT(*) AS NumEventLines
  FROM EventPlanLine
  WHERE LocNo = 'L100'
  GROUP BY PlanNo
  HAVING COUNT(*) > 1;
