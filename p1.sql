drop table Accounts cascade constraints;
drop table GovAgent cascade constraints;
drop table SuperAgent cascade constraints;
drop table WineCompRep cascade constraints;
drop table Wines cascade constraints;
drop table WineLabelForm cascade constraints;
drop table AgentWorksOn cascade constraints;
drop sequence ttbID_seq;
drop sequence repID_seq;
drop sequence wineID_seq;
drop sequence formID_seq;


-- tdubuke rscalfani
create table Accounts(
    username varchar2(25),
    accPassword varchar2(25),
    Constraint Accounts_PK Primary Key (username)
);
    
create table GovAgent (
    username varchar2(25),
    phoneNum varchar2(15),
    firstName varchar2(25),
    lastName varchar2(25),
    email varchar2(50),
    Constraint GovAgent_PK Primary Key (username),
    Constraint GovAgent_FK_1 Foreign Key (username) references Accounts(username)
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
    Constraint Rep_User_FK Foreign Key (username) references Accounts(username)
);
    
create table Wines(
    wineID number, 
    brand varchar2(25),
    alcContent number(4, 1),
    bottlerName varchar(25),
    netContent number(5, 1),
    wine_class varchar(25),
    appellation varchar2(25),
    year number(4, 0),
    Constraint Wines_PK Primary Key (wineID)
);

create Sequence wineID_seq start with 100 increment by 1;

create table WineLabelForm(
    formID number,
    currentReviewerID number,
    dateSubmitted date,
    dateRejected date,
    dateAccepted date,
    status varchar2(25),
    wineID number,
    vintage number(4, 0),
    ttbID number,
    repID number,
    dateBegan date,
    comments varchar2(100),
    Constraint WineLabelForm_PK Primary Key(formID),
    Constraint WineLabelForm_FK_1 Foreign Key (wineID) References Wines(wineID),
    Constraint WineLabelForm_FK_2 Foreign Key (ttbID) References SuperAgent(ttbID),
    Constraint WineLabelForm_FK_3 Foreign Key (repID) References WineCompRep(repID),
    Constraint WineLabelFOrm_FK_4 Foreign Key (vintage) References Wine(year),
    Constraint WineLabelForm_UQ_1 Unique (vintage, wineID)
);

create Sequence formID_seq start with 100 increment by 1;

create table AgentWorksOn(
    username varchar2(25),
    formID number,
    Constraint AgentWorksOn_PK Primary Key (username, formID),
    Constraint AgentWorksOn_FK_1 Foreign Key (username) References GovAgent(username),
    Constraint AgentWorksOn_FK_2 Foreign Key (formID) References WineLabelForm(formID)
);

--Insert Accounts Data
Insert into Accounts values('wwong2','cs3431');
Insert into Accounts values('alexalto','alex123');
Insert into Accounts values('billburr','bill123');
Insert into Accounts values('candacecarr','candace123');
Insert into Accounts values('daviddot','davic123');
Insert into Accounts values('emmaenglund','emma123');
Insert into Accounts values('frankfallen','frank123');
Insert into Accounts values('greggreen','greg123');
Insert into Accounts values('hannahhart','hannah123');
Insert into Accounts values('ianippo','ian123');
Insert into Accounts values('johnjum','john123');
Insert into Accounts values('karenkarl','karen123');
Insert into Accounts values('laurieleshin','laurie123');
Insert into Accounts values('mollymann','molly123');
Insert into Accounts values('nolannell','nolan123');
Insert into Accounts values('oprahone','oprah123');
Insert into Accounts values('percyprang','percy123');
Insert into Accounts values('quentinquinn','quentin123');
Insert into Accounts values('robbierotten','robbie123');
Insert into Accounts values('sammisanderson','sammi123');

--Insert TTB Agents (first into govvAgent, then into s superagent)
Insert into GovAgent values('alexalto','9785956889','Alex','Alto','alex@supagent.com');
Insert into SuperAgent values('alexalto',ttbID_seq.nextVal);
Insert into GovAgent values('billburr','7465856374','Bill','Burr','bill@supagent.com');
Insert into SuperAgent values('billburr',ttbID_seq.nextVal);
Insert into GovAgent values('candacecarr','1094758394','Candace','Carr','candace@supagent.com');
Insert into SuperAgent values('candacecarr',ttbID_seq.nextVal);
Insert into GovAgent values('daviddot','1238764567','David','Dot','david@supagent.com');
Insert into SuperAgent values('daviddot',ttbID_seq.nextVal);
Insert into GovAgent values('emmaenglund','1647485746','Emma','Englund','emma@supagent.com');
Insert into SuperAgent values('emmaenglund',ttbID_seq.nextVal);
Insert into GovAgent values('frankfallen','8756473847','Frank','Fallen','frank@supagent.com');
Insert into SuperAgent values('frankfallen',ttbID_seq.nextVal);
Insert into GovAgent values('greggreen','2647589374','Greg','Green','greg@supagent.com');
Insert into SuperAgent values('greggreen',ttbID_seq.nextVal);
Insert into GovAgent values('hannahhart','2476569475','Hannah','Hart','hannah@supagent.com');
Insert into SuperAgent values('hannahhart',ttbID_seq.nextVal);
Insert into GovAgent values('ianippo','6574899371','Ian','Ippo','ian@supagent.com');
Insert into SuperAgent values('ianippo',ttbID_seq.nextVal);
Insert into GovAgent values('johnjum','2255667781','John','Jum','john@supagent.com');
Insert into SuperAgent values('johnjum',ttbID_seq.nextVal);

select * from SuperAgent sa
    Join GovAgent ga
    on ga.username = sa.username;

--Insert WineCompReps
Insert into WineCompRep values(repID_seq.nextval, 'karen@winerep.com','8765456765','Karen','Karl','Wine Vine','karenkarl');
Insert into WineCompRep values(repID_seq.nextval, 'laurie@winerep.com','6574859687','Laurie','Leshin','Wine Vine','karenkarl');
Insert into WineCompRep values(repID_seq.nextval, 'molly@winerep.com','3465784756','Molly','Mann','Wining for Wine','karenkarl');
Insert into WineCompRep values(repID_seq.nextval, 'nolan@winerep.com','3948596879','Nolan','Nell','Wining for Winr','karenkarl');
Insert into WineCompRep values(repID_seq.nextval, 'oprah@winerep.com','1039486789','Oprah','One','Wining for Wine','karenkarl');
Insert into WineCompRep values(repID_seq.nextval, 'percy@winerep.com','1823759395','Percy','Prang','Fine Wines','karenkarl');
Insert into WineCompRep values(repID_seq.nextval, 'quentin@winerep.com','9875847586','Quentin','Quinn','Fine Wines','karenkarl');
Insert into WineCompRep values(repID_seq.nextval, 'robbie@winerep.com','3748595867','Robbie','Rotten ','First Wine','karenkarl');
Insert into WineCompRep values(repID_seq.nextval, 'sammi@winerep.com','3388574839','Sammi','Sanderson','First Wine','karenkarl');
Insert into WineCompRep values(repID_seq.nextval, 'wwong2@winerep.com','1233489566','Wilson','Wong','First Wine','karenkarl');

select * from WineCompRep;

-- Insert into Wines
insert into Wines values(wineID_seq.nextVal, 'Chianti Classico DOCG', 14.5, 'Banfi Tuscany', 750, 'Red', 'Tuscany');
insert into Wines values(wineID_seq.nextVal, 'ASKA', 14.0, 'Banfi Tuscany', 750, 'Red', 'Bolgheri');
insert into Wines values(wineID_seq.nextVal, 'Centine Blanco', 12, 'Banfi Tuscany', 750, 'White', 'Tuscany');
insert into Wines values(wineID_seq.nextVal, 'Centine Rose', 12.5, 'Banfi Tuscany', 750, 'Rose', 'Tuscany');
insert into Wines values(wineID_seq.nextVal, 'Centine Rosso', 12.5, 'Banfi Tuscany', 750, 'Red', 'Tuscany');
insert into Wines values(wineID_seq.nextVal, 'Chianti Classico Riserva DOCG', 13, 'Banfi Tuscany', 750, 'Red', 'Tuscany');
insert into Wines values(wineID_seq.nextVal, 'Chianti Superiore', 13.3, 'Banfi Tuscany', 750, 'Red', 'Tuscany');
insert into Wines values(wineID_seq.nextVal, 'Col Di Sasso', 12.5, 'Banfi Tuscany', 750, 'Red', 'Tuscany');
insert into Wines values(wineID_seq.nextVal, 'Collepino', 13, 'Banfi Tuscany', 750, 'Red', 'Tuscany');
insert into Wines values(wineID_seq.nextVal, 'Fonte Alla Selva', 13.5, 'Banfi Tuscany', 750, 'Red', 'Tuscany');

Select * From Wines;

    