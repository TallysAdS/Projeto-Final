-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 09-Maio-2024 às 20:48
-- Versão do servidor: 10.4.24-MariaDB
-- versão do PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `mkm`
--
DROP DATABASE `mkm`;
CREATE DATABASE `mkm`;
-- --------------------------------------------------------

--
-- Estrutura da tabela `fornecedor`
--

CREATE TABLE `fornecedor` (
  `idFor` int(11) NOT NULL,
  `nomeFor` varchar(150) NOT NULL,
  `telefoneFor` varchar(45) DEFAULT NULL,
  `emailFor` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `itemproduto`
--

CREATE TABLE `itemproduto` (
  `pedido_idPed` int(11) NOT NULL,
  `produto_idPro` int(11) NOT NULL,
  `qtdItemPro` float(10,3) DEFAULT 0.000,
  `valorUnitarioPro` decimal(13,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedido`
--

CREATE TABLE `pedido` (
  `idPed` int(11) NOT NULL,
  `dataHoraPed` datetime DEFAULT NULL,
  `valorTotalPed` decimal(13,2) DEFAULT 0.00,
  `situacaoPed` varchar(15) DEFAULT 'Aberto' COMMENT 'Aberto\nFinalizado\nCancelado',
  `FK_usuario_idUsu` int(11) NOT NULL,
  `formapagamentoPed` varchar(25) DEFAULT 'Não informado' COMMENT 'Pix\nCartão de Crédito \nCartão de Débito\nBoleto Bancário'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto`
--

CREATE TABLE `produto` (
  `idPro` int(11) NOT NULL,
  `nomePro` varchar(80) NOT NULL,
  `valorCompraPro` decimal(13,2) DEFAULT 0.00,
  `valorVendaPro` decimal(13,2) DEFAULT 0.00,
  `qtdEstoquePro` float(10,3) DEFAULT 0.000,
  `imagemPro` varchar(100) DEFAULT NULL,
  `qtdEstoqueMinimoPro` float(10,3) DEFAULT 0.000,
  `codigoPro` varchar(50) DEFAULT NULL,
  `fornecedor_idFor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `idUsu` int(11) NOT NULL,
  `nomeUsu` varchar(150) NOT NULL,
  `cpfUsu` varchar(14) DEFAULT NULL,
  `sobrenomeUsu` date DEFAULT NULL,
  `telefoneUsu` varchar(150) NOT NULL,
  `emailUsu` varchar(150) DEFAULT NULL,
  `senhaUsu` varchar(50) DEFAULT NULL,
  `perfilUsu` varchar(15) DEFAULT 'Cliente' COMMENT 'Administrador\nFuncionário\nCliente',
  `situacaoUsu` varchar(15) DEFAULT 'Ativo' COMMENT 'Ativo\nInativo',
  `cepUsu` char(9) DEFAULT NULL,
  `enderecoUsu` varchar(45) DEFAULT NULL,
  `numeroUsu` char(9) DEFAULT NULL,
  `complementoUsu` varchar(45) DEFAULT NULL,
  `bairroUsu` varchar(45) DEFAULT NULL,
  `cidadeUsu` varchar(45) DEFAULT NULL,
  `ufUsu` char(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `fornecedor`
--
ALTER TABLE `fornecedor`
  ADD PRIMARY KEY (`idFor`);

--
-- Índices para tabela `itemproduto`
--
ALTER TABLE `itemproduto`
  ADD PRIMARY KEY (`pedido_idPed`,`produto_idPro`),
  ADD KEY `fk_pedido_has_produto_produto1_idx` (`produto_idPro`),
  ADD KEY `fk_pedido_has_produto_pedido1_idx` (`pedido_idPed`);

--
-- Índices para tabela `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`idPed`),
  ADD KEY `fk_pedido_usuario_idx` (`FK_usuario_idUsu`);

--
-- Índices para tabela `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`idPro`),
  ADD KEY `fk_produto_fornecedor1_idx` (`fornecedor_idFor`);

--
-- Índices para tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idUsu`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `fornecedor`
--
ALTER TABLE `fornecedor`
  MODIFY `idFor` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pedido`
--
ALTER TABLE `pedido`
  MODIFY `idPed` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `produto`
--
ALTER TABLE `produto`
  MODIFY `idPro` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idUsu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `itemproduto`
--
ALTER TABLE `itemproduto`
  ADD CONSTRAINT `fk_pedido_has_produto_pedido1` FOREIGN KEY (`pedido_idPed`) REFERENCES `pedido` (`idPed`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_pedido_has_produto_produto1` FOREIGN KEY (`produto_idPro`) REFERENCES `produto` (`idPro`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `fk_pedido_usuario` FOREIGN KEY (`FK_usuario_idUsu`) REFERENCES `usuario` (`idUsu`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `produto`
--
ALTER TABLE `produto`
  ADD CONSTRAINT `fk_produto_fornecedor1` FOREIGN KEY (`fornecedor_idFor`) REFERENCES `fornecedor` (`idFor`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
