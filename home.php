<?php
ob_start();
session_start();
require_once 'dbconnect.php';

// if session is not set this will redirect to login page
if( !isset($_SESSION['user']) ) {
 header("Location: index.php");
 exit;
}
// select logged-in users detail
$res=mysqli_query($conn, "SELECT * FROM users WHERE userId=".$_SESSION['user']);
$userRow=mysqli_fetch_array($res, MYSQLI_ASSOC);

$sql = "SELECT * FROM media"; /*INNER JOIN author ON media.fk_authorId = author.authorId INNER JOIN publisher ON media.fk_publisherId = publisher.publisherId";*/
$result = $conn->query($sql);

?>
<!DOCTYPE html>
<html>
<head>
<title>Welcome - <?php echo $userRow['userEmail']; ?></title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
</head>
<body class="container">
        Welcome back <?php echo $userRow['userEmail']; ?>
           
           <a href="logout.php?logout">Sign Out</a>
 
       <!-- List Data in Front-End -->
    <?php
    
        while($row = $result->fetch_assoc()) {
            echo
            "<div class='card col-md-6'>" .
            " <b>Title:</b> " . $row["title"].
            " <b>Author:</b> " . $row["authorName"] . " " . $row["authorSurname"].
            " <b>Type:</b> " . $row["type"].
            " <b>Genre:</b> " . $row["genres"].
            " <img class='col-md-4' src='" . $row["image"].
            " <b>Description:</b> " . $row["short_description"].
            " <b>ISBN:</b> " . $row["ISBN"].
            " <b>Publication Date:</b> " . $row["publish_date"].
            " <b>Status:</b> " . $row["status"].
            " <b>Publisher</b> " . $row["publisherName"] .
            "</div>";
            }
            $conn->close();
            
        ?>           


 
</body>
</html>
<?php ob_end_flush(); ?>