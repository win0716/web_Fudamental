create table noticce(
n_nem int primary key auto_increment,
n_writer varchar(100) not null,
n_title varchar(200) not null,
n_content varchar(16384) not null,
n_regdate datetime not null

);


CREATE TABLE member(
m_seq INT PRIMARY KEY AUTO_INCREMENT,
m_id VARCHAR(20) NOT null,
m_email VARCHAR(100) NOT null,
m_name VARCHAR(20) NOT NULL,
m_pwd CHAR(41) NOT null,
m_phone VARCHAR(15) NOT NULL,
m_regdate DATETIME NOT null
);
