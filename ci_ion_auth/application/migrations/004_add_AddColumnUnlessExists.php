<?php  defined('BASEPATH') OR exit('No direct script access allowed');

class Migration_Add_AddColumnUnlessExists extends CI_Migration {

    public function up()
    {
        $SQL = "DROP procedure IF EXISTS AddColumnUnlessExists;";
        $this->db->query($SQL);
        // Create Function GetFirstDayOfMonth ...
        $SQL = "create procedure AddColumnUnlessExists(
            IN dbName tinytext,
            IN tableName tinytext,
            IN fieldName tinytext,
            IN fieldDef text
        )
            BEGIN
                DECLARE _count INT;
                SET _count = (  SELECT COUNT(*)
                                FROM INFORMATION_SCHEMA.COLUMNS
                                WHERE   TABLE_NAME = tableName AND
                                        COLUMN_NAME = fieldName );
                IF _count = 0 THEN
                                set @ddl=CONCAT('ALTER TABLE ',dbName,'.',tableName,
                                    ' ADD COLUMN ',fieldName,' ',fieldDef);
                                prepare stmt from @ddl;
                                execute stmt;
                END IF;
            END
        ";

        $this->db->query($SQL);

        ########################################  DB Version Note ...
        $data = array(
            array(
                'version_no'        => substr(basename(__FILE__), 0, 3),
                'date_created'      => '2014-09-01 16:33:06',
                'release_note_eng'  => 'ADDED FUNCTION:: AddColumnUnlessExists',
                'release_note_adm'  => "Made migration more powerfull",
                'migration_by'      => '1',
                'migration_ip'      => $_SERVER['REMOTE_ADDR']
            )
        );
        $this->db->insert_batch('migrations_db_versions', $data);
        ########################################  DB Version Note  ENDS...

    }

    public function down()
    {
//        $versionNo = substr(basename(__FILE__), 0, 3);
//        $this->db->query("DELETE FROM migrations_db_versions WHERE version_no='$versionNo'");

        $this->db->query("DROP procedure IF EXISTS AddColumnUnlessExists;");
    }
}
