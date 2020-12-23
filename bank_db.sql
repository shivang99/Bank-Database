#	SOURCE C:/Users/17204/Desktop/bank_db.sql;
DROP DATABASE IF EXISTS bank_db;
CREATE DATABASE IF NOT EXISTS bank_db;
USE bank_db;

DROP TABLE IF EXISTS bank_tb;
CREATE TABLE IF NOT EXISTS bank_tb(
branch_id INT(5) AUTO_INCREMENT,
branch_city VARCHAR(15),
atm_avail BOOLEAN NOT NULL,
CONSTRAINT pk_branch_id PRIMARY KEY(branch_id)
);


DROP TABLE IF EXISTS account_tb;
CREATE TABLE IF NOT EXISTS account_tb(
account_id INT(7) AUTO_INCREMENT,
bank_id INT(5) NOT NULL,
account_type ENUM('Savings','Chequings'),
account_balance INT(11) DEFAULT 0,
CONSTRAINT pk_acc_id PRIMARY KEY(account_id),
CONSTRAINT fk_bank_id_account FOREIGN KEY(bank_id) REFERENCES bank_tb(branch_id)
)AUTO_INCREMENT=2587495;


DROP TABLE IF EXISTS customer_tb;
CREATE TABLE IF NOT EXISTS customer_tb(
cust_id INT(11) AUTO_INCREMENT,
account_id INT(7) NOT NULL,
cust_name CHAR(35) NOT NULL,
credit_score INT(11),
cust_address JSON NOT NULL,
cust_email VARCHAR(35),
cust_contact BIGINT(11) NOT NULL,
CONSTRAINT pk_custid PRIMARY KEY(cust_id),
CONSTRAINT fk_accnt_id FOREIGN KEY(account_id) REFERENCES account_tb(account_id)
);


DROP TABLE IF EXISTS banker_tb;
CREATE TABLE IF NOT EXISTS banker_tb(
banker_id INT(3) AUTO_INCREMENT,
cust_id INT(11) NOT NULL,
bank_id INT(5) NOT NULL,
banker_name CHAR(15) NOT NULL,
banker_email VARCHAR(35),
CONSTRAINT pk_banker_id PRIMARY KEY(banker_id),
CONSTRAINT fk_bank_id_banker FOREIGN KEY(bank_id) REFERENCES bank_tb(branch_id),
CONSTRAINT fk_cust_id_banker FOREIGN KEY(cust_id) REFERENCES customer_tb(cust_id)
)AUTO_INCREMENT=100;


DROP TABLE IF EXISTS credit_card;
CREATE TABLE IF NOT EXISTS credit_card(
cc_number BIGINT(16) AUTO_INCREMENT, 
customer_id INT(11) NOT NULL,
cc_limit INT(4) NOT NULL,
security_code INT(3),
expiry_date VARCHAR(5) DEFAULT "05/23",
CONSTRAINT pk_cc_num PRIMARY KEY(cc_number),
CONSTRAINT fk_cc_cus_id FOREIGN KEY(customer_id) REFERENCES customer_tb(cust_id)
)AUTO_INCREMENT=4147896521450258;


DROP TABLE IF EXISTS loan_tb;
CREATE TABLE IF NOT EXISTS loan_tb(
loan_id INT(4) AUTO_INCREMENT,
customer_id INT(11) NOT NULL,
monthly_payment DECIMAL(10,2) NOT NULL, 
interest_rate DECIMAL(10,2) NOT NULL,
yearly_gross_profit DECIMAL(10,2) GENERATED ALWAYS AS(12*(monthly_payment*interest_rate/100)) STORED, 
CONSTRAINT pk_loan_loan_id PRIMARY KEY(loan_id),
CONSTRAINT fk_loan_cus_id FOREIGN KEY(customer_id) REFERENCES customer_tb(cust_id)
)AUTO_INCREMENT=1000;


#[1]
INSERT INTO bank_tb(branch_city,atm_avail) VALUES('Troy',True);
INSERT INTO account_tb(bank_id,account_type,account_balance) VALUES(1,'Savings',17823);
INSERT INTO customer_tb(account_id,cust_name,credit_score,cust_address,cust_email,cust_contact) VALUES(2587495,'John King',790,'{"Street":"1234, Brook Dr","City":"Troy","State":"MI","Zip":48089}',"john121@gmail.com", 2482501234);
INSERT INTO banker_tb(cust_id,bank_id,banker_name,banker_email) VALUES(1,1,'Paul Toledo',"paultol@gmail.com");
INSERT INTO credit_card(customer_id,cc_limit,security_code) VALUES(1,2000,763);
INSERT INTO loan_tb(customer_id,monthly_payment,interest_rate) VALUES(1,170,3.2);

#[2]
INSERT INTO bank_tb(branch_city, atm_avail) VALUES('Detroit', False);
INSERT INTO account_tb(bank_id,account_type,account_balance) VALUES(2,'Chequings', 5562);
INSERT INTO customer_tb(account_id,cust_name,credit_score,cust_address,cust_email,cust_contact) VALUES(2587496,'Julie Nice',470,'{"Street":"463, Bonnie Ln","City":"Detroit","State":"MI","Zip":48128}',"julnic101@yahoo.com", 3133445632);
INSERT INTO banker_tb(cust_id,bank_id,banker_name,banker_email) VALUES(2,2,'John Williams',"jwill1009@outlook.com");
INSERT INTO credit_card(customer_id,cc_limit,security_code) VALUES(2,5000,345);
INSERT INTO loan_tb(customer_id,monthly_payment,interest_rate) VALUES(2,145,2.5);

#[3]
INSERT INTO bank_tb(branch_city, atm_avail) VALUES('Dearborn', True);
INSERT INTO account_tb(bank_id,account_type,account_balance) VALUES(3,'Savings', 14567);
INSERT INTO customer_tb(account_id,cust_name,credit_score,cust_address,cust_email,cust_contact) VALUES(2587497,'Manish Patel', 560,'{"Street":"789, Ford Road","City":"Dearborn","State":"MI","Zip":48126}',"mannipa119@hotmail.com", 3135436756);
INSERT INTO banker_tb(cust_id,bank_id,banker_name,banker_email) VALUES(3,3,'Logan Lee',"loglee@gmail.com");
INSERT INTO credit_card(customer_id,cc_limit,security_code) VALUES(3,2500,129);

#[4]
INSERT INTO bank_tb(branch_city, atm_avail) VALUES('Rochester Hills', True);
INSERT INTO account_tb(bank_id,account_type,account_balance) VALUES(4,'Chequings', 150950);
INSERT INTO customer_tb(account_id,cust_name,credit_score,cust_address,cust_email,cust_contact) VALUES(2587498,'Jessica Paul', 670,'{"Street":"1239, Rochester Road","City":"Rochester Hills","State":"MI","Zip":48306}',"jesspaul007@outlook.com", 2487653214);
INSERT INTO banker_tb(cust_id,bank_id,banker_name,banker_email) VALUES(4,4,'Lucy Johnson',"johnsonlucy11@yahoo.com");
INSERT INTO loan_tb(customer_id,monthly_payment,interest_rate) VALUES(4,163.4,3.2);

#[5]
INSERT INTO account_tb(bank_id,account_type,account_balance) VALUES(2,'Chequings', 112098);
INSERT INTO customer_tb(account_id,cust_name,credit_score,cust_address,cust_email,cust_contact) VALUES(2587499,'Nick Snow',720,'{"Street":"544,John Circle","City":"Detroit","State":"MI","Zip":48129}',"nicsno1289@yahoo.com", 3133441290);
INSERT INTO banker_tb(cust_id,bank_id,banker_name,banker_email) VALUES(5,2,'Jay Stafford',"jstaff0909@gmail.com");

#[6]
INSERT INTO account_tb(bank_id,account_type,account_balance) VALUES(1,'Savings', 402098);
INSERT INTO customer_tb(account_id,cust_name,credit_score,cust_address,cust_email,cust_contact) VALUES(2587500,'Joel Groove',750,'{"Street":"112, Bear Dr","City":"Troy","State":"MI","Zip":48093}',"jgroove500@gmail.com", 2482534562);
INSERT INTO banker_tb(cust_id,bank_id,banker_name,banker_email) VALUES(6,1,'Ashley Ford',"ashford001@outlook.com");
INSERT INTO credit_card(customer_id,cc_limit,security_code) VALUES(6,10000,912);

#[7]
INSERT INTO account_tb(bank_id,account_type,account_balance) VALUES(3,'Chequings', 195000);
INSERT INTO customer_tb(account_id,cust_name,credit_score,cust_address,cust_email,cust_contact) VALUES(2587501,'Jill Borden',320,'{"Street":"544, Marwa Lane","City":"Dearborn","State":"MI","Zip":48121}',"marla89@outlook.com", 3132219032);
INSERT INTO banker_tb(cust_id,bank_id,banker_name,banker_email) VALUES(7,3,'Mary Williams',"marwill19@gmail.com");
INSERT INTO loan_tb(customer_id,monthly_payment,interest_rate) VALUES(7,122,3.2);

#[8]
INSERT INTO account_tb(bank_id,account_type,account_balance) VALUES(4,'Chequings', 65008);
INSERT INTO customer_tb(account_id,cust_name,credit_score,cust_address,cust_email,cust_contact) VALUES(2587502,'Steve Kerr', 610,'{"Street":"119, Gatlin Lane","City":"Port Huron","State":"MI","Zip":48060}',"skerr1002@hotmail.com", 8109211009);
INSERT INTO credit_card(customer_id,cc_limit,security_code) VALUES(8,5000,542);

#[9]
INSERT INTO account_tb(bank_id,account_type,account_balance) VALUES(2,NULL, NULL);
INSERT INTO customer_tb(account_id,cust_name,credit_score,cust_address,cust_email,cust_contact) VALUES(2587503,'Joe Billy',700,'{"Street":"121, Jordy Dr","City":"Detroit","State":"MI","Zip":48126}',"marla89@outlook.com", 3132215632);
INSERT INTO banker_tb(cust_id,bank_id,banker_name,banker_email) VALUES(9,3,'Macy Trillium',"matrill1109@outlook.com");
INSERT INTO loan_tb(customer_id,monthly_payment,interest_rate) VALUES(9,231,1.9);

#[10]
INSERT INTO account_tb(bank_id,account_type,account_balance) VALUES(4,'Chequings', 4523);
INSERT INTO customer_tb(account_id,cust_name,credit_score,cust_address,cust_email,cust_contact) VALUES(2587504,'Aamir Khan',800,'{"Street":"42, Jalen Court","City":"Rochester Hills","State":"MI","Zip":48099}',"onlykhan4289@gmail.com", 2485122012);




DESC bank_tb;
DESC account_tb;
DESC customer_tb;
DESC banker_tb;
DESC credit_card;
DESC loan_tb;


#1 Bank customer's ID, Name and Zip code with high credit scores/No credit cards. 

SELECT cust_id,cust_name,JSON_EXTRACT(cust_address,'$.Zip') AS 'Customes with no credit card' 
FROM customer_tb
WHERE credit_score>=700 AND cust_id NOT IN
(
SELECT customer_id 
FROM credit_card 
);

#2 Bank ID of Bank with the most credit card customers

SELECT CONCAT('Bank: ',bank_id,' has the maximum number of credit card customers, with ', COUNT(bank_id), ' customers') AS 'Banks with most credit card customers'
FROM banker_tb
WHERE cust_id IN
(
SELECT customer_id 
FROM credit_card  
)GROUP BY bank_id
LIMIT 1
; 

#3 ID, Name, Phone Number and Email of Bank customers with high bank balance of 100k without a credit card.

SELECT at.account_id, ct.cust_name,ct.cust_contact,ct.cust_email FROM customer_tb ct
LEFT JOIN credit_card cc ON cc.customer_id=ct.cust_id
JOIN account_tb at ON ct.account_id=at.account_id
WHERE cc.customer_id IS NULL
AND at.account_balance >= 100000
;

#4 Customer's ID, Phone number  with credit cards but without the account type.

SELECT at.account_id, ct.cust_contact AS 'Phone Number', ct.cust_name  
FROM account_tb at 
JOIN customer_tb ct ON ct.account_id=at.account_id
RIGHT JOIN loan_tb lt ON lt.customer_id=ct.cust_id
WHERE at.account_type IS NULL;                            



#5 Customer's Name, Email, Acccount ID, Account Balance, Credit card limit with high credit card limit equal or higher than 5k, with a bank balance of 50k or less. 

SELECT ct.cust_name, ct.cust_email, at.account_id,at.account_balance, cc.cc_limit FROM customer_tb ct
JOIN credit_card cc ON cc.customer_id=ct.cust_id
JOIN account_tb at ON ct.account_id=at.account_id
WHERE cc.cc_limit >= 5000 AND at.account_balance <= 50000;

# 6 Customer's name, email, credit score and interest rate with high interest rate (3.0) and high credit score (700k or more).

SELECT ct.cust_name, ct.cust_email, ct.credit_score, lt.interest_rate FROM customer_tb ct
JOIN loan_tb lt ON lt.customer_id=ct.cust_id
WHERE ct.credit_score>= 700 AND lt.interest_rate>=3.0;

#7 	Customers ID, Name, Email who don’t have a loan and have no credit card

SELECT ct.cust_id, ct.cust_name,ct.cust_email FROM customer_tb ct 
LEFT JOIN credit_card cc ON ct.cust_id=cc.customer_id
LEFT JOIN loan_tb lt ON ct.cust_id=lt.customer_id
WHERE lt.customer_id IS NULL AND cc.customer_id IS NULL;

#8	 Banker name, id and email of the loan number 1002

SELECT banker_name, banker_id, banker_email FROM banker_tb
WHERE cust_id IN
(
	SELECT customer_id 
	FROM loan_tb
	WHERE loan_id = 1001
);

#9 	Number of customers who bank in Troy and have a balance under 50k

SELECT count(cust_name) AS 'Num of customers', cust_name, cust_email FROM customer_tb
WHERE account_id IN 
(
	SELECT account_id FROM account_tb
	WHERE account_balance <= 50000 AND bank_id IN 
	(
		SELECT branch_id FROM bank_tb
		WHERE branch_city = "Troy"
	)
);

#10	Name, Phone number and email of customers who bank at a branch without an ATM with a high bank balance of 100k or more
SELECT cust_name, cust_contact, cust_email FROM customer_tb
WHERE account_id IN 
(
	SELECT account_id FROM account_tb
	WHERE account_balance <= 100000 AND bank_id IN 
	(
		SELECT branch_id FROM bank_tb
		WHERE atm_avail = "False"
	)
);