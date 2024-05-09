<?php
require_once '../Model/DTO/UsuarioDTO.php';
require_once '../Model/DAO/UsuarioDAO.php';

// Verifica se o formulário foi submetido
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Verifica se os campos foram preenchidos
    if (isset($_POST["emailUsu"]) && isset($_POST["senhaUsu"])) {
        // Recupera o email e a senha do formulário
        $emailUsu = $_POST["emailUsu"];
        $senhaUsu = $_POST["senhaUsu"];

        // Cria um objeto DAO e verifica as credenciais de login
        $usuarioDAO = new UsuarioDAO();
        $usuario = $usuarioDTO->loginUsu($emailUsu, $senhaUsu);

        if ($usuario) {
            // Login bem-sucedido, redireciona para a página de perfil do usuário
            header("Location: ../index.php");
            exit();
        } else {
            $msg = "Email ou senha inválidos. Tente novamente.";
        }
    } else {
        $msg = "Por favor, preencha todos os campos.";
    }
} else {
    // Redireciona para a página de login se o formulário não foi submetido via POST
    header("Location: ../View/loginUsu.php");
    exit();
}

echo $msg;
?>
