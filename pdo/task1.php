<?php
//подключение к БД
require_once "db_connection.php";

$db = new DB;

//запрос №1 к заданию 1
$params1 = [
    'max_date' => '2010-09-01',
];

$sql1 = "SELECT brand, model, end_production
        FROM car_models
        JOIN car_brands ON car_brands.id_brand = car_models.id_brand
        WHERE end_production < :max_date";

$result = $db->query($sql1, $params1);

echo "<h3>Сняты с производства на сентябрь 2010 года:</h3>";

echo "<table width=\"350\" border=\"2px solid white\" cellpadding=\"5\" cellspacing=\"2\">
        <tr><th>Модель</th><th>Окончание производства</th></tr>";

foreach ($result as $row) {
    $brand = $row['brand'];
    $model = $row['model'];
    $end_production = $row['end_production'];

    echo "<tr>";
    echo "<td width=\"120\" style=\"text-align: center;\">$brand $model</td>";
    echo "<td style=\"text-align: center;\">$end_production</td>";
    echo "</tr>";
}
echo "</table>";

//запрос №2 к заданию 1
$params2 = [
    'max_cost' => 1000,
];

$sql2 = "SELECT brand, model, work_name, work_cost
        FROM service_works
        JOIN car_models ON service_works.id_model = car_models.id_model
        JOIN car_brands ON car_brands.id_brand = car_models.id_brand
        WHERE end_production IS NULL AND work_cost > :max_cost";

$result = $db->query($sql2, $params2);

echo "<h3>Перечень работ:</h3>";

echo "<table width=\"700\" border=\"2px solid white\" cellpadding=\"5\" cellspacing=\"2\">
        <tr><th>Модель</th><th>Наименование работ</th><th>Стоимость работ (руб.)</th></tr>";

foreach ($result as $row) {
    $brand = $row['brand'];
    $model = $row['model'];
    $work_name = $row['work_name'];
    $work_cost = $row['work_cost'];

    echo "<tr>";
    echo "<td width=\"120\" style=\"text-align: center;\">$brand $model</td>";
    echo "<td style=\"text-align: center;\">$work_name</td>";
    echo "<td width=\"200\" style=\"text-align: center;\">$work_cost</td>";
    echo "</tr>";
}
echo "</table>";
