create table CLIENT(
    CLIENT_id  Number(5)      CONSTRAINT CLIENT_CLIENT_ID_PK PRIMARY KEY,
    CLIENT_NAME Varchar2(20)  CONSTRAINT CLIENT_CLIENT_NAME_NN NOT NULL   CONSTRAINT CLIENT_CLIENT_NAME_UK UNIQUE,
    CLIENT_ADDRESS Varchar2(30),
    CLIENT_CITY Varchar2(10)  CONSTRAINT CLIENT_CLIENT_CITY_NN NOT NULL,
    CLIENT_PROV Char(2)       CONSTRAINT CLIENT_CLIENT_PROV_NN NOT NULL,
    CLIENT_POSTAL Char(6)     CONSTRAINT CLIENT_CLIENT_POSTAL_NN NOT NULL

create table PROG(
    Prog_id  Number(5)      CONSTRAINT PROG_Prog_id_PK PRIMARY KEY,
    Prog_name Varchar2(30)  CONSTRAINT PROG_Prog_name_NN NOT NULL,
    Prog_office Char(4)     CONSTRAINT PROG_Prog_office_NN NOT NULL,
    Prog_phone Char(10)

create table PROJECT(
    Project_id   Number(6)      CONSTRAINT PROJECT_Project_id_PK PRIMARY KEY,
    Proj_name    Varchar2(40)   CONSTRAINT PROJECT_Proj_name_NN NOT NULL  CONSTRAINT PROJECT_Proj_name_UK UNIQUE,
    Complet_date Date,
    Total_cost Number(8,2)      CONSTRAINT PROJECT_Total_cost_CK CHECK (Total_cost >0),
    CLIENT_id  Number(5)        CONSTRAINT PROJECT_CLIENT_id_NN NOT NULL CONSTRAINT PROJECT_CLIENT_id_FK REFERENCES CLIENT (CLIENT_id)

create table project_staff
    (prog_id number(5)
    ,project_id number(6)
    ,week_year char(5)
    ,hours_worked number(4,1) not null
    ,constraint hours_worked_min check (hours_worked>0)
    ,constraint prog_id_fk foreign key(prog_id) references prog(prog_id)
    ,constraint project_id_fk foreign key(project_id) references project(project_id)
    ,constraint project_staff_id_pk primary key (prog_id, project_id, week_year)

