<?php
// print_r($_POST);
// json_encode() permet de tranformer un tableau array en format json
// json_decode() permet de transformer un format json en tableau array ou objet

// tableau array qui contiendra la réponse à envoyer à JS
$tab = array();
$tab['reponse'] = '';

// on vérifie $_POST
if(isset($_POST['id_employes'])) {
    $id_employes = $_POST['id_employes'];

    // on récupère le contenu du fichier.json
    $fichier = file_get_contents('fichier.json'); 

    // on transforme en tableau array
    $fichier = json_decode($fichier, true); // le deuxième argument (true) permet d'obtenir un tableau array, si on met false ou rien (cas par defaut) on obtient un objet

    // echo '<pre>'; print_r($fichier); echo '</pre>';

    // on parcours le tableau array multidimensionnel pour chercher l'id récupéré
    foreach($fichier AS $indice => $valeur) {
        if($id_employes == $valeur['idEmploye']) {
            $tab['reponse'] = '<table class="table table_bordered">
                                    <thead class="bg-primary text-white">
                                        <tr>
                                            <th>Id employés</th>
                                            <th>Prénom</th>
                                            <th>Nom</th>
                                            <th>Sexe</th>
                                            <th>Service</th>
                                            <th>Date embauche</th>
                                            <th>Salaire</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr class="text-white">
                                            <td>' . $valeur['idEmploye'] . '</td>
                                            <td>' . $valeur['prenom'] . '</td>
                                            <td>' . $valeur['nom'] . '</td>
                                            <td>' . $valeur['sexe'] . '</td>
                                            <td>' . $valeur['service'] . '</td>
                                            <td>' . $valeur['dateEmbauche'] . '</td>
                                            <td>' . $valeur['salaire'] . '</td>
                                        </tr></tbody></table>';
        }
    }

}
echo json_encode($tab);