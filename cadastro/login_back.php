<?php
require_once('./conexao_banco');

echo 123;

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Captura os dados enviados
    $username = $_POST['username'];
    $email = $_POST['email'];
    $password = $_POST['password'];


    if ($conn->connect_error) {
        die("Falha na conexão: " . $conn->connect_error);
    }

    $sql = "INSERT INTO responsavel (nome_responsavel , email, senha) VALUES ('$username', '$email', '$password')";

    if ($conn->query($sql) === TRUE) {
        echo "Cadastro realizado com sucesso!";
    } else {
        echo "Erro: " . $sql . "<br>" . $conn->error;
    }

    $conn->close();
}
?>

?>