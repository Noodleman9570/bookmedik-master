<?php
class Database {

	private $user;
	private $pass;
	private $host;
	private $ddbb;

	public static $db;
	public static $con;
	function __construct()
	{
		$this->user="root";$this->pass="";$this->host="127.0.0.1";$this->ddbb="bookmedik";
	}

	function connect(){
		$con = new mysqli($this->host,$this->user,$this->pass,$this->ddbb);
		return $con;
	}

	public static function getCon(){
		if(self::$con==null && self::$db==null){
			self::$db = new Database();
			self::$con = self::$db->connect();
		}
		return self::$con;
	}
	
}
?>
