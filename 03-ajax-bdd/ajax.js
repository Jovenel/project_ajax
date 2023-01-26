let xhttp;
// instanciation de l'objet ajax
if (window.XMLHttpRequest) {
    xhttp = new XMLHttpRequest(); // pour les navigateurs récents
} else {
    xhttp = new ActiveXObject("Microsoft.XMLHTTP"); // pour internet explorer < 9
}

//------------------------------------------------------
// APPEL AJAX LORS DU CHANGEMENT DE VALEUR SUR CONTINENT
//------------------------------------------------------
document.querySelector('#continent').addEventListener('change', function () {
    let valeur = this.value;
    let cible = 'ajax.php';

    let param = 'champ=continent&id=' + valeur;
    console.log(param);

    xhttp.open('post', cible);
    xhttp.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');

    xhttp.onreadystatechange = function () {
        if(xhttp.status == 200 && xhttp.readyState == 4) {
            console.log(xhttp.responseText);
            let reponse = JSON.parse(xhttp.responseText);
            document.querySelector('#pays').innerHTML = reponse.liste_pays;
        }
    }
    xhttp.send(param);    
});   

document.querySelector('#pays').addEventListener('change', function () {
    let values = this.value;
    let target = 'ajax.php';

    let setting = 'champ=ville&id=' + values;
    console.log(setting);

    xhttp.open('post', target);
    xhttp.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');

    xhttp.onreadystatechange = function () {
        if(xhttp.status == 200 && xhttp.readyState == 4) {
            console.log(xhttp.responseText);
            let reponse = JSON.parse(xhttp.responseText);
            document.querySelector('#ville').innerHTML = reponse.liste_ville;
        }
    }
    xhttp.send(setting);    
});  

//------------------------------------------------------
// APPEL AJAX SUR L'API DE RANDOM USER
//------------------------------------------------------

window.onload=function(){
    let url = 'https://randomuser.me/api/';
    xhttp.open('get',url);
    xhttp.onreadystatechange = function () {
        if(xhttp.status == 200 && xhttp.readyState == 4) {
            let reponse = JSON.parse(xhttp.responseText);
            console.log(reponse);
            document.querySelector('#image').src=reponse.results[0].picture.large;
        }
    }
    xhttp.send();
    
}