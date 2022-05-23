<?php
    include "ConnexionBDD.php";
    session_start();


    if (isset($_POST['VIS_NOM'])) $visnom=$_POST['VIS_NOM'];
    $sql = "SELECT * FROM visiteur WHERE visNom = '".$visnom."'";
    $resultat = $connexion->query($sql) or die("Erreur");
    $res= $resultat->fetch();


    print("
    <table class=\"table\">
    <thead>
        <tr>
        <th>Nom</th>
        <th>Prénom</th>
        <th>Adresse</th>
        <th>Ville</th>
        </tr>
    </thead>
    <tbody>
        <tr>
        <th>".$res["visNom"]."</th>
        <th>".$res["visPrenom"]."</th>
        <th>".$res["visAdresse"]."</th>
        <th>".$res["visVille"]."</th>
        </tr>
    </tbody>
    </table>
    ");

?>