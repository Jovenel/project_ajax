<?php
include 'init.inc.php';

$tab = array();
$tab['liste_pays'] = '';
$tab['liste_ville'] = '';

// on récupère la liste des pays liés au continent
if (isset($_POST['champ']) && $_POST['champ'] == 'continent' && !empty($_POST['id'])) {
    $recup_pays = $pdo->prepare("SELECT * FROM pays WHERE continent_id = :continent_id");
    $recup_pays->bindParam(':continent_id', $_POST['id'], PDO::PARAM_STR);
    $recup_pays->execute();


    $tab['liste_pays'] .= '<option disabled selected>Choisissez un pays</option>';

    while ($pays = $recup_pays->fetch(PDO::FETCH_ASSOC)) {
        $tab['liste_pays'] .= '<option value="' . $pays['id_pays'] . '">' . $pays['nom_pays'] . '</option>';
    }
}


// on récupère la liste des villes liées au pays

if (isset($_POST['champ']) && $_POST['champ'] == 'ville' && !empty($_POST['id'])) {
    $recup_ville = $pdo->prepare("SELECT * FROM ville WHERE pays_id = :pays_id");
    $recup_ville->bindParam(':pays_id', $_POST['id'], PDO::PARAM_STR);
    $recup_ville->execute();

    $tab['liste_ville'] .= '<option disabled selected>Choisissez une ville </option>';

    while ($ville = $recup_ville->fetch(PDO::FETCH_ASSOC)) {
        $tab['liste_ville'] .= '<option value="' . $ville['id_ville'] . '">' . $ville['nom_ville'] . '</option>';
    }

}

echo json_encode($tab);
