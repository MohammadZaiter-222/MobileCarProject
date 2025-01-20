<?php
include 'db_connect.php';

$username = $_POST['username'];
$password = $_POST['password'];

// Admin credentials
if ($username === 'admin' && $password === 'admin') {
    echo json_encode(["success" => true, "role" => "admin", "message" => "Login successful"]);
    exit;
}

$query = "SELECT * FROM users WHERE username = '$username'";
$result = mysqli_query($conn, $query);

if (mysqli_num_rows($result) > 0) {
    $user = mysqli_fetch_assoc($result);
    if (password_verify($password, $user['password'])) {
        echo json_encode(["success" => true, "role" => $user['role'], "message" => "Login successful"]);
    } else {
        echo json_encode(["success" => false, "message" => "Invalid password"]);
    }
} else {
    echo json_encode(["success" => false, "message" => "User not found"]);
}
?>
