use ganbade

create table Knowledge
(id varchar(10) primary key,
name varchar(20),
type varchar(20),
place varchar(20),
altitude varchar(40),
bake varchar(20),
ferment varchar(20),
shape varchar(40),
classification varchar(20),
season varchar(20),
)

delete from Knowledge where id='o9'

select * from knowledge

insert into Knowledge values
	('G1','�����K���','�C�߬a�J','�O�W�s�_�T�l��','����200M�C��','�L����','���o��','��Ĥ@�ߤ@�����ί���','���','�K�B�V��u'),
	('G2','�����s���s���','�C�ߤj�N','�O�W�Ÿq���s','����1500M���s �t���[�g','�L����','���o��','��Ĥ@�ߤG���y�ί���','���','�L�B���u'),	
	('G3','�������','�x��12��','�O�W�n��ˤs���Y','','�L����','���o��','��Ĥ@�ߤG���y������','���','�K�B�V��u')

insert into Knowledge values
	('R1','���ɬ���','�x��18��','�O�W�Ὤ���J�m','���g�[���[�g','�L����','���o��','��Ĥ@�ߤG�����ί���','����','�L�u'),
	('R2','�Ὤ�e������','�j���Q�s','�O�W�Ὤ���J�m','���g�[���[�g','������','���o��','��Ĥ@�ߤG�����ί���','����','�L�u'),
	('R3','�����s���s����','�x��12���B�����B27�J','�O�W�Ÿq�����s�س�','����1200M �t���[�g','�L����','���o��','��Ĥ@�ߤG���y�ί���','����','�L�u')

ALTER TABLE Knowledge
ADD image_path NVARCHAR(255);
UPDATE Knowledge SET altitude='����1600����' WHERE id='o7';


ALTER TABLE Knowledge ADD introduce NVARCHAR(255);
ALTER TABLE Knowledge ALTER COLUMN introduce NVARCHAR(500);

ALTER TABLE Knowledge ADD FOREIGN KEY (id) references member (collect);

UPDATE Knowledge SET image_path='img/b2.png' WHERE id='b2';
UPDATE Knowledge SET id='B1' WHERE id=' B1'

select * from knowledge

UPDATE Knowledge SET bake='�L�H��' , ferment='���o��'
WHERE id='o8';

UPDATE Knowledge SET season='�L�u'
WHERE id='o3';

