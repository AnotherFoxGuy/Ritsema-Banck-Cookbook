<?php


namespace RitsemaBanck;

use mysqli;

class ConnectDB
{
    private $servername = "<%= node['mariadb']['host'] %>";
    private $username = "<%= node['mariadb']['user'] %>";
    private $password = "<%= node['mariadb']['password'] %>";
    private $database = "<%= node['mariadb']['database'] %>";
    private $conn;

    public function __construct()
    {
        $this->conn = new MySQLi($this->servername, $this->username, $this->password, $this->database);
    }

    public function getConnection()
    {
        return $this->conn;
    }
}
