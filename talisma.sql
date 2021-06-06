-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           5.7.33 - MySQL Community Server (GPL)
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para talisma
CREATE DATABASE IF NOT EXISTS `talisma` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `talisma`;

-- Copiando estrutura para tabela talisma.contatos
CREATE TABLE IF NOT EXISTS `contatos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_fornecedor` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `fone` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_id_fornecedor` (`id_fornecedor`),
  CONSTRAINT `fk_id_fornecedor` FOREIGN KEY (`id_fornecedor`) REFERENCES `fornecedores` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela talisma.contatos: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `contatos` DISABLE KEYS */;
INSERT INTO `contatos` (`id`, `id_fornecedor`, `nome`, `email`, `fone`) VALUES
	(6, 1, 'FULANO', 'fulano@gmail.com', '2199999999');
/*!40000 ALTER TABLE `contatos` ENABLE KEYS */;

-- Copiando estrutura para tabela talisma.cotacaofornecedores
CREATE TABLE IF NOT EXISTS `cotacaofornecedores` (
  `idProduto` int(11) DEFAULT NULL,
  `idFornecedor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela talisma.cotacaofornecedores: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `cotacaofornecedores` DISABLE KEYS */;
INSERT INTO `cotacaofornecedores` (`idProduto`, `idFornecedor`) VALUES
	(2, 2),
	(3, 2),
	(2, 3);
/*!40000 ALTER TABLE `cotacaofornecedores` ENABLE KEYS */;

-- Copiando estrutura para tabela talisma.cotacaoprodutos
CREATE TABLE IF NOT EXISTS `cotacaoprodutos` (
  `id` int(11) DEFAULT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `categoria` varchar(50) DEFAULT NULL,
  `valor` int(11) DEFAULT NULL,
  `dataValidade` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela talisma.cotacaoprodutos: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `cotacaoprodutos` DISABLE KEYS */;
INSERT INTO `cotacaoprodutos` (`id`, `nome`, `categoria`, `valor`, `dataValidade`) VALUES
	(1, 'teste', 'teste', 1250, 2021),
	(2, 'teste', 'teste', 1000, 2021),
	(3, 'teste', 'teste', 600, 2021);
/*!40000 ALTER TABLE `cotacaoprodutos` ENABLE KEYS */;

-- Copiando estrutura para tabela talisma.fornecedores
CREATE TABLE IF NOT EXISTS `fornecedores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cnpj` varchar(50) NOT NULL,
  `nomeFantasia` varchar(50) NOT NULL,
  `razaoSocial` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela talisma.fornecedores: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `fornecedores` DISABLE KEYS */;
INSERT INTO `fornecedores` (`id`, `cnpj`, `nomeFantasia`, `razaoSocial`) VALUES
	(1, '45678912540', 'SAMSUNG ELECTRONICS', 'SAMSUNG ELECTRONICS CO. LTD.'),
	(2, '65478215634859', 'MOTOROLA', 'MOTOROLA MOBILITY PRODUTOS ELETRONICOS LTDA'),
	(3, '64125873254103', 'PONTO FRIO', ' VIA VAREJO S/A');
/*!40000 ALTER TABLE `fornecedores` ENABLE KEYS */;

-- Copiando estrutura para tabela talisma.produtos
CREATE TABLE IF NOT EXISTS `produtos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela talisma.produtos: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `produtos` DISABLE KEYS */;
/*!40000 ALTER TABLE `produtos` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
