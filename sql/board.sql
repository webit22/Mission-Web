-- �Խ��� ���̺� ����
create table t_board(
    no          number(5)   primary key
    , title     varchar2(200)   not null
    , writer    varchar2(50)    not null
    , content   varchar2(4000)  not null
    , view_cnt  number(5)  default 0
    , reg_date  date    default sysdate
);

drop sequence seq_t_board_no;
create sequence seq_t_board_no;

alter sequence seq_t_board_no nocache;

-- select seq_t_board_no.nextval from dual;

select * from t_board;

insert into t_board(no, title, writer, content)
 values(seq_t_board_no.nextval, '�����Դϴ�', 'ȫ�浿', '�����Դϴ�');
insert into t_board(no, title, writer, content)
 values(seq_t_board_no.nextval, '����2�Դϴ�', 'ȫ�浿', '����2�Դϴ�'); 

-- ÷������ ���̺�
create table t_board_file(
    no number(10)   primary key
    , board_no  number(10) not null
    , file_ori_name varchar2(100)
    , file_save_name varchar2(100)
    , file_size number(10)
);

create sequence seq_t_board_file_no nocache;
 
commit;















