<?php
require_once '../Model/DTO/UsuarioDTO.php';
require_once '../Model/DAO/UsuarioDAO.php';

//pegando os dados do formulario
$nomeUsu = strip_tags($_POST["nomeUsu"]);
$sobrenomeUsu = strip_tags($_POST["sobrenomeUsu"]);
$emailUsu = strip_tags($_POST["emailUsu"]);
$telefoneUsu = strip_tags($_POST["telefoneUsu"]);
$senhaUsu = MD5($_POST["senhaUsu"]);
$confirmarSenhaUsu = MD5($_POST["confirmarSenhaUsu"]);
$perfilUsu = strip_tags($_POST["perfilUsu"]);
$situacaoUsu = strip_tags($_POST["situacaoUsu"]);

// Verificando se as senhas coincidem
if ($senhaUsu != $confirmarSenhaUsu) {
    $msg = "As senhas não coincidem";
    echo $msg;
    exit; // Parar a execução caso as senhas não coincidam
}

//criar objetos DTO com os dados do formulario
$usuarioDTO = new UsuarioDTO();
$usuarioDTO->setNomeUsu($nomeUsu);
$usuarioDTO->setSobrenomeUsu($sobrenomeUsu);
$usuarioDTO->setEmailUsu($emailUsu);
$usuarioDTO->settelefoneUsu($telefoneUsu);
$usuarioDTO->setSenhaUsu($senhaUsu);
$usuarioDTO->setPerfilUsu($perfilUsu);
$usuarioDTO->setSituacaoUsu($situacaoUsu);

//criar o objeto DAO que receberá o objeto DTO para gravar no banco
$usuarioDAO = new UsuarioDAO();
$sucesso = $usuarioDAO->salvarUsuario($usuarioDTO);

if ($sucesso) {
    $msg = "Cadastro realizado";
} else {
    $msg = "Cadastro não realizado";
}
echo "{$msg}";
?>
