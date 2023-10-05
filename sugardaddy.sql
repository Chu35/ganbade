create table sugardaddy
(id varchar(10) primary key,
name varchar(20),
imagepath NVARCHAR(55),
href NVARCHAR(60),
)

insert into sugardaddy values
('s13','¨Ê²±¦t','img/s16.png','https://www.jsy-tea.com/')

select * from sugardaddy ORDER BY id 
ALTER TABLE sugardaddy ALTER COLUMN href NVARCHAR(200);
DELETE FROM sugardaddy where id='s16'

UPDATE sugardaddy SET imagepath='img/s13.png' WHERE id='s13';