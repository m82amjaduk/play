

<?
require_once("__database.php");
class Mysql extends Database {

private $link = null;

public function __construct($login, $password, $database, $hostname) {
    parent::__construct($login, $password, $database, $hostname);
    $this->connect();
    $this->selectDatabase();
}

public function connect() {
    if (! is_null($this->link)) {
    return;
}

$link = @mysql_connect($this->hostname, $this->login, $this->password);
if (! $link) {
throw new DatabaseException(
sprintf(
'Cannot connect to database. mysql_connect() to %s with login %s fails',
$this->hostname,
$this->login
)
);
}
}

public function selectDatabase() {
$ret = @mysql_select_db($this->database, $this->link);
if (! $ret) {
throw new DatabaseException("Cannot select database {$this->database}");
}
}

}

