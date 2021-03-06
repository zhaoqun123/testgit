CREATE DATABASE lunwen;
CREATE TABLE Link (
	l_id int primary key auto_increment,
	l_url varchar(500)  NULL ,
	l_name varchar(50)  NULL ,
	l_img varchar(500)  NULL ,
	l_info varchar(1000)  NULL ,
	l_isLock Bool NULL ,
	l_addtime date NULL 
)  DEFAULT CHARACTER SET UTF8
CREATE TABLE admins (
	a_id int primary key auto_increment,
	a_user varchar(50)  NULL ,
	a_pass varchar(50)  NULL ,
	a_name varchar(50)  NULL ,
	a_isLock Bool NULL ,
	a_lastLogTime date NULL ,
	a_logTimes int NULL ,
	a_loginIp varchar(50)  NULL ,
	a_addtime date NULL ,
	a_email varchar(100)  NULL ,
	a_info varchar(1000)  NULL 
) DEFAULT CHARACTER SET UTF8





CREATE TABLE answersheet (
	as_id int primary key auto_increment ,
	s_id int NOT NULL ,
	as_result varchar(8000)  NULL ,
	as_postdate date NULL ,
	as_userIP varchar(50)  NULL 
) DEFAULT CHARACTER SET UTF8

CREATE TABLE config (
	id int primary key auto_increment,
	c_siteName varchar(500) null,
	c_siteURL varchar(500)  NULL ,
	c_isOpen BOOL NULL ,
	c_closeWord varchar(1000)  NULL ,
	copyright varchar(500)  NULL 
) DEFAULT CHARACTER SET UTF8

CREATE TABLE guestbook (
	gb_id  int primary key auto_increment,
	gb_user varchar(50)  NULL ,
	gb_content varchar(5000)  NULL ,
	gb_phone varchar(20)  NULL ,
	gb_qq varchar(20)  NULL ,
	gb_email varchar(100)  NULL ,
	gb_postdate date NULL 
) DEFAULT CHARACTER SET UTF8

CREATE TABLE question (
	q_id int primary key auto_increment ,
	s_id int NOT NULL ,
	q_type int NULL ,
	q_head varchar(1000)  NULL ,
	q_body varchar(8000)  NULL ,
	q_result varchar(1000)  NULL ,
	q_img varchar(1000)  NULL ,
	q_jdtz varchar(1000)  NULL ,
	q_order int NULL 
) DEFAULT CHARACTER SET UTF8

CREATE TABLE survey (
	s_id  int primary key auto_increment ,
	templet_id int NOT NULL ,
	s_name varchar(100)  NULL ,
	s_desc varchar(500)  NULL ,
	s_author varchar(100)  NULL ,
	s_img varchar(1000)  NULL ,
	s_ipRepeat BOOL NULL ,
	s_createDate date NULL ,
	s_ipLimitType varchar(10)  NULL ,
	s_ipRange varchar(2000)  NULL ,
	s_password varchar(100)  NULL ,
	s_isOpen BOOL NULL ,
	s_expireDate date NULL ,
	s_isAudited BOOL NULL ,
	s_hits int NULL ,
	s_usehits int NULL 
) DEFAULT CHARACTER SET UTF8


CREATE TABLE templet (
	templet_id  INT PRIMARY KEY AUTO_INCREMENT ,
	templet_name VARCHAR(100)  NULL ,
	templet_top TEXT(8000)  NULL ,
	templet_body TEXT(8000)  NULL ,
	templet_bottom TEXT(8000)  NULL ,
	templet_default BOOL 
) DEFAULT CHARACTER SET UTF8


CREATE TABLE TEXT (
	t_id   INT PRIMARY KEY AUTO_INCREMENT  ,
	q_id INT NOT NULL ,
	t_content TEXT(8000)  NULL 
) DEFAULT CHARACTER SET UTF8

INSERT INTO admins(a_user,a_pass) VALUES('zhaoqun','123');


INSERT INTO admins(a_user,a_pass) VALUES('zhaoqun','123');
INSERT INTO answersheet(s_id,as_result,as_postdate,as_userIP
) VALUES
(17,	'18:text=啥地方是&@@&19:as=1,2;&@@&20:as=1;&@@&28:as=1;&@@&29:as=0;&@@&31:as=0;&@@&40:text=啥地方&@@&41:text=但是&@@&42:as=1;',	'2009/1/16',	'127.0.0.1'
);
INSERT INTO answersheet(s_id,as_result,as_postdate,as_userIP
) VALUES
(17,	'18:text=ffff&@@&19:as=0,2;&@@&20:as=1;&@@&28:as=2;&@@&29:as=3;&@@&31:as=1;&@@&40:text=sdf&@@&41:text=sdfdsf&@@&42:as=2;',	'2009/3/28',	'127.0.0.1'
);

INSERT INTO config (c_siteName,c_siteURL,c_isOpen,c_closeWord,copyright)
VALUES('电商问卷调查系统','http://www.ec-swufe.net',TRUE,'213213','Copyright&copy;2009');

