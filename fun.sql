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
('f7','img\f7-2.jpg','img\f7-1.jpg','HANKO 60 �p�K�p��','https://www.instagram.com/barhanko60/','https://www.facebook.com/hanko60','�F�o�s�a','�x�_���U�ذϺ~�f��G�q60��','�g��ܶg�| 20:00��02:00�B�g���g�� 20:00�V03:00','02 2381 0808',null,null,'����m',null)

UPDATE fun SET time='10:30��18:20�]�̫��I�\ : 17:20�^' WHERE id='f6';

UPDATE  fun SET web='https://openmuseum.tw/museum/sinhongchoon' WHERE id = 'f3';
