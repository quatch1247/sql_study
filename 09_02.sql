--------------------------------------------------------
--  파일이 생성됨 - 금요일-9월-02-2022   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table EMP_KOR_1
--------------------------------------------------------

  CREATE TABLE "SCOTT"."EMP_KOR_1" 
   (	"ID" VARCHAR2(20 BYTE), 
	"ENAME" VARCHAR2(30 BYTE), 
	"KOR" NUMBER(3,0) DEFAULT 0, 
	"ENG" NUMBER(3,0) DEFAULT 0, 
	"MATH" NUMBER(3,0) DEFAULT 0
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  Constraints for Table EMP_KOR_1
--------------------------------------------------------

  ALTER TABLE "SCOTT"."EMP_KOR_1" MODIFY ("ENAME" NOT NULL ENABLE);
