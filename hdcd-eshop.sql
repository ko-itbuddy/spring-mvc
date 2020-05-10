 CREATE TABLE code_class (
	class_code CHAR(3) NOT NULL,
    class_name VARCHAR(30) NOT NULL,
    use_yn CHAR(1) NOT NULL DEFAULT 'Y',
    reg_date TIMESTAMP NOT NULL DEFAULT now(),
    upd_date TIMESTAMP DEFAULT now(),
    PRIMARY KEY (class_code)
);



CREATE TABLE code_detail (
	class_code CHAR(3) NOT NULL,
	code_value VARCHAR(3) NOT NULL,
    code_name VARCHAR(30) NOT NULL,
    sort_seq INT NOT NULL,
    use_yn CHAR(1) NOT NULL DEFAULT 'Y',
    reg_date TIMESTAMP NOT NULL DEFAULT now(),
    upd_date TIMESTAMP DEFAULT now(),
    PRIMARY KEY (class_code, code_value)
);

 
CREATE TABLE member(
		user_no INT(5) AUTO_INCREMENT,
      user_id VARCHAR(50) NOT NULL,
      user_pw VARCHAR(100) NOT NULL,
      user_name VARCHAR(100) NOT NULL,
      job VARCHAR(3) NOT NULL DEFAULT '00',
      coin INT(10) DEFAULT 0,
      reg_date TIMESTAMP DEFAULT now(),
      upd_date TIMESTAMP DEFAULT now(),
      enabled CHAR(1) DEFAULT '1',
      PRIMARY KEY (user_no)
);


CREATE TABLE member_auth (
     user_no INT(5) NOT NULL,
     auth VARCHAR(50) NOT NULL
);


ALTER TABLE member_auth ADD CONSTRAINT fk_member_auth_user_no
FOREIGN KEY (user_no) REFERENCES member(user_no);



CREATE TABLE persistent_logins (
     username VARCHAR(64) NOT NULL,
     series VARCHAR(64) NOT NULL,
     token VARCHAR(64) NOT NULL,
     last_used TIMESTAMP NOT NULL,
     PRIMARY KEY (series)
);

 CREATE TABLE board (
	board_no INT NOT NULL AUTO_INCREMENT,
    title VARCHAR(200) NOT NULL,
    content TEXT,
    writer VARCHAR(50) NOT NULL,
    reg_date TIMESTAMP NOT NULL DEFAULT now(),
    PRIMARY KEY (board_no)
);

 
CREATE TABLE notice (
	notice_no INT NOT NULL AUTO_INCREMENT,
    title VARCHAR(200) NOT NULL,
    content TEXT,
    reg_date TIMESTAMP NOT NULL DEFAULT now(),
    PRIMARY KEY (notice_no)
);

CREATE TABLE item(
	item_id INT(5) AUTO_INCREMENT,
	item_name VARCHAR(20),
	price INT(6),
	description VARCHAR(50),
	picture_url VARCHAR(200),
	PRIMARY KEY (item_id)
);

 

CREATE TABLE user_item (
	user_item_no INT AUTO_INCREMENT,
	user_no INT(5) NOT NULL,
	item_id INT(5) NOT NULL,
	reg_date TIMESTAMP DEFAULT now(),
	PRIMARY KEY (user_item_no)
);

 CREATE TABLE pds(
	item_id INT(5) AUTO_INCREMENT,
	item_name VARCHAR(20),
	view_cnt INT(6) DEFAULT 0,
	description VARCHAR(50),
	PRIMARY KEY (item_id)
);

CREATE TABLE pds_attach (
	fullName VARCHAR(150) NOT NULL,
    item_id INT(5) NOT NULL,
    down_cnt INT(6) DEFAULT 0,
    regdate TIMESTAMP DEFAULT now(),
    PRIMARY KEY(fullName)
);

 
CREATE TABLE charge_coin_history (
	history_no INT AUTO_INCREMENT,
	user_no INT(5) NOT NULL,
	amount INT(5) NOT NULL,
	reg_date TIMESTAMP DEFAULT now(),
	PRIMARY KEY (history_no)
);

CREATE TABLE pay_coin_history (
	history_no INT AUTO_INCREMENT,
	user_no INT(5) NOT NULL,
    item_id INT(5) NOT NULL,
	amount INT(5) NOT NULL,
	reg_date TIMESTAMP DEFAULT now(),
	PRIMARY KEY (history_no)
);

 
 CREATE TABLE login_log (
	log_no INT NOT NULL AUTO_INCREMENT,
    user_no INT(5) NOT NULL,
    user_id VARCHAR(50) NOT NULL,
    remote_addr VARCHAR(50) NOT NULL,
    reg_date TIMESTAMP NOT NULL DEFAULT now(),
    PRIMARY KEY (log_no)
);

CREATE TABLE access_log (
	log_no INT NOT NULL AUTO_INCREMENT,
    request_uri VARCHAR(200) NOT NULL,
    class_name VARCHAR(100) NOT NULL,
    class_simple_name VARCHAR(50) NOT NULL,
    method_name VARCHAR(100) NOT NULL,
	 remote_addr VARCHAR(50) NOT NULL,
    reg_date TIMESTAMP NOT NULL DEFAULT now(),
    PRIMARY KEY (log_no)
);

 
 CREATE TABLE performance_log (
 	log_no INT NOT NULL AUTO_INCREMENT,
    signature_name VARCHAR(50) NOT NULL,
    signature_type_name VARCHAR(100) NOT NULL,
    duration_time INT DEFAULT 0,
    reg_date TIMESTAMP NOT NULL DEFAULT now(),
    PRIMARY KEY (log_no)
);