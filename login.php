<?php
	ob_start();
	// Appel du script de connexion au serveur et à la base de données
	require("ConnexionBDD.php"); 

	// On récupère les données saisies dans le formulaire
	$nomSaisi = "";
	$motPasseSaisi = "";
	if(isset($_POST["txtid"])) $nomSaisi = $_POST["txtid"];
	if(isset($_POST["txtmdp"])) $motPasseSaisi = $_POST["txtmdp"];	

	$bErr = false;
	if($motPasseSaisi == ""){
		$bErr = true;
	}

	// On récupère dans la base de données le mot de passe qui correspond au nom saisi par le visiteur
	$sql = "SELECT visMatricule,visNom FROM visiteur WHERE '".$nomSaisi."' = visNom";
	$result =  $connexion->query($sql) ;//or die("Erreur");
	$ligne = $result->fetch();
	$motPasseBdd = $ligne["visMatricule"];

	// On vérifie que le mot de passe saisi est identique à celui enregistré dans la base de données
	if  ($motPasseSaisi!=$motPasseBdd || $bErr)
	// Le mot de passe est différent de celui de la base utilisateur
	{
		echo "Votre saisie est erronée, Recommencez SVP..."; 

		// On inclut le formulaire d'identification (index.html)
		include("connexion.php");

		// On quitte le script courant sans effectuer les éventuelles instructions qui suivent
		exit; 
	}
	else if($motPasseSaisi==$motPasseBdd)
	// Le mot de passe saisi correspond à celui de la base utilisateur
	{
		//On stocke le nom et le prénom de l'utilisateur
		session_start();
		$_SESSION["nom"]=$ligne["visNom"];
		$_SESSION["matricule"]=$ligne["visMatricule"];
		// Retour vers la page d'entrée du site
		//require("accueil.php");
		header('Location:accueil.php'); // On redirige vers l'accueil
		ob_end_flush();
		// On quitte le script courant sans effectuer les éventuelles  instructions qui suivent
		exit;
	}
	
	//on libère le jeu d'enregistrement
	//.......................................
	// on ferme la connexion au SGBD
	$connexion = null;

?>





