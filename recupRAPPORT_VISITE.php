<?php
	//*** On inclut le fichier qui permet l'accès au serveur et à la base Gdi
    session_start();
	include "ConnexionBDD.php";
    

// A COMPLETER
    //*** On inclut le fichier contenant les fonctions
    // include "inc_GestionErreur.php";
// FIN A COMPLETER

   //==============================
   // Initialisation des variables
   //==============================
   $rapnum=""; 
   $rapdatevisite="";
   $pranum="";
   $pracoeff="";
   $rapdate="";
   $rapbilan="";
   $rapmotif="";
   $vismatricule="";
   $prod1="";
   $prod2="";
   $remplacant="";
   $pranombre="";
   $vismatricule=$_SESSION["matricule"];//On récupere la variable de session
   $id="";


   //---------------------------------------------------------------------
   // Récupère dans des variables, les valeurs saisies dans le formulaire
   //---------------------------------------------------------------------
	if (isset($_POST['RAP_NUM'])) $rapnum=$_POST['RAP_NUM'];
	if (isset($_POST['RAP_DATEVISITE']))$rapdatevisite=$_POST['RAP_DATEVISITE'];
	if (isset($_POST['PRA_COEFF']))$pracoeff=$_POST['PRA_COEFF'];
    if (isset($_POST['RAP_MOTIF']))$rapmotif=$_POST['RAP_MOTIF'];
    if (isset($_POST['RAP_BILAN']))$rapbilan=$_POST['RAP_BILAN'];
    if (isset($_POST['PRA_NUM']))$pranum=$_POST['PRA_NUM'];
    if (isset($_POST['PROD1']))$prod1=$_POST['PROD1'];
    if (isset($_POST['PROD2']))$prod2=$_POST['PROD2'];
    if (isset($_POST['PRA_REMPLACANT']))$remplacant=$_POST['PRA_REMPLACANT'];
    
    // Récupere le Nom du praticien par rapport à son numéro
    $sql = "SELECT  praNum FROM praticien WHERE $pranum = praNum";
    $resultat = $connexion->query($sql) or die("Erreur");
	$pranombre= $resultat->fetch();
    $pranombre= $pranombre["praNum"];
    
    if($pranombre !="") $_SESSION["pranom"]=$pranombre;
    if($remplacant !="") $_SESSION["remplacant"]=$remplacant;
    //******************************************
    //**** Mise à jour de la base de données ***
    //******************************************
    // caractère d'échappement devant les apostrophes contenues dans la description
    

    // détermine la date du jour au format Mysql (aaaa-mm-jj)
    $djour=date("Y-m-d");

    // mise en forme de la requête
    $requete="insert into rapportvisite(visMatricule,rapNum,praNum,rapDate,rapBilan,rapMotif,coeff,produit1,produit2,dateAuj,remplacant)";
    $requete.="value('$vismatricule','$rapnum','$pranombre','$rapdatevisite','$rapbilan','$rapmotif','$pracoeff','$prod1','$prod2','$djour','$remplacant')";

    // exécution de la requête.
    $rep=$connexion->exec($requete) or die ( "Erreur dans la requête '$requete'.</br>".$connexion->errorInfo());
    $info="Votre demande est crée. Elle porte le numéro ".$connexion->lastInsertId(); 
    
    //echo "<div class='msgErreur'>".$info."</div>";

    header('Location:NewCR.php?bValid=1&lastId='.$connexion->lastInsertId());  //On renvoi en GET les indications de la création
 ?> 