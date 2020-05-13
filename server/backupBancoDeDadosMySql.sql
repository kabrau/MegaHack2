-- --------------------------------------------------------
-- Servidor:                     equipe28.mysql.database.azure.com
-- Versão do servidor:           5.7.27-log - MySQL Community Server (GPL)
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Copiando estrutura do banco de dados para aquipertooficial
CREATE DATABASE IF NOT EXISTS `aquipertooficial` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `aquipertooficial`;

-- Copiando estrutura para tabela aquipertooficial.categories
CREATE TABLE IF NOT EXISTS `categories` (
  `uid` char(36) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  `lastupdate_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lastupdate_uid_user` char(36) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela aquipertooficial.categories: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` (`uid`, `description`, `lastupdate_date`, `lastupdate_uid_user`) VALUES
	('cat_001', 'Alimentação', '2020-05-02 04:21:55', 'user_adm'),
	('cat_002', 'Moveis', '2020-05-02 04:22:46', 'user_adm'),
	('cat_003', 'Eletrecista', '2020-05-03 23:24:34', NULL),
	('cat_004', 'Cafeteria', '2020-05-03 23:24:45', NULL),
	('cat_005', 'Pintor', '2020-05-03 23:25:06', NULL);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;

-- Copiando estrutura para tabela aquipertooficial.comments
CREATE TABLE IF NOT EXISTS `comments` (
  `uid` char(36) NOT NULL,
  `uid_publication` char(36) DEFAULT NULL,
  `uid_user` char(36) DEFAULT NULL,
  `user_name` char(150) DEFAULT NULL,
  `avatar_url` char(36) DEFAULT NULL,
  `description` text,
  `create_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela aquipertooficial.comments: ~8 rows (aproximadamente)
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` (`uid`, `uid_publication`, `uid_user`, `user_name`, `avatar_url`, `description`, `create_date`) VALUES
	('317c9877-f91d-4956-8537-70e302db1ab7', 'public_001', '', 'Marta Rocha', 'avatar_006.jpg', 'Adorei!!!', '2020-05-04 21:13:38'),
	('54070f9a-9b66-49c7-a33c-edd5c42b966c', 'a66edb70-e9fd-432a-968c-74cddc1d8ce4', 'user_001', 'Pedro Alvares Cabral', 'avatar_001.jpg', 'Já estou aqui há um boom tempo, mas bem vindo!', '2020-05-05 01:30:46'),
	('b210831f-9499-4404-8b63-5793c4b82595', 'public_003', '', 'Pablo Diego', 'avatar_007.jpg', 'Muito interessante', '2020-05-05 01:29:42'),
	('cf229882-9590-41b8-ac99-c833c880c520', '527e6878-fe7f-4c19-80da-8765672a955a', '', 'Pablo Diego', 'avatar_007.jpg', 'Olá, eu posso ajudar? Sou pintor conhecido na região', '2020-05-05 01:29:21'),
	('comment_001', 'public_001', 'user_002', 'Rainha Elizabeth', 'avatar_002.jpg', 'Eu tenho uma poltrona perfeita para este local, vou te mandar uma foto', '2020-05-02 04:20:52'),
	('comment_002', 'public_001', 'user_005', 'Bob Marley', 'avatar_005.jpg', 'Adorei, vou buscar ai amanhã !!!', '2020-05-02 04:21:18'),
	('comment_003', 'public_002', 'user_003', 'Joana d\'Arc', 'avatar_003.jpg', 'Oi, sou um eletrecista do bairro, posso te adender em 1h se desejar', '2020-05-02 04:20:52'),
	('comment_004', 'public_002', 'user_006', 'Marta Rocha', 'avatar_006.jpg', 'Pode ser amanhã de manhã ? Preciso que instale luminárias', '2020-05-02 05:20:52'),
	('ef9d8bb2-a5d2-4d6e-bb79-8a646709f2e2', 'a66edb70-e9fd-432a-968c-74cddc1d8ce4', '', 'Bob Marley', 'avatar_005.jpg', 'onde estou?!', '2020-05-05 01:31:42'),
	('f781a6d1-37cc-4af1-a527-f4a8118c47af', 'a66edb70-e9fd-432a-968c-74cddc1d8ce4', '', 'Pablo Diego', 'avatar_007.jpg', 'Muito Obrigado!', '2020-05-05 01:28:59');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;

-- Copiando estrutura para tabela aquipertooficial.companies
CREATE TABLE IF NOT EXISTS `companies` (
  `uid` char(36) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `description` text,
  `site` varchar(200) DEFAULT NULL,
  `CNPJ` varchar(23) DEFAULT NULL,
  `CEP` varchar(9) DEFAULT NULL,
  `uid_category` char(36) DEFAULT NULL,
  `url_logo` varchar(150) DEFAULT NULL,
  `fone_contact` varchar(150) DEFAULT NULL,
  `adm_uid_user` char(36) DEFAULT NULL,
  `adress` varchar(250) DEFAULT NULL,
  `adress_number` varchar(15) DEFAULT NULL,
  `adress_complement` varchar(50) DEFAULT NULL,
  `city` varchar(200) DEFAULT NULL,
  `state` char(2) DEFAULT NULL,
  `lastupdate_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lastupdate_uid_user` char(36) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela aquipertooficial.companies: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `companies` DISABLE KEYS */;
INSERT INTO `companies` (`uid`, `name`, `description`, `site`, `CNPJ`, `CEP`, `uid_category`, `url_logo`, `fone_contact`, `adm_uid_user`, `adress`, `adress_number`, `adress_complement`, `city`, `state`, `lastupdate_date`, `lastupdate_uid_user`) VALUES
	('company_001', 'Lola - Bar de Tapas', 'O Lola Bar de Tapas reside há 7 anos na Castro Alves, rua charmosa de Porto Alegre e encanta pelas várias opções de Tapas e Sangrias para compartir con los amigos. Virou um clássico na cidade para as mais diversas celebrações, e nós amamos fazer parte dos seus momentos mais importantes. ', 'http://www.lolabar.com.br/', '99.999.999/0001-99', '90035-141', 'cat_001', 'empresa_001.png', '(51) 3557-0004', 'user_001', 'Rua Castro Avles', '422', NULL, 'Porto Alegre', 'RS', '2020-05-03 23:20:23', 'user_001'),
	('company_002', 'Feira de Tapetes', 'A Feira de Tapetes e Móveis Rústicos', 'https://www.feiradetapetes.com.br/', '88.999.999/0001-99', '90560-003', 'cat_002', 'empresa_002.jpg', '(51) 3018-7930', 'user_002', 'Saturnino de sousa', '300', 'Shopping', 'São Paulo', 'SP', '2020-05-04 17:47:27', 'user_002'),
	('company_003', 'Eletricista Bielski ', 'QUALIDADE E SEGURANÇA PARA VOCÊ!', 'https://www.adrianobieletrica.com/', '99.999.999/0001-99', '90035-141', 'cat_001', 'empresa_003.jpg', '(51) 9 9334-5658', 'user_003', 'Vasco da Gama', '100', NULL, 'Porto Alegre', 'RS', '2020-05-03 23:20:41', 'user_003');
/*!40000 ALTER TABLE `companies` ENABLE KEYS */;

-- Copiando estrutura para tabela aquipertooficial.portfolio
CREATE TABLE IF NOT EXISTS `portfolio` (
  `uid` char(36) NOT NULL,
  `uid_company` char(36) DEFAULT NULL,
  `product_name` varchar(150) DEFAULT NULL,
  `description` text,
  `url_image` varchar(200) DEFAULT NULL,
  `lastupdate_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lastupdate_uid_user` char(36) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela aquipertooficial.portfolio: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `portfolio` DISABLE KEYS */;
INSERT INTO `portfolio` (`uid`, `uid_company`, `product_name`, `description`, `url_image`, `lastupdate_date`, `lastupdate_uid_user`) VALUES
	('port_001', 'company_001', 'TeleEntrega', 'A dica de tele para fazer a alegria do domingo de quarentena é o almoço do nosso irmãozinho @vacapoa', 'produto_001.jpg', '2020-05-03 23:19:49', 'user_001'),
	('port_002', 'company_002', 'Cadeira Magnum', 'Cadeira Magnum - Suede Bege', 'produto_002.jpg', '2020-05-03 23:19:42', 'user_002'),
	('port_003', 'company_002', 'Sofá Boston', 'Sofá Boston 3 ligares', 'produto_003.jpg', '2020-05-03 23:24:03', 'user_002');
/*!40000 ALTER TABLE `portfolio` ENABLE KEYS */;

-- Copiando estrutura para tabela aquipertooficial.publications
CREATE TABLE IF NOT EXISTS `publications` (
  `uid` char(36) NOT NULL,
  `description` text,
  `uid_category` char(36) DEFAULT NULL,
  `url_image` text,
  `request` tinyint(4) DEFAULT '0',
  `uid_user` char(36) DEFAULT NULL,
  `lastupdate_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela aquipertooficial.publications: ~7 rows (aproximadamente)
/*!40000 ALTER TABLE `publications` DISABLE KEYS */;
INSERT INTO `publications` (`uid`, `description`, `uid_category`, `url_image`, `request`, `uid_user`, `lastupdate_date`) VALUES
	('527e6878-fe7f-4c19-80da-8765672a955a', 'Estou precisando de alguém para pintar minha parede', 'cat_005', 'public_05.jpg', 1, 'user_006', '2020-05-05 01:30:08'),
	('a66edb70-e9fd-432a-968c-74cddc1d8ce4', 'Seja bem vindo a nossa comunidade!', NULL, '', 0, 'user_006', '2020-05-04 18:49:13'),
	('public_001', 'Preciso de uma poltrona para este local', 'cat_002', 'public_001.jpg', 0, 'user_005', '2020-05-04 12:36:57'),
	('public_002', 'Preciso contratar um eletrcista', 'cat_003', NULL, 1, 'user_006', '2020-05-03 23:38:01'),
	('public_003', 'O eletricista Bielski fez um ótimo serviço aqui em casa ! Obrigado !', 'cat_003', 'public_003.jpg', 0, 'user_006', '2020-05-04 12:03:42'),
	('public_004', 'Olha que lindo este lanche no Lola, Muito BOM !!!', 'cat_001', 'public_004.jpg', 0, 'user_004', '2020-05-03 23:35:53'),
	('public_005', 'Consegui comprar minha poltrona, igual do Pedrinho II, da um sorriso ai Jefrey!!', 'cat_002', 'image_05.jpg', 0, 'user_005', '2020-05-03 23:37:47');
/*!40000 ALTER TABLE `publications` ENABLE KEYS */;

-- Copiando estrutura para tabela aquipertooficial.users
CREATE TABLE IF NOT EXISTS `users` (
  `uid` char(36) NOT NULL,
  `name` varchar(150) NOT NULL,
  `nickname` varchar(50) NOT NULL,
  `email` varchar(150) NOT NULL,
  `password` varchar(150) NOT NULL,
  `url_avatar` char(36) NOT NULL,
  `uid_user` char(36) NOT NULL,
  `lastupdate_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela aquipertooficial.users: ~9 rows (aproximadamente)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`uid`, `name`, `nickname`, `email`, `password`, `url_avatar`, `uid_user`, `lastupdate_date`) VALUES
	('13fc9c8a-16c2-4fac-af73-ddd438e33062', 'test', 'teste1', 'leo@leo.com', '1234', '', '', '2020-05-04 11:12:05'),
	('68545e38-33f1-4650-8031-d125f46ec1f9', 'Pablo Diego', 'picasso', 'pablo@pertoaqui.me', '1234', 'avatar_007.jpg', '', '2020-05-05 01:18:16'),
	('user_001', 'Pedro Alvares Cabral', 'Pedrinho', 'pedro@pertoaqui.me', '1234', 'avatar_001.jpg', 'user_001', '2020-05-04 09:44:39'),
	('user_002', 'Rainha Elizabeth ', 'Beth', 'beth@pertoaqui.me', '1234', 'avatar_002.jpg', 'user_002', '2020-05-04 12:51:56'),
	('user_003', 'Joana d\'Arc', 'Darc', 'darc@pertoaqui.me', '1234', 'avatar_003.jpg', '', '2020-05-04 12:51:52'),
	('user_004', 'Raul Seixas', 'rauzito', 'rauzito@pertoaqui.me', '1234', 'avatar_004.jpg', '', '2020-05-04 12:51:48'),
	('user_005', 'Bob Marley', 'bob', 'bob@pertoaqui.me', '1234', 'avatar_005.jpg', '', '2020-05-04 12:51:44'),
	('user_006', 'Marta Rocha', 'MartaR', 'marta@pertoaqui.me', '1234', 'avatar_006.jpg', '', '2020-05-04 12:51:40'),
	('user_adm', 'Admin', 'Admin', 'adm@pertoaqui.me', '', 'avatar_adm.png', '', '2020-05-03 23:21:53');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
