CREATE TABLE PATIENT (ID BIGINT NOT NULL, BIRTHDATE DATE, NAME VARCHAR(255), PATIENTID BIGINT, PRIMARY KEY (ID))
CREATE TABLE TREATMENT (ID BIGINT NOT NULL, TTYPE VARCHAR(31), DIAGNOSIS VARCHAR(255), patient_fk BIGINT, provider_fk BIGINT, PRIMARY KEY (ID))
CREATE TABLE DrugTreatment (ID BIGINT NOT NULL, DOSAGE FLOAT, DRUG VARCHAR(255), PRIMARY KEY (ID))
CREATE TABLE PROVIDER (ID BIGINT NOT NULL, NAME VARCHAR(255), NPI BIGINT, SPECIALIZATION VARCHAR(255), PRIMARY KEY (ID))
CREATE TABLE Radiology (ID BIGINT NOT NULL, DATES BYTEA, PRIMARY KEY (ID))
CREATE TABLE Surgery (ID BIGINT NOT NULL, DATE DATE, PRIMARY KEY (ID))
CREATE TABLE BillingRecord (ID BIGINT NOT NULL, AMOUNT FLOAT, DATE DATE, DESCRIPTION VARCHAR(255), PRIMARY KEY (ID))
CREATE TABLE DrugTreatmentRecord (ID BIGINT NOT NULL, DATE DATE, DOSAGE FLOAT, DRUGNAME VARCHAR(255), SUBJECT_ID BIGINT, PRIMARY KEY (ID))
CREATE TABLE SUBJECT (ID BIGINT NOT NULL, SUBJECTID BIGINT, PRIMARY KEY (ID))
CREATE TABLE DrugTreatmentRecord_DrugTreatment (DrugTreatmentRecord_ID BIGINT NOT NULL, treatments_ID BIGINT NOT NULL, PRIMARY KEY (DrugTreatmentRecord_ID, treatments_ID))
ALTER TABLE TREATMENT ADD CONSTRAINT FK_TREATMENT_provider_fk FOREIGN KEY (provider_fk) REFERENCES PROVIDER (ID)
ALTER TABLE TREATMENT ADD CONSTRAINT FK_TREATMENT_patient_fk FOREIGN KEY (patient_fk) REFERENCES PATIENT (ID)
ALTER TABLE DrugTreatment ADD CONSTRAINT FK_DrugTreatment_ID FOREIGN KEY (ID) REFERENCES TREATMENT (ID)
ALTER TABLE Radiology ADD CONSTRAINT FK_Radiology_ID FOREIGN KEY (ID) REFERENCES TREATMENT (ID)
ALTER TABLE Surgery ADD CONSTRAINT FK_Surgery_ID FOREIGN KEY (ID) REFERENCES TREATMENT (ID)
ALTER TABLE DrugTreatmentRecord ADD CONSTRAINT FK_DrugTreatmentRecord_SUBJECT_ID FOREIGN KEY (SUBJECT_ID) REFERENCES SUBJECT (ID)
ALTER TABLE DrugTreatmentRecord_DrugTreatment ADD CONSTRAINT FK_DrugTreatmentRecord_DrugTreatment_treatments_ID FOREIGN KEY (treatments_ID) REFERENCES TREATMENT (ID)
ALTER TABLE DrugTreatmentRecord_DrugTreatment ADD CONSTRAINT FK_DrugTreatmentRecord_DrugTreatment_DrugTreatmentRecord_ID FOREIGN KEY (DrugTreatmentRecord_ID) REFERENCES DrugTreatmentRecord (ID)
CREATE TABLE SEQUENCE (SEQ_NAME VARCHAR(50) NOT NULL, SEQ_COUNT DECIMAL(38), PRIMARY KEY (SEQ_NAME))
INSERT INTO SEQUENCE(SEQ_NAME, SEQ_COUNT) values ('SEQ_GEN', 0)
