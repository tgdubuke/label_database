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
    
create table Wines(
    wineID number, 
    brand varchar2(25),
    alcContent number(4, 1),
    bottlerName varchar(25),
    netContent number(5, 1),
    class varchar(25),
    appellation varhchar(25)
);

create Sequence wineID_seq start with 100 increment by 1;

create table WineLabelForm(
    formID number,
    currentReviewerID number,
    dateSubmitted date,
    dateRejected date,
    dateAccpeted date,
    status varchar2(25),
    wineID number,
    vintage number(4, 0),
    ttbID number,
    repID number,
    dateBegan date,
    comments varchar2(100),
    year number(4, 0)
    Constraint WineLabelForm_PK Primary Key(formID),
    Constraint WineLabelForm_FK_1 Foreign Key (wineID) References (WineCompRep.wineID),
    Constraint WineLabelForm_FK_2 Foreign Key (ttbID) References (SuperAgent.ttbID),
    Constraint WineLabelForm_FK_3 Foreign Key (repID) References (WineCompRep.repID)
);

create Sequence formID_seq start with 100 increment by 1;

create table AgentWorksOn(
    username varchar2(25),
    formID number,
    Constraint AgentWorksOn_PK Primary Key (username, formID),
    Constraint AgentWorksOn_FK_1 Foreign Key (username) References (GovAgent.username),
    Constraint AgentWorksOn_FK_2 Foreign Key (formID) References (WineLabelForm.formID)
);
    
    