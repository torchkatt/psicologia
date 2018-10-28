<?php

class Database
{
    public static function StartUp()
    {
        $pdo = new PDO('mysql:host=sql157.main-hosting.eu;dbname=u466347497_psico;charset=utf8', 'u466347497_psico', 'practicas2018');
        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        return $pdo;
    }
}
