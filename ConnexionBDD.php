<?php
$host="localhost";
$login="root";
$password="";
$nomBD="gsb-cr";

try
{
    $connexion = new PDO("mysql:host=$host;dbname=$nomBD", $login, $password );
} 
catch (Exception $e) 
{
    die("\nConnection à $hote impossible".$e->getMessage());
}

?>
