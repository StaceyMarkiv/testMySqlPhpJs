<?php

class DB
{
    private $db;        // переменная для хранения объекта PDO

    public function __construct()
    {
        //параметры подключения к БД
        $dbconnect = parse_ini_file("ini/dbconnect.ini");
        $host = $dbconnect['HOST'];
        $port = $dbconnect['PORT'];
        $dbname = $dbconnect['DBNAME'];
        $user = $dbconnect['USER'];
        $password = $dbconnect['PASSWORD'];

        try {
            $this->db = new PDO("mysql:host=$host; port=$port; dbname=$dbname", $user, $password);
        } catch (PDOException $e) {
            echo "Connection failed: " . $e->getMessage();
        }
    }

    //функция отправки запросов в БД
    public function query($sql, $params = [])
    {
        // Подготовка запроса
        $query_res = $this->db->prepare($sql);

        if (!empty($params)) {
            foreach ($params as $key => $value) {
                $query_res->bindValue(":$key", $value);
            }
        }

        // Выполняем запрос
        $query_res->execute();
        // Возвращаем ответ
        return $query_res->fetchAll(PDO::FETCH_ASSOC);
    }
}
