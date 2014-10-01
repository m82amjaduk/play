<?php  defined('BASEPATH') OR exit('No direct script access allowed');

class Migration_Add_GetFirstDayOfMonth extends CI_Migration {

    public function up()
    {
        $SQL = "DROP FUNCTION IF EXISTS GetFirstDayOfMonth;";
        $this->db->query($SQL);
        // Create Function GetFirstDayOfMonth ...
        $SQL = "CREATE FUNCTION GetFirstDayOfMonth (`date` datetime)
            RETURNS datetime
            BEGIN
              RETURN DATE_ADD(DATE_ADD(LAST_DAY(`date`), INTERVAL - 1 MONTH), INTERVAL 1 DAY);
            END ";
        $this->db->query($SQL);


        ########################################  DB Version Note ...
        $data = array(
            array(
                'version_no'        => substr(basename(__FILE__), 0, 3),
                'date_created'      => '2014-08-25 14:31:06',
                'release_note_eng'  => 'ADDED FUNCTION:: GetFirstDayOfMonth',
                'release_note_adm'  => "Test Functionss",
                'migration_by'      => '1',
                'migration_ip'      => $_SERVER['REMOTE_ADDR']
            )
        );
        $this->db->insert_batch('migrations_db_versions', $data);
    }

    public function down()
    {
//        $versionNo = substr(basename(__FILE__), 0, 3);
//        $this->db->query("DELETE FROM migrations_db_versions WHERE version_no='$versionNo'");

        $this->db->query("DROP FUNCTION IF EXISTS GetFirstDayOfMonth;");
    }
}
