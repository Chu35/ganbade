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
	('G1','碧螺春綠茶','青心柑仔','臺灣新北三峽區','海拔200M丘陵','無培火','不發酵','手採一心一葉條形茶葉','綠茶','春、冬兩季'),
	('G2','阿里山高山綠茶','青心大冇','臺灣嘉義里山','海拔1500M高山 礫質壤土','無培火','不發酵','手採一心二葉球形茶葉','綠茶','夏、秋兩季'),	
	('G3','金萱綠茶','台茶12號','臺灣南投竹山桶頭','','無培火','不發酵','手採一心二葉球型茶葉','綠茶','春、冬兩季')

insert into Knowledge values
	('R1','紅玉紅茶','台茶18號','臺灣花蓮瑞穗鄉','砂質土壤紅壤土','無培火','重發酵','手採一心二葉條形茶葉','紅茶','夏季'),
	('R2','花蓮蜜香紅茶','大葉烏龍','臺灣花蓮瑞穗鄉','砂質土壤紅壤土','輕培火','重發酵','手採一心二葉條形茶葉','紅茶','夏季'),
	('R3','阿里山高山紅茶','台茶12號、金萱、27仔','臺灣嘉義阿里山隙頂','海拔1200M 礫質壤土','無培火','重發酵','手採一心二葉球形茶葉','紅茶','夏季')

ALTER TABLE Knowledge
ADD image_path NVARCHAR(255);
UPDATE Knowledge SET altitude='海拔1600公尺' WHERE id='o7';


ALTER TABLE Knowledge ADD introduce NVARCHAR(255);
ALTER TABLE Knowledge ALTER COLUMN introduce NVARCHAR(500);

ALTER TABLE Knowledge ADD FOREIGN KEY (id) references member (collect);

UPDATE Knowledge SET image_path='img/b2.png' WHERE id='b2';
UPDATE Knowledge SET id='B1' WHERE id=' B1'

select * from knowledge

UPDATE Knowledge SET bake='無焙火' , ferment='重發酵'
WHERE id='o8';

UPDATE Knowledge SET season='夏季'
WHERE id='o3';

