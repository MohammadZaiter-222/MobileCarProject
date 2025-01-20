<?php
include 'db_connect.php';

$id = $_POST['id'];
$currentAvailability = $_POST['availability'];

// Toggle availability: 1 becomes 0, and 0 becomes 1
$newAvailability = $currentAvailability == '1' ? '0' : '1';

$query = "UPDATE cars SET availability = '$newAvailability' WHERE id = $id";
if (mysqli_query($conn, $query)) {
    echo json_encode(["success" => true, "message" => "Car availability updated"]);
} else {
    echo json_encode(["success" => false, "message" => "Error: " . mysqli_error($conn)]);
}
?>
