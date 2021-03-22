CREATE DATABASE purchase;
use purchase;

CREATE TABLE user (
	user_ID int PRIMARY KEY auto_increment,
    nama varchar(50),
    alamat varchar(100),
    kode_pos varchar(10)
);

INSERT INTO user (nama , alamat , kode_pos) VALUES
('Takami' , 'Shinjuku' , '29444') ,
('Kurosawa' , 'Kyoto' , '29348'), 
('Watanabe' , 'Shizuoka' , '29552') ,
('Ohara' , 'Kanagawa' , '29974'), 
('Matsura' , 'Sendai' , '29510');

CREATE TABLE product (
	product_ID int PRIMARY KEY auto_increment,
    nama_produk varchar(50),
    deskripsi mediumtext,
    harga int
);

INSERT INTO product (nama , deskripsi , harga) VALUES
('Ibanez' , 'A thousand-pleasure guitar' , 20000),
('Arius' , 'Make your days cherish' , 25000),
('Fender' , 'From pro to weaboo' , 40000),
('Marshall' , 'This is expensive' , 50000),
('Rolland' , 'Keep on the beat' , 70000);

CREATE TABLE orderItem (
	id_order int PRIMARY KEY auto_increment,
    user_ID int,
    product_ID int,
    tanggal date,
    total_harga int
);

INSERT INTO orderItem (user_ID , product_ID , tanggal , total_harga) VALUES
(1 , 1 , '2021-03-22' , 20000 ),
(2 , 2 , '2021-03-22' , 25000 ),
(3 , 3 , '2021-03-22' , 40000 ),
(4 , 4 , '2021-03-22' , 50000 ),
(5 , 5 , '2021-03-22' , 70000 );