<?php
include 'db_connect.php';

$username = $_POST['username'];
$password = password_hash($_POST['password'], PASSWORD_BCRYPT); 
$role = 'user'; 


$query = "SELECT * FROM users WHERE username = '$username'";
$result = mysqli_query($conn, $query);

if (mysqli_num_rows($result) > 0) {
    echo json_encode(["success" => false, "message" => "Username already exists"]);
} else {
    $insertQuery = "INSERT INTO users (username, password, role) VALUES ('$username', '$password', '$role')";
    if (mysqli_query($conn, $insertQuery)) {
        echo json_encode(["success" => true, "message" => "User registered successfully"]);
    } else {
        echo json_encode(["success" => false, "message" => "Error: " . mysqli_error($conn)]);
    }
}
?>
