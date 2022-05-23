<?php
include "ConnexionBDD.php";
session_start();

$vismatricule=$_SESSION["matricule"];


if (isset($_POST['ID_CR'])) $id_cr=$_POST['ID_CR'];
$sql = "SELECT * FROM rapportVisite WHERE id = '".$id_cr."'";
$resultat = $connexion->query($sql) or die("Erreur");
$res= $resultat->fetch();



$req = "SELECT visNom,visPrenom FROM visiteur WHERE visMatricule = '".$vismatricule."'";
$result = $connexion->query($req);// or die("Erreur");
$ligne= $result->fetch();
$visiteurNom= $ligne["visNom"];
$visiteurPrenom = $ligne["visPrenom"];

$reqsql = "SELECT praNom,praPrenom FROM praticien INNER JOIN rapportvisite ON praticien.praNum = rapportvisite.praNum WHERE id='".$id_cr."'";
$result = $connexion->query($reqsql);// or die("Erreur");
$line= $result->fetch();
$praticienNom= $line["praNom"];
$praticienPrenom = $line["praPrenom"];

//if la variable remplacant est pleine print le remplacant else print le reste faire deux colonne un bool et le nom du remplacant
/*$rp = 0;
if($remplacant=="")
{
    $rp=1;
}
else{
    $rp=2;
}
if($rp=1)
{
    print("
    <table class=\"table\">
    <thead>
        <tr>
        <th>ID</th>
        <th>Visiteur</th>
        <th>Numéro</th>
        <th>Praticien</th>
        <th>Date Rapport</th>
        <th>Date Visite</th>
        <th>Bilan</th>
        <th>Motif</th>
        <th>Coefficient de Satisfaction</th>
        <th>Produit 1</th>
        <th>Produit 2</th>
        </tr>
    </thead>
    <tbody>
        <tr>
        <th>".$res["id"]."</th>
        <th>".$visiteurNom."</br>".$visiteurPrenom."</th>
        <th>".$res["rapNum"]."</th>
        <th>".$praticienNom."</br>".$praticienPrenom."</th>
        <th>".$res["dateAuj"]."</th>
        <th>".$res["rapDate"]."</th>
        <th>".$res["rapBilan"]."</th>
        <th>".$res["rapMotif"]."</th>
        <th>".$res["coeff"]."/5</th>
        <th>".$res["produit1"]."</th>
        <th>".$res["produit2"]."</th>
        </tr>
    </tbody>
    </table>
    ");  
}
else{*/
    print("
    <table class=\"table\">
    <thead>
        <tr>
        <th>ID</th>
        <th>Visiteur</th>
        <th>Numéro</th>
        <th>Praticien</th>
        <th>Date Rapport</th>
        <th>Date Visite</th>
        <th>Bilan</th>
        <th>Motif</th>
        <th>Coefficient de Satisfaction</th>
        <th>Remplacant</th>
        <th>Produit 1</th>
        <th>Produit 2</th>
        </tr>
    </thead>
    <tbody>
        <tr>
        <th>".$res["id"]."</th>
        <th>".$visiteurNom."</br>".$visiteurPrenom."</th>
        <th>".$res["rapNum"]."</th>
        <th>".$praticienNom."</br>".$praticienPrenom."</th>
        <th>".$res["dateAuj"]."</th>
        <th>".$res["rapDate"]."</th>
        <th>".$res["rapBilan"]."</th>
        <th>".$res["rapMotif"]."</th>
        <th>".$res["coeff"]."/5</th>
        <th>".$res["remplacant"]."</th>
        <th>".$res["produit1"]."</th>
        <th>".$res["produit2"]."</th>
        </tr>
    </tbody>
    </table>
    "); 

?>
