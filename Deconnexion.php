<?php
// On supprime la session en cours
session_start();
session_destroy();
header('Location:Connexion.php'); // On redirige vers l'accueil
?>