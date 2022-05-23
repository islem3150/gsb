<?php
    include "ConnexionBDD.php";
    session_start();

    if (isset($_POST['MEDIC_NOM'])) $medic=$_POST['MEDIC_NOM'];
    $sql = "SELECT * FROM medicament WHERE medNomcommercial = '".$medic."'";
    $resultat = $connexion->query($sql) or die("Erreur");
    $res= $resultat->fetch();

    print("
    <table class=\"table\">
    <thead>
        <tr>
        <th>Dépot légal</th>
        <th>Nom</th>
        <th>Composition</th>
        <th>Effets</th>
        <th>Contre indication</th>
        </tr>
    </thead>
    <tbody>
        <tr>
        <th>".$res["medDepotlegal"]."</th>
        <th>".$res["medNomcommercial"]."</th>
        <th>".$res["medComposition"]."</th>
        <th>".$res["medEffets"]."</th>
        <th>".$res["medContreindic"]."</th>
        </tr>
    </tbody>
    </table>
    ");

?>