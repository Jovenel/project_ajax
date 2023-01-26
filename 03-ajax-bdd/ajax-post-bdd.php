<?php
include 'init.inc.php';

$liste_continents = $pdo->query("SELECT * FROM continent ORDER BY nom_continent");

?>
<!doctype html>
<html lang="fr">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <title>Localisation</title>
</head>

<body>
    <div class="container-fluid">
        <h1 class="p-5 bg-dark text-white text-center">Localisation <img src="" id="image" class="igm-thumbnail rounded-circle"> </h1>
    </div>

    <div class="container">
        <div class="row">
            <div class="col-12 mt-5">
                <form method="post" action="">
                    <div class="row">
                        <div class="col-sm-4">
                            <label>Continent</label>
                            <select name="continent" id="continent" class="form-select">
                                <option disabled selected>Choisissez un continent</option>
                                <?php
                                while ($continent = $liste_continents->fetch(PDO::FETCH_ASSOC)) {
                                    echo '<option value="' . $continent['id_continent'] . '">' . $continent['nom_continent'] . '</option>';
                                }
                                ?>
                            </select>
                        </div>
                        <div class="col-sm-4">
                            <label>Pays</label>
                            <select name="pays" id="pays" class="form-select">
                                <option disabled selected>Merci de choisir un continent</option>
                            </select>
                        </div>
                        <div class="col-sm-4">
                            <label>Ville</label>
                            <select name="ville" id="ville" class="form-select">
                                <option disabled selected>Merci de choisir un pays</option>
                            </select>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>



    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <script src="ajax.js"></script>
</body>

</html>