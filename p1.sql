-- tdubuke rscalfani
create table Account(
    username varchar2(25),
    password varchar2(25),
    Constraint Account_PK Primary Key (username)
    );
    
create table GovAgent (
    username varchar2(25),
    phoneNum varchar2(15),
    firstName varchar2(25),
    lastName varchar2(25),
    email varchar2(50),
    Constraint GovAgent_PK Primary Key (username),
    Constraint Agent_User_FK Foreign Key (username) references Account(username)
    );
  
create sequence ttbID_seq start with 100 increment by 1;

create table SuperAgent (
    username varchar2(25),
    ttbID number,
    Constraint SuperAgent_PK Primary Key (username),
    Constraint ttbID_UQ Unique (ttbID),
    Constraint SuperAgent_User_FK Foreign Key (username) references GovAgent(username)
);

create sequence repID_seq start with 100 increment by 1;

create table WineCompRep (
    repID number,
    email varchar2(50),
    phoneNum varchar2(15),
    firstName varchar2(25),
    lastName varchar2(25),
    copmanyName varchar2(25),
    username varchar2(25),
    Constraint WineCompRep_PK Primary Key (repID),
    Constraint Rep_User_FK Foreign Key (username) references Account(username)
    );
    