<?php
include 'db_connect.php';

$query = "SELECT * FROM cars";
$result = mysqli_query($conn, $query);

$cars = [];
while ($row = mysqli_fetch_assoc($result)) {
    $cars[] = $row;
}

echo json_encode($cars);
?>
