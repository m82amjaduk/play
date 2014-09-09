<?php  defined('BASEPATH') OR exit('No direct script access allowed');

class Migration_Add_GetUnID extends CI_Migration {

    public function up()
    {
        // Create Function GetUnID ...
        $this->db->query(" delimiter //

DROP FUNCTION IF EXISTS GetUnID//

CREATE  FUNCTION `GetUnID`(`oldId` VARCHAR(10) )
  RETURNS varchar(10) CHARSET latin1 COLLATE latin1_general_ci
LANGUAGE SQL
NOT DETERMINISTIC
CONTAINS SQL
  SQL SECURITY DEFINER
  COMMENT ''
  BEGIN
    DECLARE charOldValue char(6);
    DECLARE iNumValue INT;
    DECLARE iCharValue char(3);
    DECLARE ch1stLetter char(1);
    DECLARE ch2ndLetter char(1);
    DECLARE ch3rdLetter char(1);


    Set iNumValue = CAST( SUBSTRING(oldId, 4, 4) AS SIGNED );
    Set iCharValue =  SUBSTRING(oldId, 1, 3);
    Set charOldValue = oldId ;

    SET iNumValue = iNumValue + 1;
    IF iNumValue > 9999 Then

      Set iNumValue = 0 ;
      Set ch1stLetter = SUBSTRING(iCharValue, 3, 1);
      Set ch2ndLetter = SUBSTRING(iCharValue, 2, 1);
      Set ch3rdLetter = SUBSTRING(iCharValue, 1, 1);

      IF ch1stLetter = 'Z' Then
        Set ch1stLetter = 'A';
        IF ch2ndLetter = 'Z' Then
          Set ch2ndLetter = 'A';
          Set ch3rdLetter = CHAR(ASCII(ch3rdLetter) + 1);
        ELSE Set ch2ndLetter = CHAR(ASCII(ch2ndLetter) + 1);
        END IF;
      ELSE Set ch1stLetter = CHAR(ASCII(ch1stLetter) + 1);
      END If;

      Set iCharValue = CONCAT(ch3rdLetter , ch2ndLetter, ch1stLetter);
    END IF;

    SET @ret = CONCAT (iCharValue , Right( CONCAT ('0000' , CAST(iNumValue AS char(4))),4) );
    RETURN @ret;

  END//

delimiter ;");

        // Does not require Insert Code...
    }

    public function down()
    {
        $this->db->query("DROP FUNCTION IF EXISTS GetUnID;");
    }
}
