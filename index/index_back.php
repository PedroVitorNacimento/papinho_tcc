<?php
session_start();
// Inclui o arquivo de conexão com o banco de dados
require_once('./conexao_banco/conexao_banco.php');

// Verifica se a requisição foi feita via método POST
if ($_SERVER["REQUEST_METHOD"] == "POST") {

    // Captura os dados enviados pelo formulário
    $email = $_POST["email"];
    $senha = $_POST["senha"];
    // Verifica se algum dos campos está vazio
    if (empty($email) || empty($senha)) {
        echo "Preencha todos os Campos!";
        exit; // Encerra a execução do script
    }

    // Monta a consulta SQL para buscar um usuário com o e-mail e senha informados
    // ATENÇÃO: Esta forma de interpolação de variáveis é INSEGURA e pode permitir SQL Injection!
    $query = "SELECT * FROM responsavel WHERE email = '{$email}' AND senha = '{$senha}';";
    print_r([$query]);
    exit;
    // Executa a consulta no banco de dados
    $recurso_banco = $db->query($query);

    // Obtém o resultado da consulta como um array associativo
    $usuario = $recurso_banco->fetch(PDO::FETCH_ASSOC);

    // Verifica se nenhum usuário foi encontrado (ou seja, login inválido)
    if (!isset($usuario['id'])) {
        // Redireciona para a página inicial com um parâmetro indicando erro na senha
        header("LOCATION:index.html?senha-incorreta");
        exit; // Encerra a execução do script para evitar processamento desnecessário
    }

    // Inicia uma sessão para armazenar os dados do usuário autenticado
    session_start();
    $_SESSION['usuario_id'] = $usuario['id']; // Armazena o ID do usuário na sessão
    $_SESSION['usuario_nome'] = $usuario['nome']; // Armazena o nome do usuário na sessão

    // Redireciona para a página inicial do menu após login bem-sucedido
    header("LOCATION:./menu/menu_inicial.html");
}
