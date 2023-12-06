select * from member

create table member
(id varchar(10),
gender varchar(20),
name varchar(10) not null,
pwd varchar(20) not null,
primary key(name),
)

ALTER TABLE member_collect
ADD CONSTRAINT fk_member_name
FOREIGN KEY (member_name) REFERENCES member(name)
ON DELETE CASCADE;

ALTER TABLE cart
ADD CONSTRAINT FK_cart_member_name
FOREIGN KEY (member_name) REFERENCES member(name)
ON DELETE CASCADE;




delete from  member where id=''


CREATE TABLE member_collect (
    member_name varchar(10),
    knowledge_id varchar(10),
    PRIMARY KEY (member_name, knowledge_id),
    FOREIGN KEY (member_name) REFERENCES member(name),
    FOREIGN KEY (knowledge_id) REFERENCES Knowledge(id)
);



CREATE TABLE store (
    id int not null,  -- 将id列设为主键
    name nvarchar(50) not null,
    imgpath nvarchar(255) not null,
    price varchar(20),
    list varchar(20),
);
drop table cart
select * from admin
insert into admin values ('chu','0725')
ALTER TABLE sugardaddy ALTER COLUMN href NVARCHAR(200);
DELETE FROM admin where username='chu'

select * from sugardaddy ORDER BY id 
UPDATE sugardaddy SET href='https://everprinter.com/' WHERE id='s14';

insert into store values
('1','hat','https://cdn.shopify.com/s/files/1/0562/4971/2815/files/tnt_new_era_ss23_1.jpg','900','熱賣商品'),
('2','shirt','https://thisisneverthat.com/cdn/shop/products/Drum-Kit-Tee-White1_300x300.jpg?v=1650439095','1200','本季新品'),
('3','hoodie','https://thisisneverthat.com/cdn/shop/products/Arch-Logo-Hoodie-Stone1_300x300.jpg?v=1693385307','1700','聯名系列'),
('4','AirPods Pro Case','https://thisisneverthat.com/cdn/shop/products/OL-Logo-AirPods-Pro-Case-Clear1_1080x.jpg?v=1647418937','15000','null'),
('5','Jacket','https://thisisneverthat.com/cdn/shop/products/PERTEX_-T-Down-Jacket-Black1_75e62156-3c4e-4c8f-b0de-21885a179420_1080x.jpg?v=1695790809','219000','本季新品')

SELECT name AS TableName, CONVERT(VARCHAR, modify_date, 120) AS LastUpdateTime FROM sys.tables WHERE name = 'knowledge';

SELECT name AS TableName, modify_date AS LastUpdateTime FROM sys.tables WHERE name = 'member'

SELECT create_date, modify_date FROM sys.tables WHERE name = 'member';


select * from member_collect
SELECT COUNT(*) as name_count FROM member_collect where member_name='00'

DELETE FROM member_collect where member_name='00'

SELECT fun.id, fun.name, fun.imagePath FROM member_collect INNER JOIN fun ON member_collect.fun_id = fun.id WHERE member_name = 00

SELECT member_name,fun_id FROM member_collect where member_name='00' 

SELECT mc.member_name, mc.fun_id, f.name
FROM member_collect mc, fun f
WHERE mc.member_name = '00' AND mc.fun_id = f.id;

UPDATE member_collect SET mc.member_name, mc.fun_id, f.name
WHERE mc.member_name = '?' AND mc.fun_id = f.id;


DELETE FROM store where id = '4'

CREATE TABLE member_collect (
    member_name varchar(10),
    knowledge_id varchar(10),
	fun_id varchar(10),
	store_name nvarchar(50),
);

select *from member_collect
select * from store

ALTER TABLE cart
ADD CONSTRAINT FK_cart_store
FOREIGN KEY (id) REFERENCES store(id);


CREATE TABLE cart (
    store_id int,
    member_name varchar(10),
    quantity INT NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    total_price DECIMAL(10,2),  -- New column for total price
    FOREIGN KEY (store_id) REFERENCES store(id),
    FOREIGN KEY (member_name) REFERENCES member(name)
);
drop table cart
select * from member
select * from cart

SELECT SUM(quantity)
FROM cart
WHERE member_name = '00'

SELECT quantity FROM cart WHERE member_name= '00'
SELECT SUM(quantity) as tatolquantity FROM cart WHERE member_name = '00'

ALTER TABLE member
ALTER COLUMN phone NVARCHAR(15);

UPDATE member SET fullname = '00' WHERE id = '00';
select * from member
SELECT  fullname,phone, cart.member_name
FROM member
INNER JOIN cart ON member.name = cart.member_name
WHERE cart.member_name = '00';
UPDATE member
SET fullname = '000', phone='69079'
WHERE name IN (SELECT member.name
               FROM member
               INNER JOIN cart ON member.name = cart.member_name
               WHERE cart.member_name = '00');
select * from store
select * from sugardaddy
select * from Knowledge
