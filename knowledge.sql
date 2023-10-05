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

update Knowledge set bake='輕焙火' where bake='輕培火'

insert into Knowledge values
	('G1','碧螺春綠茶','青心柑仔','臺灣新北三峽區','海拔200M丘陵','無培火','不發酵','手採一心一葉條形茶葉','綠茶','春、冬兩季'),
	('G2','阿里山高山綠茶','青心大冇','臺灣嘉義里山','海拔1500M高山 礫質壤土','無培火','不發酵','手採一心二葉球形茶葉','綠茶','夏、秋兩季'),	
	('G3','金萱綠茶','台茶12號','臺灣南投竹山桶頭','','無培火','不發酵','手採一心二葉球型茶葉','綠茶','春、冬兩季')

insert into Knowledge values
	('R1','紅玉紅茶','台茶18號','臺灣花蓮瑞穗鄉','砂質土壤紅壤土','無培火','重發酵','手採一心二葉條形茶葉','紅茶','夏季'),
	('R2','花蓮蜜香紅茶','大葉烏龍','臺灣花蓮瑞穗鄉','砂質土壤紅壤土','輕培火','重發酵','手採一心二葉條形茶葉','紅茶','夏季'),
	('R3','阿里山高山紅茶','台茶12號、金萱、27仔','臺灣嘉義阿里山隙頂','海拔1200M 礫質壤土','無培火','重發酵','手採一心二葉球形茶葉','紅茶','夏季')

insert into Knowledge values
	('O1','茉紅烏龍','青心烏龍、台茶12號','台東、南投、彰化花壇','','輕培火','重發酵','手採一心二葉球型茶葉','烏龍茶','夏季、秋季'),
	('O2','凍頂烏龍','青心烏龍','臺灣南投鹿谷鄉','海拔750公尺','無培火','部分發酵','手採一心二葉球形茶葉','烏龍茶','春、秋、冬季'),
	('O3','石門鐵觀音','硬枝紅心','臺灣新北石門區','紅壤土','重焙火','部分發酵','手採一心二葉球形茶葉','烏龍茶','春、冬季'),
	('O4','阿里山蜜香烏龍','台茶12號、金萱、27仔','臺灣嘉義阿里山隙頂','海拔1200M高山 礫質壤土','輕培火','部分發酵','手採一心二葉球形茶葉','烏龍茶','夏季'),
	('O5','果梔烏龍','青心烏龍、台茶12號','台東、南投、彰化花壇','','輕焙火','部分發酵','手採一心二葉球型茶葉','烏龍茶','夏、秋季'),
	('O6','炭焙烏龍','四季春、武夷、金萱','臺灣南投名間鄉','海拔400m 礫質黃壤土','重焙火','部分發酵','手採一心二葉球形茶葉','烏龍茶','春、冬季'),
	('O7','茉莉觀音','青心烏龍、台茶12號','台東、南投、彰化花壇','','輕焙火','部分發酵','手採一心二葉球形茶葉','烏龍茶','夏、秋季')

ALTER TABLE Knowledge
ADD image_path NVARCHAR(255);
UPDATE Knowledge SET image_path='img/1100302-14.png' WHERE id='G1';

ALTER TABLE Knowledge ADD introduce NVARCHAR(255);
ALTER TABLE Knowledge ALTER COLUMN introduce NVARCHAR(500);


update Knowledge set introduce='Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut 
labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo 
consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint
occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.' where introduce='介紹'

ALTER TABLE Knowledge ADD FOREIGN KEY (id) references member (collect);

update knowledge set image_path='https://im2.book.com.tw/image/getImage?i=http://www.books.com.tw/img/N00/094/16/N000941630_t_03.jpg&v=5b559eb1' where id='O4'


