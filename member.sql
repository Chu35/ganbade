select * from member

create table member
(id varchar(10),
gender varchar(20),
name varchar(10),
pwd varchar(20) not null,
collect varchar(10),
primary key(name),
)

delete from  member where id=''

drop table member_knowledge

CREATE TABLE member_collect (
    member_name varchar(10),
    knowledge_id varchar(10),
    PRIMARY KEY (member_name, knowledge_id),
    FOREIGN KEY (member_name) REFERENCES member(name),
    FOREIGN KEY (knowledge_id) REFERENCES Knowledge(id)
);
