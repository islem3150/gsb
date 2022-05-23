<!DOCTYPE html>
<html lang="fr">
    <?php
    include "include/header.php";
    ?>  
    <body>
    <div class="container">

            <div class="h2 mt-2 mb-5">
                Consultation des médicaments
            </div>
            <form name="formListeRecherche" method="post" action="recupMedic.php" class="mt-5 text-center mb-5">
                    <label class="titre" >Liste des Médicaments </label>
					<?php
						include 'ConnexionBDD.php';
						$sql = "SELECT * FROM medicament";
						$resultat = $connexion->query($sql) or die("Erreur");
						$ligne = $resultat->fetch(); 
						echo "<select  name='MEDIC_NOM' class='zone'>";
						while($ligne != false)
						{
							echo "<option value=$ligne[0]>".$ligne[1];
							$ligne = $resultat->fetch() ;
						}
						echo "</select>";
						?>
					</select>
                    <div class="form-group mt-4">
                    <input method="POST" type="text" id="MEDIC_NOM" class="form-control" placeholder="Nom du Médicament" value=""/>
                    </div>
                    <div class="form-group">
                        <input class="btn btn-secondary mr-2" type="reset" style="width:20%;" value="Annuler" name="Annuler"></input>
                        <input name="btnSubmit" class="btn btn-primary" style="width:20%; border-radius: 0.5rem;" value="Rechercher" onClick="rechercheCR()" />
                    </div>
                    </form>



            <div id="retourAjax"></div>


            </div>

    </div>
	</body>
    
</hmtl>

<script>
    

    function rechercheCR(){
        console.log(document.getElementById("MEDIC_NOM").value);
        $.ajax({    

                    url:'recupMedic.php',
                    type:'POST',
                    dataType : "text",
                    data: {
                        MEDIC_NOM: document.getElementById("MEDIC_NOM").value,
                    },
                    success:function(reponse){      
                        // afficher resultat
                        $('#retourAjax').html(reponse);                        
                    }
                });
    }

</script>