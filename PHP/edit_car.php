<?php
include 'db_connect.php';

$id = $_POST['id'];
$brand = $_POST['brand'];
$model = $_POST['model'];
$price = $_POST['price'];
$availability = $_POST['availability'];

$query = "UPDATE cars SET brand = '$brand', model = '$model', price = '$price', availability = '$availability' WHERE id = $id";
if (mysqli_query($conn, $query)) {
    echo json_encode(["success" => true, "message" => "Car updated successfully"]);
} else {
    echo json_encode(["success" => false, "message" => "Error: " . mysqli_error($conn)]);
}
?>
