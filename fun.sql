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

ALTER TABLE fun add web NVARCHAR(60);
ALTER TABLE fun ALTER COLUMN name NVARCHAR(50);

insert into fun values
('f17','img\f17-2.jpg','f17-1.jpg','摸摸茶舖 TouchTea','https://www.instagram.com/touchteatea/','https://www.facebook.com/touchteatea/',
'茶舖','台灣台北市萬華區內江街166號1樓','週一至週日 14:00～22:30','02 2331 1770',null,null,'西門町','https://momotea-ice-cream-and-drink-shop.business.site/'),
('f18','img\f18-2.jpg','f18-1.jpg','臺灣之寶茗茶',null,'https://www.facebook.com/taiwantreasure28/?locale=zh_TW',
'茶行','台北市萬華區漢口街二段46號','週一至週日 11:00～21:30','02 2388 7316',null,null,'西門町','http://taiwan-treasure.okgo.tw/');

UPDATE fun
SET imagePath = REPLACE(imagePath, '\', '/')
WHERE imagePath LIKE '%\%';

