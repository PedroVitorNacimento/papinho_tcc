<?php
// conexão.php

$dsn = 'mysql:dbname=papinho;host=localhost';
$user = 'root';
$password = 'Marquinhos2603';
try {
    // Tenta estabelecer a conexão
    $conexao = new PDO($dsn, $user, $password);

    // Configura o PDO para lançar exceções em caso de erro
    $conexao->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // Mensagem opcional para testar se a conexão está funcionando
    // echo "Conexão bem-sucedida!";
} catch (PDOException $e) {
    // Trata erros de conexão
    die("Erro de conexão: " . $e->getMessage());
}
