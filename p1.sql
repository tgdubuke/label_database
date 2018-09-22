-- tdubuke rscalfani
-- Project 1

drop table Accounts cascade constraints;
drop table GovAgent cascade constraints;
drop table WineCompRep cascade constraints;
drop table Wines cascade constraints;
drop table WineLabelForm cascade constraints;
drop table WineLabelFormTtbID cascade constraints;
drop sequence ttbID_seq;
drop sequence repID_seq;
drop sequence wineID_seq;
drop sequence formID_seq;

create table Accounts(
    username varchar2(25),
    accPassword varchar2(25),
    Constraint Accounts_PK Primary Key (username)
);
    
create table GovAgent (
    ttbID number,
    username varchar2(25),
    phoneNum varchar2(15),
    firstName varchar2(25),
    lastName varchar2(25),
    email varchar2(50),
    Constraint GovAgent_PK Primary Key (ttbID),
    Constraint GovAgent_FK_1 Foreign Key (username) references Accounts(username)
);
create sequence ttbID_seq start with 100 increment by 1;


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
create sequence repID_seq start with 100 increment by 1;
    
create table Wines(
    wineID number,
    brand varchar2(25),
    alcContent number(4, 1),
    bottlerName varchar(25),
    netContent number(5, 1),
    wine_class varchar(25),
    appellation varchar2(25),
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
    repID number,
    Constraint WineLabelForm_PK Primary Key(formID),
    Constraint WineLabelForm_FK_1 Foreign Key (wineID) References Wines(wineID),
    Constraint WineLabelForm_FK_2 Foreign Key (currentReviewerID) References GovAgent(ttbID),
    Constraint WineLabelForm_FK_3 Foreign Key (repID) References WineCompRep(repID),
    Constraint WineLabelForm_UQ_1 Unique (vintage, wineID)
);
create Sequence formID_seq start with 100 increment by 1;

create table WineLabelFormTtbID(
    formID number,
    ttbID number,
    dateBegan date,
    comments varchar2(100),
    Constraint WineLabelFormTtbID_PK Primary Key (formID, ttbID),
    Constraint WineLabelFormForm_FK Foreign Key (formID) References WineLabelForm(formID),
    Constraint WineLabelFormTtbID_FK Foreign Key (ttbID) References GovAgent(ttbID)
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

Select * From Accounts;

--Insert GovAgent
Insert into GovAgent values(ttbID_seq.nextVal, 'alexalto','9785956889','Alex','Alto','alex@supagent.com');
Insert into GovAgent values(ttbID_seq.nextVal, 'billburr','7465856374','Bill','Burr','bill@supagent.com');
Insert into GovAgent values(ttbID_seq.nextVal, 'candacecarr','1094758394','Candace','Carr','candace@supagent.com');
Insert into GovAgent values(ttbID_seq.nextVal, 'daviddot','1238764567','David','Dot','david@supagent.com');
Insert into GovAgent values(ttbID_seq.nextVal, 'emmaenglund','1647485746','Emma','Englund','emma@supagent.com');
Insert into GovAgent values(ttbID_seq.nextVal, 'frankfallen','8756473847','Frank','Fallen','frank@supagent.com');
Insert into GovAgent values(ttbID_seq.nextVal, 'greggreen','2647589374','Greg','Green','greg@supagent.com');
Insert into GovAgent values(ttbID_seq.nextVal, 'hannahhart','2476569475','Hannah','Hart','hannah@supagent.com');
Insert into GovAgent values(ttbID_seq.nextVal, 'ianippo','6574899371','Ian','Ippo','ian@supagent.com');
Insert into GovAgent values(ttbID_seq.nextVal, 'johnjum','2255667781','John','Jum','john@supagent.com');

select * from GovAgent;

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

--Insert Wines
Insert into Wines values(wineID_seq.nextVal, 'Chianti Classico DOCG', 14.5, 'Banfi Tuscany', 750, 'Red', 'Tuscany');
Insert into Wines values(wineID_seq.nextVal, 'ASKA', 14.0, 'Banfi Tuscany', 750, 'Red', 'Bolgheri');
Insert into Wines values(wineID_seq.nextVal, 'Centine Bianco', 12, 'Banfi Tuscany', 750, 'White', 'Tuscany');
Insert into Wines values(wineID_seq.nextVal, 'Centine Rose', 12.5, 'Banfi Tuscany', 750, 'Rose', 'Tuscany');
Insert into Wines values(wineID_seq.nextVal, 'Centine Rosso', 12.5, 'Banfi Tuscany', 750, 'Red', 'Tuscany');
Insert into Wines values(wineID_seq.nextVal, 'Chianti Classico Riserva', 13, 'Banfi Tuscany', 750, 'Red', 'Tuscany');
Insert into Wines values(wineID_seq.nextVal, 'Chianti Superiore', 13.3, 'Banfi Tuscany', 750, 'Red', 'Tuscany');
Insert into Wines values(wineID_seq.nextVal, 'Col Di Sasso', 12.5, 'Banfi Tuscany', 750, 'Red', 'Tuscany');
Insert into Wines values(wineID_seq.nextVal, 'Collepino', 13, 'Banfi Tuscany', 750, 'Red', 'Tuscany');
Insert into Wines values(wineID_seq.nextVal, 'Fonte Alla Selva', 13.5, 'Banfi Tuscany', 750, 'Red', 'Tuscany');

Select * From Wines;

--Insert WineLabelForm
Insert into WineLabelForm values(formID_seq.nextval, 100, '27-APR-17', null, null, 'Under Review', 109, 2015, 100);
Insert into WineLabelForm values(formID_seq.nextval, 101, '26-APR-17', null, null, 'Under Review', 108, 2015, 102);
Insert into WineLabelForm values(formID_seq.nextval, 102, '25-APR-17', null, null, 'Under Review', 107, 2015, 101);
Insert into WineLabelForm values(formID_seq.nextval, 103, '24-APR-17', null, null, 'Under Review', 106, 2015, 104);
Insert into WineLabelForm values(formID_seq.nextval, 104, '23-APR-17', '24-AUG-17', null, 'Failed', 105, 2015, 103);
Insert into WineLabelForm values(formID_seq.nextval, 105, '22-APR-17', null, '24-AUG-17', 'Passed', 104, 2015, 106);
Insert into WineLabelForm values(formID_seq.nextval, 106, '21-APR-17', null, null, 'Under Review', 103, 2015, 105);
Insert into WineLabelForm values(formID_seq.nextval, 107, '20-APR-17', null, null, 'Under Review', 102, 2015, 108);
Insert into WineLabelForm values(formID_seq.nextval, 108, '19-APR-17', null, null, 'Under Review', 101, 2015, 107);
Insert into WineLabelForm values(formID_seq.nextval, 109, '18-APR-17', null, null, 'Under Review', 100, 2015, 100);
Insert into WineLabelForm values(formID_seq.nextval, 100, '17-APR-17', null, null, 'Under Review', 109, 2014, 102);
Insert into WineLabelForm values(formID_seq.nextval, 101, '16-APR-17', '20-APR-18', null, 'Failed', 108, 2014, 101);
Insert into WineLabelForm values(formID_seq.nextval, 102, '15-APR-17', null, null, 'Under Review', 107, 2014, 104);
Insert into WineLabelForm values(formID_seq.nextval, 103, '14-APR-17', null, null, 'Under Review', 106, 2014, 103);
Insert into WineLabelForm values(formID_seq.nextval, 104, '13-APR-17', null, null, 'Under Review', 105, 2014, 106);
Insert into WineLabelForm values(formID_seq.nextval, 105, '12-APR-17', null, null, 'Under Review', 104, 2014, 105);
Insert into WineLabelForm values(formID_seq.nextval, 106, '11-APR-17', null, null, 'Under Review', 103, 2014, 108);
Insert into WineLabelForm values(formID_seq.nextval, 107, '10-APR-17', null, null, 'Under Review', 102, 2014, 107);
Insert into WineLabelForm values(formID_seq.nextval, 108, '09-APR-17', null, null, 'Under Review', 101, 2014, 109);
Insert into WineLabelForm values(formID_seq.nextval, 109, '08-APR-17', null, null, 'Under Review', 100, 2014, 100);

Select * From WineLabelForm;

-- Insert WineLabelFormTtbID
Insert into WineLabelFormTtbID values (100, 100, '05-SEP-18', 'Tasty');
Insert into WineLabelFormTtbID values (100, 101, '04-SEP-18', 'Tasty');
Insert into WineLabelFormTtbID values (101, 101, '04-SEP-18', 'Delightful');
Insert into WineLabelFormTtbID values (101, 102, '03-SEP-18', 'Delightful');
Insert into WineLabelFormTtbID values (102, 102, '03-SEP-18', 'Fragrant');
Insert into WineLabelFormTtbID values (102, 103, '02-SEP-18', 'Fragrant');
Insert into WineLabelFormTtbID values (103, 103, '02-SEP-18', 'Wonderful');
Insert into WineLabelFormTtbID values (103, 104, '01-SEP-18', 'Wonderful');
Insert into WineLabelFormTtbID values (104, 104, '01-SEP-18', 'Nasty');
Insert into WineLabelFormTtbID values (105, 105, '29-SEP-18', 'Delicious');
Insert into WineLabelFormTtbID values (106, 106, '05-SEP-18', 'Tasty');
Insert into WineLabelFormTtbID values (107, 107, '05-SEP-18', 'Tasty');
Insert into WineLabelFormTtbID values (108, 108, '04-SEP-18', 'Delightful');
Insert into WineLabelFormTtbID values (109, 109, '03-SEP-18', 'Fragrant');
Insert into WineLabelFormTtbID values (110, 100, '02-SEP-18', 'Wonderful');
Insert into WineLabelFormTtbID values (111, 101, '01-SEP-18', 'Nasty');
Insert into WineLabelFormTtbID values (112, 102, '29-SEP-18', 'Delicious');
Insert into WineLabelFormTtbID values (113, 103, '05-SEP-18', 'Tasty');
Insert into WineLabelFormTtbID values (114, 104, '05-SEP-18', 'Tasty');
Insert into WineLabelFormTtbID values (115, 105, '04-SEP-18', 'Delightful');
Insert into WineLabelFormTtbID values (116, 106, '03-SEP-18', 'Fragrant');
Insert into WineLabelFormTtbID values (117, 107, '02-SEP-18', 'Wonderful');
Insert into WineLabelFormTtbID values (118, 108, '01-SEP-18', 'Nasty');
Insert into WineLabelFormTtbID values (119, 109, '29-SEP-18', 'Delicious');

Select * From WineLabelFormTtbID;
