<?php
    session_start();
?>

<!doctype html>
<html lang="pl">

<head>
    <meta charset="UTF-8">
    <title>GSP</title>
    <link href="styl.css" rel="stylesheet">
</head>

<body>      
    <div id="container">
        <div id="logo">
            <a href="index.php"></a>
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
        <div class="pr1">
            <div class="ob1"><img src="man.jpg" id="man-jpg"></div>
            <a href="mandarynka.html">mandarynka cena za kg: 42,00PLN</a>
        </div>
        <div class="pr2">
            <div class="ob1"><img src="man.jpg" id="man-jpg"></div>
            <a href="mandarynka.html">mandarynka cena za kg: 42,00PLN</a>
        </div>
        <div class="pr3">
            <div class="ob1"><img src="man.jpg" id="man-jpg"></div>
            <a href="mandarynka.html">mandarynka cena za kg: 42,00PLN</a>
        </div>
        <div class="pr4">
            <div class="ob1"><img src="man.jpg" id="man-jpg"></div>
            <a href="mandarynka.html">mandarynka cena za kg: 42,00PLN</a>
        </div>

    </main>






</body>

</html>
