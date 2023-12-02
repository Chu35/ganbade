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
('f17','img\f17-2.jpg','f17-1.jpg','�N�N���E TouchTea','https://www.instagram.com/touchteatea/','https://www.facebook.com/touchteatea/',
'���E','�x�W�x�_���U�ذϤ�����166��1��','�g�@�ܶg�� 14:00��22:30','02 2331 1770',null,null,'����m','https://momotea-ice-cream-and-drink-shop.business.site/'),
('f18','img\f18-2.jpg','f18-1.jpg','�O�W���_����',null,'https://www.facebook.com/taiwantreasure28/?locale=zh_TW',
'����','�x�_���U�ذϺ~�f��G�q46��','�g�@�ܶg�� 11:00��21:30','02 2388 7316',null,null,'����m','http://taiwan-treasure.okgo.tw/');

UPDATE fun
SET imagePath = REPLACE(imagePath, '\', '/')
WHERE imagePath LIKE '%\%';

