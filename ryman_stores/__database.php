<?

abstract class Database {
protected $login;
protected $password;
protected $database;
protected $hostname;

public function __construct($login, $password, $database, $hostname) {
// NB: password not checked and may be empty
$this->throwExceptionIfNotSet('login', $login);
$this->throwExceptionIfNotSet('database', $database);
$this->throwExceptionIfNotSet('hostname', $hostname);

$this->login    = $login;
$this->password = $password;
$this->database = $database;
$this->hostname = $hostname;
}

private function throwExceptionIfNotSet($argName, $argValue) {
if (empty($argValue)) {
throw new DatabaseException("'${argName}' not set");
}
}

}