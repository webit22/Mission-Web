create table t_member(
    id  varchar2(50) primary key
    , password varchar2(50) not null
    , name varchar2(30) not null
    , type char(1) default 'U'
);

insert into t_member
 values('admin', 'admin', '관리자', 'S');
 
insert into t_member(id, password, name)
 values('user', 'user', '사용자');
 
commit;