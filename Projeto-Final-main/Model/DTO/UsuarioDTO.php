<?php
class UsuarioDTO{
    private $idUsu;
    private $nomeUsu;
    private $sobrenomeUsu;
    private $emailUsu;
    private $telefoneUsu;
    private $senhaUsu;
    private $perfilUsu;
    private $situacaoUsu;

    
  public function setIdUsu($idUsu){
    $this->idUsu = $idUsu;
}

public function getIdUsu(){
    return $this->idUsu;
}
    public function setNomeUsu($nomeUsu){
        $this->nomeUsu = $nomeUsu;
    }
    
    public function getNomeUsu(){
        return $this->nomeUsu;
    }
    
    public function setSobrenomeUsu($sobrenomeUsu){
        $this->sobrenomeUsu = $sobrenomeUsu;
    }
    
    public function getSobrenomeUsu(){
        return $this->sobrenomeUsu;
    }
    
    public function setEmailUsu($emailUsu){
        $this->emailUsu = $emailUsu;
    }
    
    public function getEmailUsu(){
        return $this->emailUsu;
    }
    
    public function settelefoneUsu($telefoneUsu){
        $this->telefoneUsu = $telefoneUsu;
    }
    
    public function gettelefoneUsu(){
        return $this->telefoneUsu;
    }
    
    public function setSenhaUsu($senhaUsu){
        $this->senhaUsu = $senhaUsu;
    }
    
    public function getSenhaUsu(){
        return $this->senhaUsu;
    }
    public function setPerfilUsu($perfilUsu){
        $this->perfilUsu = $perfilUsu;
    }
    
    public function getPerfilUsu(){
        return $this->perfilUsu;
    }
    public function setSituacaoUsu($situacaoUsu){
        $this->situacaoUsu = $situacaoUsu;
    }
    
    public function getSituacaoUsu(){
        return $this->situacaoUsu;
    }
}
?>
