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
('f9','img\f9-2.jpg','img\f9-1.jpg','�x�_���K�[���]�د���o���s����',null,'https://www.facebook.com/pinglin.tea.m/?locale=zh_TW','�ժ��]','�x�_����s�ϫ��n���T�q40��8��2��','�g�G�ܶg�� 09:00��17:00','02 2234 0568',null,'https://reurl.cc/xGd0MN','��]',null)

UPDATE fun SET time='�g�@�ܶg�� 09:00��17:00�B�g���ζg�� 09:00��17:30(���]�e30��������Ⲽ)' WHERE id='f8'

UPDATE  fun SET web='https://openmuseum.tw/museum/sinhongchoon' WHERE id = 'f3';
