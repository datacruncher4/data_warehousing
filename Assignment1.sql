CREATE TABLE Customer 
 (CustNo VARCHAR(8) NOT NULL, 
  CustName VARCHAR(30) NOT NULL, 
  Address VARCHAR(50) NOT NULL, 
  Internal CHAR(1) NOT NULL, 
  Contact VARCHAR(35) NOT NULL, 
  Phone VARCHAR(11) NOT NULL, 
  City VARCHAR(30) NOT NULL,
  State VARCHAR(2) NOT NULL, 
  Zip VARCHAR(10) NOT NULL,
  CONSTRAINT PK_CUSTOMER PRIMARY KEY (CustNo) 
  );

CREATE TABLE Facility
(FacNo VARCHAR(8) NOT NULL, 
 FacName VARCHAR(30) NOT NULL,
 Constraint Primary Key (FacNo) 
);

alter table facility
modify column facname VARCHAR(30) unique;


CREATE TABLE Location
(LocNo VARCHAR(8) NOT NULL, 
 FacNo VARCHAR(8), 
 LocName VARCHAR(30) NOT NULL,
 CONSTRAINT PK_LOCATION PRIMARY KEY (LocNo),
 constraint Foreign key (FacNo) references facility (FacNo)
);

Alter table location 
modify column facno varchar(8) not null;


# Assignment 1 

Create table employee (
	EmpNo Varchar(30) not null,
    EmpName Varchar(30) not null,
    Department Varchar(30) not null,
    Email Varchar(30) not null,
    Phone Varchar(11) not null,
    constraint pk_empno Primary Key (EmpNo)
);

Create table resourcetbl (
	ResNo Varchar(30) not null,
    ResName Varchar(30) not null,
    Rate Varchar(30) not null,
    constraint pk_resno Primary Key (ResNo)
);    

Alter table resourcetbl
modify column rate Varchar(30) not null check (Rate > 0);


Create table eventrequest (
	EventNo Varchar(5) not null,
    DateHeld DATE not null,
    DateReq Date not null,
    CustNo VARCHAR(8) NOT NULL,
    FacNo VARCHAR(8) NOT NULL, 
    DateAuth Date,
    Status VARCHAR(15) not null check (Status in ('Pending', 'Denied', 'Approved')),
    EstCost VARCHAR(8) NOT NULL, 
    EstAudience VARCHAR(8) NOT NULL check (EstAudience > 0),
    BudNo VARCHAR(8),
    constraint pk_eventno Primary Key (EventNo),
    constraint Foreign Key (CustNo) references customer (CustNo),
    constraint Foreign Key (FacNo) references facility (FacNo)
);
    
    
Create table eventplan (
	PlanNo Varchar(5) not null,
    EventNo Varchar(5) not null,
    WorkDate DATE not null,
    Notes varchar(50),
    Activity varchar(15) not null,
    EmpNo Varchar(30) not null,
    constraint pk_planno Primary Key (PlanNo),
    constraint Foreign Key (EventNo) references eventrequest (EventNo),
    constraint Foreign Key (EmpNo) references Employee (EmpNo)
);