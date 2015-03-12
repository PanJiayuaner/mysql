-- helper function1
DELIMITER // 
create PROCEDURE `switchCharPos`(IN P_TEXT_IN VARCHAR(130),IN P_POS1 INT,IN P_POS2 INT,OUT P_TEXT_OUT VARCHAR(130)) 

BEGIN 
DECLARE w_pos1,w_pos2 INT; 

DECLARE w_char1,w_char2 varchar(1) default '';
DECLARE w_temp_text_in,w_temp_text_out varchar(130) default ''; 
SET w_pos1 = P_POS1; 
SET w_pos2 = P_POS2; 
SET w_temp_text_in = P_TEXT_IN; 
SET w_char1 = SUBSTRING(w_temp_text_in,w_pos1,1); 
SET w_char2 = SUBSTRING(w_temp_text_in,w_pos2,1); 
-- add first character 
SELECT INSERT(w_temp_text_in, w_pos2, 1, w_char1) into w_temp_text_in;
 -- add second character 
SELECT INSERT(w_temp_text_in, w_pos1, 1, w_char2) into w_temp_text_in; 
SET w_temp_text_out = w_temp_text_in; SET P_TEXT_OUT = w_temp_text_out;

END//

DELIMITER ;
-- helper function2
DELIMITER //
create PROCEDURE `getScrambledText`(IN P_TEXT VARCHAR(130),OUT P_SCRAMBLED VARCHAR(130))
BEGIN
 
DECLARE w_counter integer;
DECLARE w_scrambled varchar(130);
DECLARE w_pos1,w_pos2 integer;
 
set w_pos1 = 1;
 
set w_pos2 = 1;
 
set w_counter = -1;
 
set w_scrambled =  P_TEXT;
 
while (w_counter!=LENGTH(w_scrambled)) do
 
  set w_counter=w_counter+1;
 
  set w_pos1 = ROUND((RAND() * (length(w_scrambled)-1)+1));
 
  set w_pos2 = ROUND((RAND() * (length(w_scrambled)-1)+1));
 
  CALL Test2.switchCharPos(w_scrambled,w_pos1,w_pos2,@P);
 
  SET w_scrambled = @P;
 
END WHILE;
 
	set P_SCRAMBLED = w_scrambled;
 
END //

DELIMITER ;
-- update patient 
DELIMITER //
Create PROCEDURE `update_patient`(IN COUNTER INT)
BEGIN


DECLARE T_EST1 varchar(130);
DECLARE T_EST2 varchar(130);
DECLARE T_EST3 varchar(130);
DECLARE T_EST4 varchar(130);
DECLARE T_EST5 varchar(130);
DECLARE T_EST6 varchar(130);
DECLARE T_EST7 varchar(130);
DECLARE T_EST8 varchar(130);
DECLARE T_EST9 varchar(130);
DECLARE T_EST10 varchar(130);
DECLARE T_EST11 varchar(130);


set T_EST1 = (SELECT `DataRecordName` FROM `patient` LIMIT COUNTER,1 );
set T_EST2 = (SELECT `PatientFirstName` FROM `patient`  LIMIT COUNTER,1 );
set T_EST3 = (SELECT `PatientMiddleName` FROM `patient` LIMIT COUNTER,1 );
set T_EST4 = (SELECT `PatientLastName` FROM `patient` LIMIT COUNTER,1 );
set T_EST5 = (SELECT `PatientAddress1` FROM `patient`  LIMIT COUNTER,1 );
set T_EST6 = (SELECT `PatientAddress2` FROM `patient` LIMIT COUNTER,1 );
set T_EST7 = (SELECT `PatientCity` FROM `patient`  LIMIT COUNTER,1 );
set T_EST8 = (SELECT `PatientId` FROM `patient`  LIMIT COUNTER,1 );
set T_EST9 = (SELECT `TreatmentNotes` FROM `patient`  LIMIT COUNTER,1 );
set T_EST10 = (SELECT `PatientPhone` FROM `patient` LIMIT COUNTER,1 );
set T_EST11 = (SELECT `PatientSSN` FROM `patient` LIMIT COUNTER,1 );



call getScrambledText(T_EST1,T_EST1);
call getScrambledText(T_EST2,T_EST2);
call getScrambledText(T_EST3,T_EST3);
call getScrambledText(T_EST4,T_EST4);
call getScrambledText(T_EST5,T_EST5);
call getScrambledText(T_EST6,T_EST6);
call getScrambledText(T_EST7,T_EST7);
call getScrambledText(T_EST8,T_EST8);
call getScrambledText(T_EST9,T_EST9);
call getScrambledText(T_EST10,T_EST10);
call getScrambledText(T_EST11,T_EST11);



update patient
set 
DataRecordName    = T_EST1,

where RECORDID = (
   select RECORDID from (
      select RECORDID, @rownum:=@rownum + 1 as rownumber 
      from patient, (select @rownum:=0) vars order by RECORDID
   ) sq where rownumber = `COUNTER`+1);



END //
DELIMITER ;
-- update request
-- 
DELIMITER //
Create PROCEDURE `update_request`(IN COUNTER INT)
BEGIN


DECLARE T_EST1 varchar(130);
DECLARE T_EST2 varchar(130);
DECLARE T_EST3 varchar(130);
DECLARE T_EST4 varchar(130);
DECLARE T_EST5 varchar(130);
DECLARE T_EST6 varchar(130);
DECLARE T_EST7 varchar(130);
DECLARE T_EST8 varchar(130);
DECLARE T_EST9 varchar(130);
DECLARE T_EST10 varchar(130);
DECLARE T_EST11 varchar(130);
DECLARE T_EST12 varchar(130);
DECLARE T_EST13 varchar(130);
DECLARE T_EST14 varchar(130);
DECLARE T_EST15 varchar(130);
DECLARE T_EST16 varchar(130);
DECLARE T_EST17 varchar(130);
DECLARE T_EST18 varchar(130);



set T_EST1 = (SELECT `Comments` FROM `Request` WHERE `RequestType` = 'CLINICAL' LIMIT COUNTER,1);
set T_EST2 = (SELECT `CreditCardNum` FROM `Request` WHERE `RequestType` = 'CLINICAL' LIMIT COUNTER,1);
set T_EST3 = (SELECT `CreditCardHolderName` FROM `Request` WHERE `RequestType` = 'CLINICAL' LIMIT COUNTER,1);
set T_EST4 = (SELECT `PatientSSN` FROM `Request` WHERE `RequestType` = 'CLINICAL' LIMIT COUNTER,1);
set T_EST5 = (SELECT `PatientFirstName` FROM `Request` WHERE `RequestType` = 'CLINICAL' LIMIT COUNTER,1);
set T_EST6 = (SELECT `PatientMiddleName` FROM `Request` WHERE `RequestType` = 'CLINICAL' LIMIT COUNTER,1);
set T_EST7 = (SELECT `PatientLastName` FROM `Request` WHERE `RequestType` = 'CLINICAL' LIMIT COUNTER,1);
set T_EST8 = (SELECT `PatientAddress1` FROM `Request` WHERE `RequestType` = 'CLINICAL' LIMIT COUNTER,1);
set T_EST9 = (SELECT `PatientAddress2` FROM `Request` WHERE `RequestType` = 'CLINICAL'LIMIT COUNTER,1);
set T_EST10 = (SELECT `PatientCity` FROM `Request` WHERE `RequestType` = 'CLINICAL'LIMIT COUNTER,1);
set T_EST11 = (SELECT `PatientId` FROM `Request` WHERE `RequestType` = 'CLINICAL'LIMIT COUNTER,1);
set T_EST12 = (SELECT `PrimarySubscriberFirstName` FROM `Request` WHERE `RequestType` = 'CLINICAL' LIMIT COUNTER,1);
set T_EST13 = (SELECT `PrimarySubscriberLastName` FROM `Request` WHERE `RequestType` = 'CLINICAL' LIMIT COUNTER,1);
set T_EST14 = (SELECT `SecondarySubscriberFirstName` FROM `Request` WHERE `RequestType` = 'CLINICAL' LIMIT COUNTER,1);
set T_EST15 = (SELECT `SecondarySubscriberLastName` FROM `Request` WHERE `RequestType` = 'CLINICAL' LIMIT COUNTER,1);
set T_EST16 = (SELECT `ReportingNotes` FROM `Request` WHERE `RequestType` = 'CLINICAL' LIMIT COUNTER,1);
set T_EST17 = (SELECT `TreatmentNotes` FROM `Request` WHERE `RequestType` = 'CLINICAL' LIMIT COUNTER,1);
set T_EST18 = (SELECT `PatientPhone` FROM `Request` WHERE `RequestType` = 'CLINICAL' LIMIT COUNTER,1);


call getScrambledText(T_EST1,T_EST1);
call getScrambledText(T_EST2,T_EST2);
call getScrambledText(T_EST3,T_EST3);
call getScrambledText(T_EST4,T_EST4);
call getScrambledText(T_EST5,T_EST5);
call getScrambledText(T_EST6,T_EST6);
call getScrambledText(T_EST7,T_EST7);
call getScrambledText(T_EST8,T_EST8);
call getScrambledText(T_EST9,T_EST9);
call getScrambledText(T_EST10,T_EST10);
call getScrambledText(T_EST11,T_EST11);
call getScrambledText(T_EST12,T_EST12);
call getScrambledText(T_EST13,T_EST13);
call getScrambledText(T_EST14,T_EST14);
call getScrambledText(T_EST15,T_EST15);
call getScrambledText(T_EST16,T_EST16);
call getScrambledText(T_EST17,T_EST17);
call getScrambledText(T_EST18,T_EST18);


UPDATE Request 
SET
PatientFirstName  = T_EST5,
where RECORDID = (
   select RECORDID from (
      select RECORDID, @rownum:=@rownum + 1 as rownumber 
      from Request, (select @rownum:=0) vars where RequestType = 'CLINICAL' order by RECORDID
   ) sq where rownumber = `COUNTER`+1);



END //
DELIMITER ;

-- update 2 tables
DELIMITER // 
Create PROCEDURE `update_all`( )
BEGIN


DECLARE T_EST1 int;
DECLARE T_EST2 int;
set T_EST1 = 0;
SET SQL_SAFE_UPDATES = 0;

while (T_EST1<(SELECT COUNT(*) FROM patient)) do

 call update_patient(T_EST1);

set T_EST1 = T_EST1 + 1;


END while;


set T_EST2 = 0;

while (T_EST2<(SELECT COUNT(*) FROM request where `RequestType` = 'CLINICAL')) do

	call update_request(T_EST2);

set T_EST2 = T_EST2 + 1;



END while;

END //
DELIMITER ;

DROP PROCEDURE IF EXISTS `switchCharPos`;
DROP PROCEDURE IF EXISTS `getScrambledText`;
DROP PROCEDURE IF EXISTS `update_patient`;
DROP PROCEDURE IF EXISTS `update_request`;
DROP PROCEDURE IF EXISTS `update_all`;

call update_all();




