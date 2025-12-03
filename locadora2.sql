-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 03/12/2025 às 12:13
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `locadora2`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `agendamentos`
--

CREATE TABLE `agendamentos` (
  `id_agendamento` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_carro` int(11) NOT NULL,
  `data_inicio` date NOT NULL,
  `data_fim` date NOT NULL,
  `valor_previsto` decimal(10,2) DEFAULT NULL,
  `status` varchar(20) DEFAULT 'Agendado'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `carros`
--

CREATE TABLE `carros` (
  `id_carro` int(11) NOT NULL,
  `modelo` varchar(100) NOT NULL,
  `marca` varchar(100) NOT NULL,
  `ano` int(11) NOT NULL,
  `placa` varchar(10) NOT NULL,
  `diaria` decimal(10,2) NOT NULL,
  `status` varchar(20) DEFAULT 'Disponível'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `clientes`
--

CREATE TABLE `clientes` (
  `id_cliente` int(11) NOT NULL,
  `nome` varchar(150) NOT NULL,
  `cpf` varchar(14) NOT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `endereco` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `clientes`
--

INSERT INTO `clientes` (`id_cliente`, `nome`, `cpf`, `telefone`, `email`, `endereco`) VALUES
(1, 'João Silva', '123.456.789-00', '11987654321', 'joao@email.com', NULL),
(2, 'Maria Oliveira', '234.567.890-11', '11987654322', 'maria@email.com', NULL),
(3, 'Pedro Costa', '345.678.901-22', '11987654323', 'pedro@email.com', NULL),
(4, 'Ana Souza', '456.789.012-33', '11987654324', 'ana@email.com', NULL),
(5, 'Carlos Pereira', '567.890.123-44', '11987654325', 'carlos@email.com', NULL),
(6, 'Juliana Lima', '678.901.234-55', '11987654326', 'juliana@email.com', NULL),
(7, 'Roberto Matos', '789.012.345-66', '11987654327', 'roberto@email.com', NULL),
(8, 'Fernanda Almeida', '890.123.456-77', '11987654328', 'fernanda@email.com', NULL),
(9, 'Thiago Santos', '901.234.567-88', '11987654329', 'thiago@email.com', NULL),
(10, 'Larissa Costa', '123.456.789-99', '11987654330', 'larissa@email.com', NULL),
(11, 'Marcos Rodrigues', '234.567.890-00', '11987654331', 'marcos@email.com', NULL),
(12, 'Silvia Oliveira', '345.678.901-11', '11987654332', 'silvia@email.com', NULL),
(13, 'Daniel Costa', '456.789.012-22', '11987654333', 'daniel@email.com', NULL),
(14, 'Gabriela Silva', '567.890.123-33', '11987654334', 'gabriele@email.com', NULL),
(15, 'Fábio Lima', '678.901.234-44', '11987654335', 'fabio@email.com', NULL),
(16, 'Camila Pereira', '789.012.345-55', '11987654336', 'camila@email.com', NULL),
(17, 'Eduardo Santos', '890.123.456-66', '11987654337', 'eduardo@email.com', NULL),
(18, 'Mariana Oliveira', '901.234.567-77', '11987654338', 'mariana@email.com', NULL),
(19, 'Lucas Almeida', '123.456.789-11', '11987654339', 'lucas@email.com', NULL),
(20, 'Tatiane Martins', '234.567.890-22', '11987654340', 'tatiane@email.com', NULL);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `agendamentos`
--
ALTER TABLE `agendamentos`
  ADD PRIMARY KEY (`id_agendamento`),
  ADD KEY `id_cliente` (`id_cliente`),
  ADD KEY `id_carro` (`id_carro`);

--
-- Índices de tabela `carros`
--
ALTER TABLE `carros`
  ADD PRIMARY KEY (`id_carro`),
  ADD UNIQUE KEY `placa` (`placa`);

--
-- Índices de tabela `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id_cliente`),
  ADD UNIQUE KEY `cpf` (`cpf`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `agendamentos`
--
ALTER TABLE `agendamentos`
  MODIFY `id_agendamento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `carros`
--
ALTER TABLE `carros`
  MODIFY `id_carro` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `agendamentos`
--
ALTER TABLE `agendamentos`
  ADD CONSTRAINT `agendamentos_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`),
  ADD CONSTRAINT `agendamentos_ibfk_2` FOREIGN KEY (`id_carro`) REFERENCES `carros` (`id_carro`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
