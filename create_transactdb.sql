--create user by system
--CREATE USER transact
--IDENTIFIED BY oracle
--DEFAULT TABLESPACE USERS
--TEMPORARY TABLESPACE TEMP
--PROFILE DEFAULT;
--privileges to transact user by system
--GRANT CREATE SESSION to transact;
--GRANT CREATE TABLE to transact;
--GRANT CREATE SEQUENCE to transact;
--GRANT CREATE ANY INDEX to transact;
--GRANT ANALYZE ANY to transact;
--GRANT UNLIMITED TABLESPACE to transact;
CREATE TABLE account
  (
    account_id  NUMBER (3) NOT NULL ,
    first_name  VARCHAR2 (100) NOT NULL ,
    second_name VARCHAR2 (100) NOT NULL ,
    country     VARCHAR2 (100) NOT NULL
  ) ;
ALTER TABLE account ADD CONSTRAINT account_PK PRIMARY KEY ( account_id ) ;


CREATE TABLE credit_card
  (
    creditcard_id NUMBER (5) NOT NULL ,
    account_id    NUMBER (3) NOT NULL ,
    cash_amount   NUMBER (8,2) NOT NULL
  ) ;
ALTER TABLE credit_card ADD CONSTRAINT credit_card_PK PRIMARY KEY ( creditcard_id ) ;


CREATE TABLE transaction
  (
    transaction_id     NUMBER (5) NOT NULL ,
    from_creditcard_id NUMBER (5) NOT NULL ,
    to_creditcard_id   NUMBER (5) NOT NULL ,
    amount             NUMBER (8,2) NOT NULL
  ) ;
ALTER TABLE transaction ADD CONSTRAINT transaction_PK PRIMARY KEY ( transaction_id ) ;


ALTER TABLE credit_card ADD CONSTRAINT account_FK FOREIGN KEY ( account_id ) REFERENCES account ( account_id ) ;

ALTER TABLE transaction ADD CONSTRAINT from_credit_card_FK FOREIGN KEY ( from_creditcard_id ) REFERENCES credit_card ( creditcard_id ) ;

ALTER TABLE transaction ADD CONSTRAINT to_credit_card_FK FOREIGN KEY ( to_creditcard_id ) REFERENCES credit_card ( creditcard_id ) ;
