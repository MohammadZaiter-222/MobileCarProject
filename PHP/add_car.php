<?php
include 'db_connect.php';

$brand = $_POST['brand'];
$model = $_POST['model'];
$price = $_POST['price'];
$availability = $_POST['availability'];

$query = "INSERT INTO cars (brand, model, price, availability) VALUES ('$brand', '$model', '$price', '$availability')";
if (mysqli_query($conn, $query)) {
    echo json_encode(["success" => true, "message" => "Car added successfully"]);
} else {
    echo json_encode(["success" => false, "message" => "Error: " . mysqli_error($conn)]);
}
?>
