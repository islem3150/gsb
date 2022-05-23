<?php
    include "ConnexionBDD.php";
    session_start();

    if (isset($_POST['PRA_NOM'])) $pra=$_POST['PRA_NOM'];
    $sql = "SELECT * FROM praticien WHERE praNom = '".$pra."'";
    $resultat = $connexion->query($sql) or die("Erreur");
    $res= $resultat->fetch();

    $sql ="SELECT * FROM typepraticien INNER JOIN praticien ON typepraticien.typCode = praticien.typCode WHERE praNom='".$pra."'";
    $resultat = $connexion->query($sql);//or die("Erreur");
    $type =$resultat->fetch();

    print("
    <table class=\"table\">
    <thead>
        <tr>
        <th>Numéro</th>
        <th>Nom</th>
        <th>Prénom</th>
        <th>Adresse</th>
        <th>Ville</th>
        <th>Type Praticien</th>
        <th>Lieu de Travail</th>
        </tr>
    </thead>
    <tbody>
        <tr>
        <th>".$res["praNum"]."</th>
        <th>".$res["praNom"]."</th>
        <th>".$res["praPrenom"]."</th>
        <th>".$res["praAdresse"]."</th>
        <th>".$res["praVille"]."</th>
        <th>".$type["typLibelle"]."</th>
        <th>".$type["typLieu"]."</th>
        </tr>
    </tbody>
    </table>
    ");

?>