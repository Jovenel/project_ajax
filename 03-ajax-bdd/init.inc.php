<?php

$host = 'mysql:host=localhost;dbname=localisation';
$login = 'root';
$password = '';
$options = array(
    PDO::ATTR_ERRMODE => PDO::ERRMODE_WARNING, // gestion des erreurs
    PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8' // pour forcer l'utf-8
);

// on crée notre objet :
$pdo = new PDO($host, $login, $password, $options);