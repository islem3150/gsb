<!DOCTYPE html>
<html lang="fr">
    <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="author" groupe11="">

    <title>GSB Accueil</title>

    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
    <script src="https://kit.fontawesome.com/49940b8feb.js" crossorigin="anonymous"></script>
    <link href="style1.css" rel="stylesheet">
    </head>  
    <div class="wrapper">
        <h1>Bonjour !</h1>
        

        <section class="login-container">
            <div>
                <header>
                <div class="container justify-content-center">        
                    <div class="text-center" style="font-size : 26px;"><img src="Logogsb.png" class="img-fluid mr-2 bg-white rounded-circle" alt="Responsive image" width="20%;"></div>
            </div>
                    <h2>Connectez-Vous</h2>
                </header>

                <form action="login.php" method="post">
                  
                    <input method="POST" type="text" name="txtid" class="form-control" placeholder="Identifiant " value="" />
                    <input method="POST" type="password" name="txtmdp" class="form-control" placeholder="Mot de passe" value="" />
                    <input type="submit" name="btnSubmit"  value="Connexion"></input>

                </form>
            </div>
        </section>

    </div> 
    </body>
    <footer class="footer">
    </footer>
</html>

