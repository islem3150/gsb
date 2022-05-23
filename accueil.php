<!DOCTYPE html>
<html lang="fr">
    <?php
    include "include/header.php";
    ?>  
    <body>
        <div class="container">
            <div class="row col justify-content-center">
                <div class="row col justify-content-center">
                    <div class="col-12 card-1 p-5 mt-8 row">
                        <div class="ml-5 col-6 ">
                            <i class="fas fa-newspaper mb-3" style="background-color:skyblue; 60px;"></i>
                            <h3 class="h2 bolder tDark">Comptes-Rendus</h3>
                            <hr>
                            <p class="fs20 tDark mt-3 mb-4">La partie comptes-rendus permet de créé est consulté les différents comptes-rendus</p>
                            <a class="fs20" href="NewCR.php">Nouveau Compte-Rendu</a>
                            <br>
                            <a class="fs20 mt-2" href="ConsultCR.php">Consulter des Comptes-Rendus</a>
                        </div>
                        <div class="ml-5 col-5">
                            <i class="fas fa-book-open mb-3" style="font-size: 60px;"></i>
                                <h3 class="h2 bolder tDark">Consultation</h3>
                                <hr>
                                <p class="fs20 tDark mt-3 mb-4">La partie consultation permet de consulter les différent medicament practiciens et autre visiteurs</p>
                                <a class="fs20" href="ConsultMedic.php"><i class="fsCircle fas fa-circle"></i>  Consulter les medicament</a>
                                <br>
                                <a class="fs20 mt-5" href="ConsultPracticiens.php"><i class="fsCircle fas fa-circle"></i>   Consulter les practiciens</a>
                                </br>
                                <a class="fs20 mt-2 pointer" href="ConsultAutreVisiteur.php"><i class=" fsCircle fas fa-circle"></i>   Consulter les autre visiteurs</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
    
</html>