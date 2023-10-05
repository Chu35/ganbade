create table fun
(id varchar(10) primary key,
imagePath NVARCHAR(255),
imagePathicon NVARCHAR(255),
name varchar(20),
instagram NVARCHAR(60),
facebook NVARCHAR(60),
classification varchar(20),
place varchar(50),
time nvarchar(50),
phone varchar(20),
)

select * from fun
drop table fun
ALTER TABLE fun add web NVARCHAR(60);
ALTER TABLE fun ALTER COLUMN name NVARCHAR(50);
insert into fun values
('f7','img\f7-2.jpg','img\f7-1.jpg','HANKO 60 如醉如夢','https://www.instagram.com/barhanko60/','https://www.facebook.com/hanko60','沙發酒吧','台北市萬華區漢口街二段60號','週日至週四 20:00～02:00、週五週六 20:00–03:00','02 2381 0808',null,null,'西門町',null)

UPDATE fun SET time='10:30～18:20（最後點餐 : 17:20）' WHERE id='f6';

UPDATE  fun SET web='https://openmuseum.tw/museum/sinhongchoon' WHERE id = 'f3';
