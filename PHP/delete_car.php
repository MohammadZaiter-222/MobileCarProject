<?php
include 'db_connect.php';

$id = $_POST['id'];

$query = "DELETE FROM cars WHERE id = $id";
if (mysqli_query($conn, $query)) {
    echo json_encode(["success" => true, "message" => "Car deleted successfully"]);
} else {
    echo json_encode(["success" => false, "message" => "Error: " . mysqli_error($conn)]);
}
?>
