<?php
    session_start();
?>

<!doctype html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <title>Konto</title>
    <link href="styl.css" rel="stylesheet">
</head>
<body>
    <div id="container">
        <div id="logo">
        <a href="index.php"><img src="gsp.jpg" id="logo-jpg" href="index.php"></a>
    </div>
    <div id="koszyk"> 
        <button><a href="koszyk.html">Koszyk</a></button>
        <button><a href="konto.html">Konto</a></button>           
        <button><a href="kontakt.html">Kontakt</a></button>
    </div>
</div> 
<header>
    <div class="dropdown">
        <button class="dropbtn">Akcesoria</button>
        <div class="dropdown-content">
          <a href="#">Link 1</a>
          <a href="#">Link 2</a>
          <a href="#">Link 3</a>
        </div>
      </div> 
      <div class="dropdown">
        <button class="dropbtn">Komputery</button>
        <div class="dropdown-content">
          <a href="#">Link 1</a>
          <a href="#">Link 2</a>
          <a href="#">Link 3</a>
        </div>
      </div>
      <div class="dropdown">
        <button class="dropbtn">Konsole</button>
        <div class="dropdown-content">
          <a href="#">Link 1</a>
          <a href="#">Link 2</a>
          <a href="#">Link 3</a>
        </div>
      </div>
      <div class="dropdown">
        <button class="dropbtn">Soczyste mandarynki</button>
        <div class="dropdown-content">
            <a href="mandarynka.html">Link 1</a>
            <a href="mandarynka.html">Link 2</a>
            <a href="mandarynka.html">Link 3</a>
        </div>
    </div>
      <div class="dropdown">
        <button class="dropbtn">Kremówki papieskie</button>
        <div class="dropdown-content">
          <a href="#">Link 1</a>
          <a href="#">Link 2</a>
          <a href="#">Link 3</a>
        </div>
      </div>    
</header>
<main>
<div class="center">
<div id="panel">
<form action="zaloguj.php" method="post">
     <label for="username">Nazwa użytkownika:</label>
     <input type="text" id="username" name="username">
     <label for="password">Hasło:</label>
     <input type="password" id="password" name="password">
    <div id="lower">
    <input type="checkbox"><label class="check" for="checkbox">Zapamiętaj mnie!</label>
    <input type="submit" value="Login">
    </div>
    </form>
    </div>
</div>    
</main>
</body>
</html> 
<?php
    session_start();

    if (isset($_POST["email"]) && isset($_POST["password"])) {
        $email = filter_var($_POST["email"], FILTER_SANITIZE_STRING);
        $password = filter_var($_POST["password"], FILTER_SANITIZE_STRING);

        $connection = mysqli_connect('localhost', 'root', '', 'sklep');

        $query = "SELECT `imie`, `nazwisko` FROM `users` WHERE `email` = '$email' AND `password` = '$password';";
        $result = mysqli_query($connection, $query);

        mysqli_close($connection);

        if($row = mysqli_fetch_row($result)) {
            $_SESSION['imie'] = $row[0];
            $_SESSION['nazwisko'] = $row[1];

            header("Location: ./index.php");
            exit();
        } else {
            $error_message = "Błędny email lub hasło!";
        }
    }
?>