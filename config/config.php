<?php
define('DEVELOPMENT', "YOUR_DEVELOPEMENT_LINK");
define('PRODUCTION', "YOUR_PRODUCTION_LINK");

class databaseConnections
{   

 private $_connection;

  private static $_instance; 
    
    public static function getInstance() {
        if(!self::$_instance) { 
            self::$_instance = new self();
        }
        return self::$_instance;
    }
   
    private function __construct() {

        switch ($_SERVER['SERVER_NAME']) 
        {
            case PRODUCTION:
                $config = parse_ini_file('database_connection.ini');
            break;
            default:
                $config = parse_ini_file('dev/database_connection.ini');
            break;
        }
        
        $this->_connection = new PDO($config['DNS'], $config['username'], $config['password'],
    array(PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES 'utf8'"));

        // Error handling
        if(mysqli_connect_error()) {
            trigger_error("Failed to conencto to MySQL: " . mysqli_connect_error(),
                 E_USER_ERROR);
        }
    }

    private function __clone() { }

    public function getConnection() {
        return $this->_connection;
    }

}

$db = Databaseconnections::getInstance();
$bdd = $db->getConnection();

switch ($_SERVER['SERVER_NAME']) {
    case PRODUCTION:
        $Style="/css/style.min.css";
    break;
    default:
        $Style="/css/style.css";
    break;
}

if(stristr($_SERVER['REQUEST_URI'],'functions'))
{
    require_once ("autoVersioning.php");
}
else
{
    require_once ("./functions/autoVersioning.php");
}
?>