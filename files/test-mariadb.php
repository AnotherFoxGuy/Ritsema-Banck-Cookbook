<?php

use RitsemaBanck\ConnectDB;

require __DIR__ . '/../vendor/autoload.php';

$conn = new ConnectDB();
$mysql = $conn->getConnection();


// Available servers
$sql = "SELECT * FROM QA";

$result = $mysql->query($sql);

echo "success";