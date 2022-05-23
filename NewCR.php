<!DOCTYPE html>
<html lang="fr">
    <?php
    include "include/header.php";

	$bValid = 0;
	$lastId = 0;
	if(isset($_GET["bValid"]))$bValid = $_GET["bValid"];
	if(isset($_GET["lastId"]))$lastId = $_GET["lastId"];
	
	if($lastId != 0 && $bValid == 1){
		?>
			<div class="alert alert-success alert-dismissible fade show" role="alert">
				Votre demande est crée. Elle porte le numéro <?php echo $lastId ?>.
				<button type="button" class="close" data-dismiss="alert" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
		<?php
	}
    ?> 
	<style type="text/css">
		body {background-color: skyblue; color:5599EE; } 
		label.titre { width : 180 ;  clear:left; float:left; }  
		.zone { width : 30car ; float : left; color:5599EE }
		
	</style> 
    
	<body>
		<div  class="container">
			<div class="container justify-content-center row">
				<div style="font-size: 35px;" class="">
					<i class="fas fa-file-alt"></i>
				</div>
				<div class="col-10 text-center">	 
					<h1> Nouveau compte-rendu </h1>
				</div>
			</div>
			<form name="formRAPPORT_VISITE" method="post" action="recupRAPPORT_VISITE.php" onSubmit="return envoiVerif();">
				<div class="row justify-content-center mb-5">
					<div class="col-10 p-3 card-1 mt-3">
						<label class="titre" ><h3> Rapport de visite </h3></label>
						<label class="center titre">NUMERO *(obligatoire) :</label><input type="text" size="10" id="RAP_NUM" name="RAP_NUM" class="zone" />
						<label class="titre">DATE VISITE *(obligatoire) :</label><input type="date" id="RAP_DATEVISITE" name="RAP_DATEVISITE" class="zone" />
						<label class="titre">PRATICIEN :</label>
						<?php
						include 'ConnexionBDD.php';
						$sql = "SELECT * FROM praticien";
						$resultat = $connexion->query($sql) or die("Erreur");
						$ligne = $resultat->fetch(); 
						echo "<select  name='PRA_NUM' class='zone' >";
						while($ligne != false)
						{
							echo "<option value=$ligne[0]>".$ligne[1];
							$ligne = $resultat->fetch() ;
						}
						echo "</select>";
						?>
						<label class="titre">COEFFICIENT DE SATISFACTION :</label>
						<div class="radiobtn row ml-1">
							<div class="ml-1">
								<input type="radio" id="contactChoice1" name="PRA_COEFF" value="1" checked> 
								<p> 1</p>
							</div>
							<div class="ml-4">
								<input type="radio" id="contactChoice1" name="PRA_COEFF" value="2">
								<p> 2</p>
							</div>
							<div class="ml-4">
								<input type="radio" id="contactChoice1" name="PRA_COEFF" value="3">
								<p> 3</p>
							</div>
							<div class="ml-4">
								<input type="radio" id="contactChoice1" name="PRA_COEFF" value="4">
								<p> 4</p>
							</div>
							<div class="ml-4">
								<input type="radio" id="contactChoice1" name="PRA_COEFF" value="5">
								<p> 5</p>
							</div>
						</div>

						<label class="titre">REMPLACANT :</label><input type="checkbox" class="zone" onClick="selectionne(true,this.checked,'PRA_REMPLACANT');"/><input name="PRA_REMPLACANT" disabled="disabled" type="text" class="zone" ></input>
						<label class="titre">MOTIF :</label><select  name="RAP_MOTIF" class="zone" onClick="selectionne('Autre',this.value,'RAP_MOTIFAUTRE');">
														<option value="Périodicité">Périodicité</option>
														<option value="Actualisation">Actualisation</option>
														<option value="Relance">Relance</option>
														<option value="Sollicitation praticien">Sollicitation praticien</option>
														<option value="Autre">Autre</option>
													</select><input type="text" name="RAP_MOTIFAUTRE" class="zone" disabled="disabled" />
						<label class="titre">BILAN *(obligatoire) :</label><textarea rows="2" cols="50" id="RAP_BILAN" name="RAP_BILAN" class="zone" ></textarea>
						<label class="titre" ><h3> Eléments présentés </h3></label>
						<label class="titre" >PRODUIT 1 : </label>
						<?php
							include 'ConnexionBDD.php';
							$sql = "SELECT * FROM medicament";
							$resultat = $connexion->query($sql) or die("Erreur");
							$ligne = $resultat->fetch(); 
							echo "<select  name='PROD1' class='zone' >";
							while($ligne != false)
							{
								echo "<option value=$ligne[0]>".$ligne[1];
								$ligne = $resultat->fetch() ;
							}
							echo "</select>";
							?>
						</select>
						<label class="titre" >PRODUIT 2 : </label>
						<?php
							include 'ConnexionBDD.php';
							$sql = "SELECT * FROM medicament";
							$resultat = $connexion->query($sql) or die("Erreur");
							$ligne = $resultat->fetch(); 
							echo "<select  name='PROD2' class='zone' >";
							while($ligne != false)
							{
								echo "<option value=$ligne[0]>".$ligne[1];
								$ligne = $resultat->fetch() ;
							}
							echo "</select>";
							?>
						<label class="titre">DOCUMENTATION OFFERTE :</label><input name="RAP_DOC" type="checkbox" class="zone" checked="false" />
						<label class="titre"><h3>Echantillons</h3></label>
						<div class="titre" id="lignes">
						<label class="titre" >Produit : </label>
							<select name="PRA_ECH1" class="zone"><option>Produits</option></select><input type="text" name="PRA_QTE1" size="2" class="zone"/>
							<input type="button" id="but1" value="+" onclick="ajoutLigne(1);" class="zone" />			
						<label class="titre">SAISIE DEFINITIVE :</label><input name="RAP_LOCK" type="checkbox" class="zone" checked="false" />
						<label class="titre"></label>
					</div>
					</div>
				<div class="col-3"></div>
				<div class="col-12 text-center mt-3">
					<input class="btn btn-secondary mr-2" type="reset" value="Annuler" name="Annuler"></input>
					<input class="btn btn-primary" type="submit" name="Envoi"></input>
				</div>
					</div>
			
			</form>
		</div>
	</body>
	
</hmtl>

<script language="javascript">//permet de verifier les différents champs saisie afin de ne pas envoyer un formulaire incompler
function envoiVerif(){		
	var txtNum = document.getElementById("RAP_NUM").value;
	var date = document.getElementById("RAP_DATEVISITE").value;
	//var txtCoef = document.querySelector('input[type=radio][name=PRA_COEFF]:checked'); 	
	var txtBilan = document.getElementById("RAP_BILAN").value;
	//console.log(txtNum);
	if(txtNum==""||txtBilan =="" || date == ""){		
		alert("Merci de compléter le formulaire.")
		return false;
	}else{
		document.formRAPPORT_VISITE.submit();
	}

	//alert("sa a marcher");
}
</script>
<script language="javascript">
	function selectionne(pValeur, pSelection,  pObjet) {
		//active l'objet pObjet du formulaire si la valeur sélectionnée (pSelection) est égale é la valeur attendue (pValeur)
		if (pSelection==pValeur) 
			{ formRAPPORT_VISITE.elements[pObjet].disabled=false; }
		else { formRAPPORT_VISITE.elements[pObjet].disabled=true; }
	}
</script>
	<script language="javascript">
	function ajoutLigne( pNumero){//ajoute une ligne de produits/qté é la div "lignes"     
		//masque le bouton en cours
		document.getElementById("but"+pNumero).setAttribute("hidden","true");	
		pNumero++;										//incrémente le numéro de ligne
		var laDiv=document.getElementById("lignes");	//récupére l'objet DOM qui contient les données
		var titre = document.createElement("label") ;	//crée un label
		laDiv.appendChild(titre) ;						//l'ajoute é la DIV
		titre.setAttribute("class","titre") ;			//définit les propriétés
		titre.innerHTML= "   Produit : ";
		var liste = document.createElement("select");	//ajoute une liste pour proposer les produits
		laDiv.appendChild(liste) ;
		liste.setAttribute("name","PRA_ECH"+pNumero) ;
		liste.setAttribute("class","zone");
		//remplit la liste avec les valeurs de la premiére liste construite en PHP é partir de la base
		liste.innerHTML=formRAPPORT_VISITE.elements["PRA_ECH1"].innerHTML;
		var qte = document.createElement("input");
		laDiv.appendChild(qte);
		qte.setAttribute("name","PRA_QTE"+pNumero);
		qte.setAttribute("size","2"); 
		qte.setAttribute("class","zone");
		qte.setAttribute("type","text");
		var bouton = document.createElement("input");
		laDiv.appendChild(bouton);
		//ajoute une gestion évenementielle en faisant évoluer le numéro de la ligne
		bouton.setAttribute("onClick","ajoutLigne("+ pNumero +");");
		bouton.setAttribute("type","button");
		bouton.setAttribute("value","+");
		bouton.setAttribute("class","zone");	
		bouton.setAttribute("id","but"+ pNumero);				
		}
</script>