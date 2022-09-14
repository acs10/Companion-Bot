-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 14-Set-2022 às 22:41
-- Versão do servidor: 10.4.24-MariaDB
-- versão do PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `bot`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add text', 7, 'add_text'),
(26, 'Can change text', 7, 'change_text'),
(27, 'Can delete text', 7, 'delete_text'),
(28, 'Can view text', 7, 'view_text');

-- --------------------------------------------------------

--
-- Estrutura da tabela `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(7, 'nlpbot', 'text'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Estrutura da tabela `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2022-08-10 20:48:27.498872'),
(2, 'auth', '0001_initial', '2022-08-10 20:48:28.248241'),
(3, 'admin', '0001_initial', '2022-08-10 20:48:28.433340'),
(4, 'admin', '0002_logentry_remove_auto_add', '2022-08-10 20:48:28.449851'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2022-08-10 20:48:28.458633'),
(6, 'contenttypes', '0002_remove_content_type_name', '2022-08-10 20:48:28.546723'),
(7, 'auth', '0002_alter_permission_name_max_length', '2022-08-10 20:48:28.625299'),
(8, 'auth', '0003_alter_user_email_max_length', '2022-08-10 20:48:28.644872'),
(9, 'auth', '0004_alter_user_username_opts', '2022-08-10 20:48:28.658982'),
(10, 'auth', '0005_alter_user_last_login_null', '2022-08-10 20:48:28.725199'),
(11, 'auth', '0006_require_contenttypes_0002', '2022-08-10 20:48:28.731743'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2022-08-10 20:48:28.739749'),
(13, 'auth', '0008_alter_user_username_max_length', '2022-08-10 20:48:28.771251'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2022-08-10 20:48:28.793329'),
(15, 'auth', '0010_alter_group_name_max_length', '2022-08-10 20:48:28.812503'),
(16, 'auth', '0011_update_proxy_permissions', '2022-08-10 20:48:28.820768'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2022-08-10 20:48:28.841653'),
(18, 'sessions', '0001_initial', '2022-08-10 20:48:28.895866');

-- --------------------------------------------------------

--
-- Estrutura da tabela `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `nlpbot_text`
--

CREATE TABLE `nlpbot_text` (
  `id` int(11) NOT NULL,
  `body` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `nlpbot_text`
--

INSERT INTO `nlpbot_text` (`id`, `body`) VALUES
(12, '0'),
(13, '0'),
(14, '0'),
(15, '0'),
(16, '0'),
(17, 'I like you'),
(18, 'I like you'),
(19, 'I like'),
(20, 'what\'s'),
(21, 'what\'s'),
(22, 'I like you'),
(23, 'I like you'),
(24, 'I like you'),
(25, 'I like you'),
(26, 'I like you'),
(27, 'I like you'),
(28, 'I like you'),
(29, 'I like you'),
(30, 'I like you'),
(31, 'w'),
(32, 'I like you'),
(33, 'I like you'),
(34, 'I like you'),
(35, 'I like you'),
(36, ''),
(37, 'how are you'),
(38, 'how are you'),
(39, 'how are you'),
(40, 'how are you'),
(41, 'how are you'),
(42, 'how are you'),
(43, 'how are you'),
(44, 'how are you'),
(45, 'how are you'),
(46, 'how are you'),
(47, 'how are you'),
(48, 'how are you'),
(49, 'how are you'),
(50, 'how are you'),
(51, 'how are you'),
(52, 'how are you'),
(53, 'I love you'),
(54, 'leave'),
(55, 'leave'),
(56, 'please don\'t play'),
(57, 'Shuffle Jolla'),
(58, 'how are you'),
(59, 'how are you'),
(60, 'how are you'),
(61, 'pistol'),
(62, '50 Style'),
(63, ''),
(64, ''),
(65, 'how are you'),
(66, 'how are you'),
(67, 'how are you'),
(68, 'how are you'),
(69, 'how are you'),
(70, 'hello my'),
(71, 'hello my French'),
(72, 'hello my friend'),
(73, 'were you able'),
(74, 'how are you'),
(75, 'yay'),
(76, 'how are you'),
(77, 'how'),
(78, 'how are you'),
(79, 'how are you'),
(80, 'how are you'),
(81, 'how are you'),
(82, 'how are you'),
(83, 'how are you'),
(84, 'how are you'),
(85, 'how are you'),
(86, 'how are you'),
(87, 'I like you'),
(88, 'how are'),
(89, 'how are you'),
(90, 'I like you'),
(91, 'I like you'),
(92, 'what the f***'),
(93, 'I'),
(94, 'how are you'),
(95, 'I like you'),
(96, 'I like you'),
(97, 'how are you'),
(98, 'how are you'),
(99, 'you like'),
(100, 'I like you'),
(101, ''),
(102, 'today'),
(103, 'today\'s Friday'),
(104, 'are you here'),
(105, 'what do you do'),
(106, 'who is Geo'),
(107, 'how are you'),
(108, 'B'),
(109, 'somebody'),
(110, 'Divya bharti'),
(111, 'who are'),
(112, ''),
(113, 'who are'),
(114, 'who are'),
(115, ''),
(116, 'who are'),
(117, 'who are'),
(118, ''),
(119, ''),
(120, 'how are you'),
(121, 'how are you'),
(122, 'Evie Barbie'),
(123, 'everybody'),
(124, 'how are you'),
(125, ''),
(126, ''),
(127, ''),
(128, ''),
(129, '17 está acontecendo'),
(130, 'incêndio'),
(131, 'incêndio'),
(132, 'incêndio'),
(133, 'incêndio'),
(134, 'incêndio'),
(135, 'incêndio'),
(136, 'um incêndio'),
(137, 'um incêndio tá acontecendo'),
(138, 'incêndio tá acontecendo'),
(139, 'o incêndio tá acontecendo'),
(140, 'um incêndio tá acontecendo'),
(141, 'os 100 já tá acontecendo'),
(142, 'o incêndio está acontecendo'),
(143, 'incêndio tá acontecendo'),
(144, 'os Sérgio tá acontecendo'),
(145, 'olá oi'),
(146, 'olá mundo'),
(147, 'olá mundo'),
(148, 'o incêndio'),
(149, 'tem Vicente acontecendo'),
(150, 'o incêndio'),
(151, 'um incêndio'),
(152, 'um incêndio'),
(153, 'um incêndio'),
(154, 'um incêndio'),
(155, 'incêndio'),
(156, 'o incêndio tá acontecendo'),
(157, 'eu acho que tá acontecendo incêndio'),
(158, 'meu Deus o incêndio'),
(159, 'meu Deus um incêndio'),
(160, 'eu caí'),
(161, 'estou me sentindo mal'),
(162, 'eu caí'),
(163, 'eu caí'),
(164, 'estou me sentindo mal'),
(165, 'estou me sentindo mal'),
(166, 'estamos sentindo mal'),
(167, 'estou me sentindo mal'),
(168, 'aí eu caí velho'),
(169, 'Bom dia'),
(170, 'acabou a pasta de dente'),
(171, 'acabou a pasta de dente'),
(172, 'acabou a pasta de dente'),
(173, 'acabou'),
(174, 'acabou a pasta de dente'),
(175, 'sim'),
(176, 'sim'),
(177, 'sim'),
(178, 'sim'),
(179, 'sim'),
(180, ''),
(181, ''),
(182, 'olá mundo'),
(183, 'o que eu tenho agendado'),
(184, 'eu tenho algum evento'),
(185, 'que eu tenho na minha lista de compras'),
(186, 'lista de compras'),
(187, 'que eu tenho na minha lista de compras'),
(188, 'quais os remédios que eu tenho'),
(189, 'remédio'),
(190, 'faz remédio eu tenho que tomar'),
(191, 'Qual remédio tem que tomar'),
(192, 'que eventos eu tenho'),
(193, 'qual evento eu tenho'),
(194, 'o que eu tenho agendado para fazer'),
(195, 'o que eu tenho agendado'),
(196, 'o que eu tenho agendado'),
(197, 'o que eu tenho agendado'),
(198, 'o que eu tenho agendado'),
(199, 'o que eu tenho agendado'),
(200, 'o que eu tenho agendado'),
(201, 'o que eu tenho agendado'),
(202, 'o que eu tenho agendado'),
(203, 'o que eu tenho agendado'),
(204, 'o que eu tenho agendado'),
(205, 'o que eu tenho agendado'),
(206, ''),
(207, ''),
(208, ''),
(209, ''),
(210, ''),
(211, ''),
(212, ''),
(213, ''),
(214, ''),
(215, ''),
(216, ''),
(217, 'Por que você não tá entendendo'),
(218, 'o que eu tenho na agenda'),
(219, 'o que eu tenho agendado'),
(220, 'qual remédio eu tenho que tomar'),
(221, 'testando request'),
(222, 'testando entrada'),
(223, 'que tá vindo aqui'),
(224, 'testando frequência'),
(225, 'testando testando testando frequência'),
(226, 'testando o marcador marcador'),
(227, 'está no matador'),
(228, 'testando frase'),
(229, 'estando entrada de uma frase aqui'),
(230, 'Ontem eu vi um cachorro andando'),
(231, 'testando entrada'),
(232, 'testando'),
(233, 'testando entrada'),
(234, 'testando a entrada'),
(235, 'estando com atualização'),
(236, 'testando o marcador'),
(237, 'testando entrada 3'),
(238, 'o carro bateu na moto e capotou'),
(239, 'instalar entrada'),
(240, 'teste de classificação supervisionada'),
(241, 'teste de algoritmo'),
(242, 'assistir jogo do bicho supervisionado'),
(243, 'testando palavras'),
(244, 'Cristão entrada de palavras'),
(245, 'testando entrada de palavras'),
(246, 'testando gramática simples'),
(247, 'testando gramática simples'),
(248, 'testando gramática simples'),
(249, 'testando gramática simples'),
(250, 'abrindo a porta do carro'),
(251, 'abrindo a porta do carro'),
(252, 'abrindo a mala do carro'),
(253, ''),
(254, 'O gato comeu sapato'),
(255, 'O gato comeu sapato'),
(256, 'Mary som Bob'),
(257, 'Mary the dog'),
(258, 'dog'),
(259, 'ele comeu um gato'),
(260, 'ele comeu ele ano gato'),
(261, 'treinando palavras inúteis e'),
(262, 'esperando o jogo acabar Stop Words'),
(263, 'as 10 horas aquele cara vai morrer'),
(264, 'testando entrada blá blá'),
(265, 'o carro é dele'),
(266, 'o carro da mãe foi dele'),
(267, 'está acontecendo incêndio'),
(268, 'um gato morreu do coração'),
(269, 'meu Deus está acontecendo incêndio'),
(270, ''),
(271, 'está acontecendo incêndio'),
(272, 'incêndio está acontecendo'),
(273, 'jefferson tá pegando fogo que eu faço'),
(274, 'bom dia minha amiga'),
(275, 'tá pegando fogo vai tomar no morrer'),
(276, 'bom dia'),
(277, 'bom dia'),
(278, 'eu estou sentindo muita dor'),
(279, 'eu caí'),
(280, 'eu caí'),
(281, 'a casa tá pegando fogo'),
(282, 'o que eu tenho agendado para hoje'),
(283, 'o que eu tenho agendado para hoje'),
(284, 'o que eu tenho pra comprar'),
(285, 'o que eu tenho no meu carrinho de compras'),
(286, 'o que eu tenho no meu carrinho de compras'),
(287, 'boa noite querida'),
(288, 'a casa está pegando fogo'),
(289, 'socorro'),
(290, 'socorro'),
(291, ''),
(292, 'tá pegando fogo na casa'),
(293, 'acho que está acontecendo incêndio'),
(294, 'qual o remédio eu tenho que tomar'),
(295, 'qual o remédio eu tenho que tomar'),
(296, 'tá acontecendo entendi meu amor'),
(297, 'tá acontecendo entendi meu amor'),
(298, 'incêndio'),
(299, 'incêndio'),
(300, ''),
(301, 'bom dia'),
(302, 'bom dia bom dia não dia'),
(303, ''),
(304, ''),
(305, 'testando a entrada'),
(306, 'incêndio'),
(307, 'Por que você não tá'),
(308, ''),
(309, 'testando entrada'),
(310, ''),
(311, 'eu estou me sentindo'),
(312, 'Bom dia'),
(313, 'tá acontecendo isso a gente aqui em casa'),
(314, ''),
(315, ''),
(316, ''),
(317, ''),
(318, ''),
(319, 'testando entrada de áudio meu amigo'),
(320, 'tem um cara aqui que fica falando o tempo todo o que que eu'),
(321, 'fiz uma solução estável'),
(322, 'tá pegando fogo incêndio tá acontecendo'),
(323, 'tá acontecendo incêndio aqui em casa'),
(324, 'boa noite'),
(325, 'eu tô sofrendo com tanto barulho o que que eu'),
(326, 'eu tô sofrendo com tanto barulho'),
(327, 'tocar fogo no Pedro tá bom'),
(328, 'Ah eu acordei tão triste'),
(329, 'eu tô muito feliz'),
(330, 'Que horas são eventos que eu tenho para hoje'),
(331, 'quais os remédios que tem para tomar nesta manhã'),
(332, 'quais remédios eu tenho para tomar nesta manhã'),
(333, 'quais remédios eu tenho para tomar'),
(334, 'eu tenho na minha agenda para hoje'),
(335, 'Que horas é esse aniversário'),
(336, 'Ah estou com muita dor'),
(337, 'o que eu tenho que comprar quando for no supermercado'),
(338, 'Você poderia ligar a luz por gentileza'),
(339, 'boa noite'),
(340, 'Boa tarde'),
(341, 'Boa tarde'),
(342, 'Qual o seu nome'),
(343, 'Qual o meu nome'),
(344, 'Qual o meu nome'),
(345, 'Qual o meu nome'),
(346, 'Qual o meu nome'),
(347, 'Qual o meu nome'),
(348, 'Qual o meu nome'),
(349, 'Qual o seu nome'),
(350, 'Qual o meu nome'),
(351, 'Qual o meu nome'),
(352, 'Qual o seu nome'),
(353, 'Qual o meu nome'),
(354, 'Qual o meu nome'),
(355, 'Qual o seu nome'),
(356, 'Qual o meu nome'),
(357, 'Qual o meu nome'),
(358, 'Qual o seu nome minha amiga bote'),
(359, 'Bom dia'),
(360, 'Bom dia'),
(361, 'Onde estão os meus remédios'),
(362, 'tá pegando fogo no meu quarto'),
(363, 'eu tô morrendo tá pegando fogo'),
(364, 'eu não consigo sair da casa estou preso'),
(365, 'Que horas são'),
(366, 'meu remédio acabou'),
(367, 'estou sentindo Dores'),
(368, 'Bom dia Como é meu nome'),
(369, 'Bom dia Como é o meu nome'),
(370, 'Bom dia'),
(371, 'Qual é o meu nome'),
(372, 'Qual é o meu remédio para hipertensão'),
(373, 'quais os horários para tomar remédio'),
(374, 'quais remédios que eu tenho que tomar hoje'),
(375, 'Quem descobriu o Brasil');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Índices para tabela `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Índices para tabela `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Índices para tabela `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Índices para tabela `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Índices para tabela `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Índices para tabela `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Índices para tabela `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Índices para tabela `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Índices para tabela `nlpbot_text`
--
ALTER TABLE `nlpbot_text`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT de tabela `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de tabela `nlpbot_text`
--
ALTER TABLE `nlpbot_text`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=376;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Limitadores para a tabela `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Limitadores para a tabela `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Limitadores para a tabela `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Limitadores para a tabela `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
