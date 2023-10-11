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
('f9','img\f9-2.jpg','img\f9-1.jpg','台北市鐵觀音包種茶研發推廣中心',null,'https://www.facebook.com/pinglin.tea.m/?locale=zh_TW','博物館','台北市文山區指南路三段40巷8之2號','週二至週日 09:00～17:00','02 2234 0568',null,'https://reurl.cc/xGd0MN','木柵',null)

UPDATE fun SET time='週一至週五 09:00～17:00、週六及週日 09:00～17:30(閉館前30分鐘停止售票)' WHERE id='f8'

UPDATE  fun SET web='https://openmuseum.tw/museum/sinhongchoon' WHERE id = 'f3';
