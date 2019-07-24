##   :feet:Doku_Database

#### [회원가입 테이블]

```sql
create table petmemeber(
	id varchar2(20) NOT NULL,
    email varchar2(100) NOT NULL,
    pwd varchar2(30) NOT NULL,
    pwdchk varchar2(30) NOT NULL,
    name varchar2(15) NOT NULL,
    nickname varchar2(30) NOT NULL,
    address varchar2(300) NOT NULL,
    pet varchar2(30),
    postcnt number(8,0),
    comcnt number(8,0)
);
```



#### [게시판 테이블과 시퀀스]

```sql
create table board(
	id number(8,0),
    header varchar2(18) NOT NULL,
    title varchar2(150) NOT NULL,
    content varchar2(3000) NOT NULL,
    writedate date,
    nickname varchar2(20) NOT NULL,
    cnt number(8,0),
    src varchar2(255)
);

Create sequence board_seq
start with 1
increment by 1
nomaxvalue;

```



#### [댓글 테이블과 시퀀스]

```sql
create table comments(
	nickname varchar2(20),
    writedate date,
    content varchar2(3000),
    id number(8,0),
    cnum number(8,0)
);

	create sequence comments_seq
	start with 1
	increment by 1
	nomaxvalue;

```



#### [달력 테이블과 시퀀스]

```sql
create table comments(
	id varchar2(100),
    title varchar2(500),
    startdate date,
    enddate date,
    nickname varchar2(20)
)

   create sequence cal_seq
   start with 1
   INCREMENT by 1
   NOMAXVALUE;
   
```



#### [지도 테이블]

```sql
create table map(
	id number (8,0),
    name varchar2(100),
    addr varchar2(1000),
    lat float(126),
    lng float(126),
    tel varchar2(100)
)
```



