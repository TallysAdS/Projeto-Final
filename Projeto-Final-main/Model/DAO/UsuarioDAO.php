<?php
//conexao com o banco
include 'Conexao.php';
require_once '../Model/DTO/UsuarioDTO.php';

class UsuarioDAO
{
    public $pdo = null;

    public function __construct()
    {
        $this->pdo = Conexao::getInstance();
    }
    
    //metodo inserir
    public function salvarUsuario(UsuarioDTO $usuarioDTO)
    {
        try {
            $sql = "INSERT INTO usuario (nomeUsu, sobrenomeUsu, emailUsu, telefoneUsu, senhaUsu, perfilUsu, situacaoUsu)
            VALUES
            (?, ?, ?, ?, ?, ?, ?)";
            $stmt = $this->pdo->prepare($sql);
            
            $nomeUsu = $usuarioDTO->getNomeUsu();
            $sobrenomeUsu = $usuarioDTO->getSobrenomeUsu();
            $emailUsu = $usuarioDTO->getEmailUsu();
            $telefoneUsu = $usuarioDTO->gettelefoneUsu();
            $senhaUsu = $usuarioDTO->getSenhaUsu();
            $perfilUsu = $usuarioDTO->getPerfilUsu();
            $situacaoUsu = $usuarioDTO->getSituacaoUsu();
           
            
            $stmt->bindValue(1, $nomeUsu);
            $stmt->bindValue(2, $sobrenomeUsu);
            $stmt->bindValue(3, $emailUsu);
            $stmt->bindValue(4, $telefoneUsu);
            $stmt->bindValue(5, $senhaUsu);
            $stmt->bindValue(6, $perfilUsu);
            $stmt->bindValue(7, $situacaoUsu);
          
            
            $retorno = $stmt->execute();
            return $retorno;
        } catch (PDOException $exc) {
            echo $exc->getMessage();
        }
    }
}
?>
