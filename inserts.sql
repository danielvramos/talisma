-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           8.0.23 - MySQL Community Server - GPL
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Copiando dados para a tabela talisma.contatos: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `contatos` DISABLE KEYS */;
INSERT INTO `contatos` (`id`, `nome`, `email`, `fone`, `idFornecedor`) VALUES
	(1, 'Daniel Ramos', 'vieira.ramos@gmail.com', '(21)9313-39100', 2),
	(2, 'Daniel Ramos', 'vieira.ramos@gmail.com', '(21)3133-9100_', 1);
/*!40000 ALTER TABLE `contatos` ENABLE KEYS */;

-- Copiando dados para a tabela talisma.cotacaofornecedores: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `cotacaofornecedores` DISABLE KEYS */;
INSERT INTO `cotacaofornecedores` (`idProduto`, `idFornecedor`) VALUES
	(2, 2),
	(3, 2),
	(2, 3);
/*!40000 ALTER TABLE `cotacaofornecedores` ENABLE KEYS */;

-- Copiando dados para a tabela talisma.cotacaoprodutos: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `cotacaoprodutos` DISABLE KEYS */;
INSERT INTO `cotacaoprodutos` (`id`, `nome`, `categoria`, `valor`, `dataValidade`) VALUES
	(1, 'Motorola One', 'Smartfone', 1250.36, '2021-07-30'),
	(2, 'Motorola One', 'Smartfone', 999.99, '2021-06-25'),
	(3, 'Motorola G5', 'Smartfone', 599.99, '2021-06-25');
/*!40000 ALTER TABLE `cotacaoprodutos` ENABLE KEYS */;

-- Copiando dados para a tabela talisma.fornecedores: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `fornecedores` DISABLE KEYS */;
INSERT INTO `fornecedores` (`id`, `cnpj`, `nomeFantasia`, `razaoSocial`) VALUES
	(1, '12345678912546', 'SAMSUNG ELECTRONICS', 'SAMSUNG ELECTRONICS CO. LTD.'),
	(2, '65478215634859', 'MOTOROLA', 'MOTOROLA MOBILITY PRODUTOS ELETRONICOS LTDA'),
	(3, '64125873254103', 'PONTO FRIO', ' VIA VAREJO S/A'),
	(7, '12345678912012', '123', '123');
/*!40000 ALTER TABLE `fornecedores` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
