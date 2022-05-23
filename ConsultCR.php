<!DOCTYPE html>
<html lang="fr">
    <?php
    include "include/header.php";
    ?>  
    <body>
    <div class="container">

        <div class="h2 mt-2 mb-5">
            Consultation d'un compte rendu
        </div>

        <div class="form-group mt-4">
            <input method="POST" type="text" id="ID_CR" class="form-control" placeholder="ID" value=""/>
        </div>
        <div class="form-group">
            <input name="btnSubmit" class="btn btn-primary" style="width:20%; border-radius: 0.5rem;" value="Rechercher"  onClick="rechercheCR()" />
        </div>

     

        <div id="retourAjax"></div>


        
    </div>
    </body>
    
</hmtl>

<script>
    

    function rechercheCR(){
        console.log(document.getElementById("ID_CR").value);
        $.ajax({    

                    url:'RechercheCR.php',
                    type:'POST',
                    dataType : "text",
                    data: {
                        ID_CR: document.getElementById("ID_CR").value,
                    },
                    success:function(reponse){      
                        // afficher resultat
                        $('#retourAjax').html(reponse);                        
                    }
                });
    }

</script>