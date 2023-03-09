-- phpMyAdmin SQL Dump
-- version 4.7.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: 07-Mar-2023 às 11:46
-- Versão do servidor: 5.6.34
-- PHP Version: 5.6.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `speedlog`
--
CREATE DATABASE IF NOT EXISTS `speedlog` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `speedlog`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `avaliacoes`
--

CREATE TABLE `avaliacoes` (
  `avaliacao_id` int(11) NOT NULL,
  `avaliacao_entrega` int(11) NOT NULL,
  `avaliacao_total` int(1) NOT NULL,
  `avaliacao_desc` varchar(150) DEFAULT NULL,
  `avaliacao_tempoOK` tinyint(1) NOT NULL DEFAULT '1',
  `avaliacao_entregaOK` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `configs`
--

CREATE TABLE `configs` (
  `config_id` int(11) NOT NULL,
  `config_tipo` varchar(9) NOT NULL,
  `valor_km` decimal(10,2) NOT NULL,
  `valor_minuto` decimal(10,2) NOT NULL,
  `valor_kg` decimal(10,2) NOT NULL,
  `valor_kg1` decimal(10,2) NOT NULL,
  `valor_kg3` decimal(10,2) NOT NULL,
  `valor_kg8` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `configs`
--

INSERT INTO `configs` (`config_id`, `config_tipo`, `valor_km`, `valor_minuto`, `valor_kg`, `valor_kg1`, `valor_kg3`, `valor_kg8`) VALUES
(1, 'PADRAO', '0.50', '0.30', '3.00', '5.00', '9.00', '12.00'),
(2, 'SÁBADO', '0.40', '0.30', '3.00', '5.00', '9.00', '12.00'),
(3, 'DOMINGO', '0.50', '0.70', '3.00', '5.00', '9.00', '12.00'),
(4, 'FERIADO', '0.60', '0.40', '3.00', '5.00', '9.00', '12.00'),
(5, 'PROMOÇÃO', '0.30', '0.20', '3.00', '5.00', '9.00', '12.00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cupons`
--

CREATE TABLE `cupons` (
  `cupom_id` int(11) NOT NULL,
  `cupom_desconto` decimal(10,2) NOT NULL,
  `cupom_termino` date NOT NULL,
  `cupom_qtde` int(11) NOT NULL,
  `cupom_desc` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `cupons`
--

INSERT INTO `cupons` (`cupom_id`, `cupom_desconto`, `cupom_termino`, `cupom_qtde`, `cupom_desc`) VALUES
(1, '5.00', '2023-04-01', 3, 'Promoção de lançamento');

-- --------------------------------------------------------

--
-- Estrutura da tabela `denuncias`
--

CREATE TABLE `denuncias` (
  `denuncia_id` int(11) NOT NULL,
  `denuncia_Denunciante` varchar(15) NOT NULL,
  `denuncia_entrega` int(11) DEFAULT NULL,
  `denuncia_descricao` varchar(254) NOT NULL,
  `denuncia_status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `denuncias`
--

INSERT INTO `denuncias` (`denuncia_id`, `denuncia_Denunciante`, `denuncia_entrega`, `denuncia_descricao`, `denuncia_status`) VALUES
(1, 'carlinha', 1, 'entrega veio quebrada', 'TERMINADA');

-- --------------------------------------------------------

--
-- Estrutura da tabela `entregadores`
--

CREATE TABLE `entregadores` (
  `entregador_id` int(11) NOT NULL,
  `entregador_placaMoto` varchar(7) NOT NULL,
  `entregador_foto` varchar(70) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `entregadores`
--

INSERT INTO `entregadores` (`entregador_id`, `entregador_placaMoto`, `entregador_foto`) VALUES
(2, 'AAA1111', 'rogerinho.png'),
(3, 'BBB2222', 'klebinho.jpg');

-- --------------------------------------------------------

--
-- Estrutura da tabela `entregas`
--

CREATE TABLE `entregas` (
  `entrega_id` int(11) NOT NULL,
  `entrega_enderecoOrigem` varchar(254) NOT NULL,
  `entrega_enderecoDestino` varchar(254) NOT NULL,
  `entrega_cepOrigem` varchar(8) NOT NULL,
  `entrega_cepDestino` varchar(8) NOT NULL,
  `entrega_peso` float NOT NULL,
  `entrega_status` varchar(9) NOT NULL,
  `entrega_dataPedido` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `entrega_dataTransporte` datetime DEFAULT CURRENT_TIMESTAMP,
  `entrega_dataEntrega` datetime DEFAULT CURRENT_TIMESTAMP,
  `entrega_cliente` int(11) NOT NULL,
  `entrega_responsavel` int(11) DEFAULT NULL,
  `entrega_valor` decimal(10,0) NOT NULL,
  `entrega_observacao` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `entregas`
--

INSERT INTO `entregas` (`entrega_id`, `entrega_enderecoOrigem`, `entrega_enderecoDestino`, `entrega_cepOrigem`, `entrega_cepDestino`, `entrega_peso`, `entrega_status`, `entrega_dataPedido`, `entrega_dataTransporte`, `entrega_dataEntrega`, `entrega_cliente`, `entrega_responsavel`, `entrega_valor`, `entrega_observacao`) VALUES
(1, 'r. alfineiros n4', '', '', '36035210', 11.2, 'ANDAMENTO', '2023-02-15 21:32:45', NULL, NULL, 0, NULL, '0', NULL),
(2, '', '', '36050-00', '0', 12, 'ABERTO', '2023-03-06 11:13:50', '2023-03-06 11:13:50', '2023-03-06 11:13:50', 0, NULL, '0', NULL),
(3, '', '', '36050-00', 'aasdasd', 12, 'ABERTO', '2023-03-06 11:17:02', '2023-03-06 11:17:02', '2023-03-06 11:17:02', 0, NULL, '0', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `usuario_id` int(11) NOT NULL,
  `usuario_nome` varchar(50) NOT NULL,
  `usuario_email` varchar(254) NOT NULL,
  `usuario_cpf` varchar(14) NOT NULL,
  `usuario_apelido` varchar(15) NOT NULL,
  `usuario_senha` varchar(30) NOT NULL,
  `usuario_tipo` varchar(13) NOT NULL,
  `usuario_telefone` varchar(16) DEFAULT NULL,
  `usuario_status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `usuarios`
--

INSERT INTO `usuarios` (`usuario_id`, `usuario_nome`, `usuario_email`, `usuario_cpf`, `usuario_apelido`, `usuario_senha`, `usuario_tipo`, `usuario_telefone`, `usuario_status`) VALUES
(1, 'ADMINISTRADOR', 'admin@gmail.com', '000.000.000-00', 'admin', '123', 'ADMINISTRADOR', NULL, ''),
(2, 'ROGÉRIO ULISSES', 'rogerinho@mail.com', '123.456.789-10', 'rogerinho', '456', 'ENTREGADOR', '+55(32)9999-9999', 'SUSPENSO'),
(3, 'KLEBER FALAMANSA', 'klebinho@mail.com', '121.121.121-38', 'klebin', '789', 'ENTREGADOR', '9 9999-9998', 'ATIVO'),
(4, 'CARLA PIRES E BULE', 'carlinha@mail.com', '789.456.123-89', 'carlinha', '963', 'CLIENTE', '9 88888888', 'ATIVO');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `avaliacoes`
--
ALTER TABLE `avaliacoes`
  ADD PRIMARY KEY (`avaliacao_id`);

--
-- Indexes for table `configs`
--
ALTER TABLE `configs`
  ADD PRIMARY KEY (`config_id`);

--
-- Indexes for table `cupons`
--
ALTER TABLE `cupons`
  ADD PRIMARY KEY (`cupom_id`);

--
-- Indexes for table `denuncias`
--
ALTER TABLE `denuncias`
  ADD PRIMARY KEY (`denuncia_id`);

--
-- Indexes for table `entregadores`
--
ALTER TABLE `entregadores`
  ADD PRIMARY KEY (`entregador_id`);

--
-- Indexes for table `entregas`
--
ALTER TABLE `entregas`
  ADD PRIMARY KEY (`entrega_id`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`usuario_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `avaliacoes`
--
ALTER TABLE `avaliacoes`
  MODIFY `avaliacao_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `configs`
--
ALTER TABLE `configs`
  MODIFY `config_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `cupons`
--
ALTER TABLE `cupons`
  MODIFY `cupom_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `denuncias`
--
ALTER TABLE `denuncias`
  MODIFY `denuncia_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `entregas`
--
ALTER TABLE `entregas`
  MODIFY `entrega_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `usuario_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
