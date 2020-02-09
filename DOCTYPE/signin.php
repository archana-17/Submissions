<?php
$dservername ="localhost";
$dusername = "root";
$dpassword = "";
$dbname = "codeflix";

$email = $_REQUEST["email"];
$password = $_REQUEST["password"];
$salt = "codeflix";
$password_encrypted = sha1($password.$salt);
  
$sql = "SELECT count(*) as total from signup WHERE email = '".$email."' and password = '".$password_encrypted."'";
// echo $email;
// echo $password;

$myPDO=new PDO('mysql:host=127.0.0.1;port=3306;dbname=codeflix',$dusername,$dpassword);
$myPDO->setAttribute(PDO::ATTR_ERRMODE,PDO::ERRMODE_EXCEPTION);
try{
    $result=$myPDO->query($sql);
} catch (PDOException $e){
    echo $e->getMessage();
    return;
}

// $row = mysqli_fetch_array($sql);

foreach($result as $row){
    // echo "name" . $row['name'] . 'email' . $row['email'];
    echo "Login Successful";
}
 
// if($result["total"] > 0){
//     ?>
//     <script>
//         alert('Login successful');
//     </script>
     
//     <?php
// }
// else{
//     ?>
//     <script>
//         alert('Login failed');
//     </script>
//     <?php
// }
?>