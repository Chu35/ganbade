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
drop table Knowledge
delete from Knowledge where id='a1'

select * from knowledge

update Knowledge set bake='���H��' where bake='������'

insert into Knowledge values
	('G1','�����K���','�C�߬a�J','�O�W�s�_�T�l��','����200M�C��','�L����','���o��','��Ĥ@�ߤ@�����ί���','���','�K�B�V��u'),
	('G2','�����s���s���','�C�ߤj�N','�O�W�Ÿq���s','����1500M���s �t���[�g','�L����','���o��','��Ĥ@�ߤG���y�ί���','���','�L�B���u'),	
	('G3','�������','�x��12��','�O�W�n��ˤs���Y','','�L����','���o��','��Ĥ@�ߤG���y������','���','�K�B�V��u')

insert into Knowledge values
	('R1','���ɬ���','�x��18��','�O�W�Ὤ���J�m','���g�[���[�g','�L����','���o��','��Ĥ@�ߤG�����ί���','����','�L�u'),
	('R2','�Ὤ�e������','�j���Q�s','�O�W�Ὤ���J�m','���g�[���[�g','������','���o��','��Ĥ@�ߤG�����ί���','����','�L�u'),
	('R3','�����s���s����','�x��12���B�����B27�J','�O�W�Ÿq�����s�س�','����1200M �t���[�g','�L����','���o��','��Ĥ@�ߤG���y�ί���','����','�L�u')

insert into Knowledge values
	('O1','�[���Q�s','�C�߯Q�s�B�x��12��','�x�F�B�n��B���ƪ��','','������','���o��','��Ĥ@�ߤG���y������','�Q�s��','�L�u�B��u'),
	('O2','�᳻�Q�s','�C�߯Q�s','�O�W�n������m','����750����','�L����','�����o��','��Ĥ@�ߤG���y�ί���','�Q�s��','�K�B��B�V�u'),
	('O3','�۪��K�[��','�w�K����','�O�W�s�_�۪���','���[�g','���H��','�����o��','��Ĥ@�ߤG���y�ί���','�Q�s��','�K�B�V�u'),
	('O4','�����s�e���Q�s','�x��12���B�����B27�J','�O�W�Ÿq�����s�س�','����1200M���s �t���[�g','������','�����o��','��Ĥ@�ߤG���y�ί���','�Q�s��','�L�u'),
	('O5','�G���Q�s','�C�߯Q�s�B�x��12��','�x�F�B�n��B���ƪ��','','���H��','�����o��','��Ĥ@�ߤG���y������','�Q�s��','�L�B��u'),
	('O6','���H�Q�s','�|�u�K�B�Z�i�B����','�O�W�n��W���m','����400m �t����[�g','���H��','�����o��','��Ĥ@�ߤG���y�ί���','�Q�s��','�K�B�V�u'),
	('O7','�[���[��','�C�߯Q�s�B�x��12��','�x�F�B�n��B���ƪ��','','���H��','�����o��','��Ĥ@�ߤG���y�ί���','�Q�s��','�L�B��u')

ALTER TABLE Knowledge
ADD image_path NVARCHAR(255);
UPDATE Knowledge SET image_path='img/1100302-14.png' WHERE id='G1';

ALTER TABLE Knowledge ADD introduce NVARCHAR(255);
ALTER TABLE Knowledge ALTER COLUMN introduce NVARCHAR(500);


update Knowledge set introduce='Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut 
labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo 
consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint
occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.' where introduce='����'

ALTER TABLE Knowledge ADD FOREIGN KEY (id) references member (collect);

update knowledge set image_path='https://im2.book.com.tw/image/getImage?i=http://www.books.com.tw/img/N00/094/16/N000941630_t_03.jpg&v=5b559eb1' where id='O4'


