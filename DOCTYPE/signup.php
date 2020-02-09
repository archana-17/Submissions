<?php  
 
$dservername ="localhost";
$dusername = "root";
$dpassword = "";
$dbname = "codeflix";

$name = $_POST["name"];
$email = $_POST["email"];+
$password = $_POST["password"];
$salt = "codeflix";
$password_encrypted = sha1($password.$salt);
 
$sql = "INSERT INTO signup (name, email, password) VALUES ('$name', '$email', '$password_encrypted')";
 $myPDO=new PDO('mysql:host=127.0.0.1;port=3306;dbname=codeflix',$dusername,$dpassword);
 $myPDO->setAttribute(PDO::ATTR_ERRMODE,PDO::ERRMODE_EXCEPTION);
 $statement=$myPDO->prepare($sql);
 $result=$statement->execute();
 $sqlState=$statement->errorCode();
// if($conn->query($sql) === TRUE){
if($sqlState == 0){
    ?>
    <script>
        alert('Values have been inserted');
    </script>
    <?php
}
else{
    ?>
    <script>
        alert('Values did not insert');
    </script>
    <?php
}
 
 
?>