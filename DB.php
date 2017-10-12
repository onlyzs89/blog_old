<?php
function getDB() {
  $pdo=new PDO('mysql:host=localhost;dbname=blog;charset=utf8','guest','guest');
  return $pdo;
}
?>