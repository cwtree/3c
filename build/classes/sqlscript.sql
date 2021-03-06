DROP SEQUENCE ALL_SEQ;
CREATE SEQUENCE ALL_SEQ MINVALUE 1 MAXVALUE 99999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 ORDER NOCYCLE ;
  DROP TABLE USERINFO;
  CREATE TABLE USERINFO
    (
      USERID     VARCHAR2(50) PRIMARY KEY,
      USERNAME   VARCHAR2(50) NOT NULL,
      PASSWORD   VARCHAR2(50) NOT NULL,
      CREATEDATE VARCHAR2(50) NOT NULL
    );
  INSERT
  INTO USERINFO VALUES
    (
      ALL_SEQ.NEXTVAL,
      'admin',
      'admin321',
      TO_CHAR(SYSDATE,'yyyy-mm-dd HH24:MI:SS')
    );
  DROP TABLE GOODS;
  CREATE TABLE GOODS
    (
      GOODSID     VARCHAR2(50) PRIMARY KEY,
      GOODSNAME   VARCHAR2(50) NOT NULL,
      GOODSKIND   VARCHAR2(50) NOT NULL,
      GOODSCB     NUMBER NOT NULL,
      GOODSNUMBER NUMBER NOT NULL
    );
  
  DROP TABLE GOODSKIND;
  CREATE TABLE GOODSKIND
    (
      KINDSID VARCHAR2(50) PRIMARY KEY,
      KIND    VARCHAR2(50)
    );
  DROP TABLE DEALGOODS;
  CREATE TABLE DEALGOODS
    (
      DGID       VARCHAR2(50) PRIMARY KEY,
      GOODSID    VARCHAR2(50) NOT NULL,
      GOODSPRICE NUMBER NOT NULL,
      DEALNUMBER NUMBER NOT NULL,
      DEALDATE   VARCHAR2(50)
    );
