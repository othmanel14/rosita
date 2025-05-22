-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : ven. 25 avr. 2025 à 15:21
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `magasin`
--

-- --------------------------------------------------------

--
-- Structure de la table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `quantity` int(11) DEFAULT 0,
  `category` varchar(100) DEFAULT NULL,
  `supplier` varchar(100) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `price`, `quantity`, `category`, `supplier`, `image`, `created_at`) VALUES
(16, 'samsung s25 ultra', NULL, 1000.00, 56, 'phone', 'sami', 'uploads/1745162337_samsung.png', '2025-04-20 15:18:57'),
(17, 'PS5', NULL, 600.00, 0, 'console', 'walid', 'uploads/1745162872_ps5.png', '2025-04-20 15:27:52'),
(18, 'JBL Flip5', NULL, 30.00, 6, 'speaker', 'karim', 'uploads/1745163031_jbl.png', '2025-04-20 15:30:31'),
(19, 'Gaming Mouse', NULL, 70.00, 65, 'souris', 'nizar', 'uploads/1745163170_souris.png', '2025-04-20 15:32:50'),
(20, 'Gaming Chair', NULL, 200.00, 3, 'chaise', 'othman', 'uploads/1745163342_chair.png', '2025-04-20 15:35:42'),
(24, 'Iphone 13 Pro Max', NULL, 890.00, 14, 'phone', 'sami', 'uploads/1745174778_iphone.png', '2025-04-20 18:46:18'),
(28, 'Deglet Nour d\'Algérie', NULL, 15.00, 60, 'dattes', 'kilyan', 'uploads/1745347218_alger.png', '2025-04-22 18:40:18'),
(29, 'Majhoul', NULL, 24.00, 11, 'dattes', 'kilyan', 'uploads/1745348142_majhoul.png', '2025-04-22 18:55:42'),
(30, 'Ajwa', NULL, 40.00, 51, 'dattes', 'kilyan', 'uploads/1745348289_Capture d\'écran 2025-04-22 195648.png', '2025-04-22 18:58:09');

-- --------------------------------------------------------

--
-- Structure de la table `sales`
--

CREATE TABLE `sales` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity_sold` int(11) NOT NULL,
  `client_name` varchar(100) DEFAULT NULL,
  `seller_id` int(11) DEFAULT NULL,
  `date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `sales`
--

INSERT INTO `sales` (`id`, `product_id`, `quantity_sold`, `client_name`, `seller_id`, `date`) VALUES
(5, 17, 8, 'said', 15, '2025-04-20 16:56:00'),
(6, 19, 1, 'anas', 15, '2025-04-20 16:58:26'),
(7, 19, 3, 'said', 15, '2025-04-20 19:39:12'),
(8, 17, 31, 'ahmed', 15, '2025-04-21 00:11:54'),
(9, 18, 1, 'moukafih', 15, '2025-04-21 11:09:18'),
(10, 18, 4, 'moukafih', NULL, '2025-04-21 15:16:24'),
(11, 18, 2, 'moukafih', 15, '2025-04-22 20:20:40'),
(12, 16, 4, 'simo', 15, '2025-04-22 20:28:51'),
(13, 16, 4, 'simo', 15, '2025-04-22 20:29:40'),
(14, 16, 4, 'simo', 15, '2025-04-22 20:31:50'),
(15, 16, 4, 'simo', 15, '2025-04-22 20:32:04'),
(16, 30, 4, 'hamza', 17, '2025-04-22 20:32:39'),
(17, 18, 2, 'badia', 15, '2025-04-23 08:55:47'),
(18, 17, 1, 'hamza', 15, '2025-04-23 09:58:34');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','vendeur','fournisseur') DEFAULT 'vendeur',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `role`, `created_at`) VALUES
(15, 'hamid', 'hamid@magasin.com', '$2y$10$tlnb3XjyKvaoWnR1hE3kBOTxBNoV5tgp0SUHUepqgFwy4r/AFkzUO', 'fournisseur', '2025-04-20 03:01:59'),
(16, 'said', 'said@magasin.com', '$2y$10$hRahc1lzU/rWJD7gKALzouSdgwtftmD592da6CVRigLlNA.AxYNf2', 'fournisseur', '2025-04-20 03:03:43'),
(17, 'rachid', 'rachid@magasin.com', '$2y$10$Dj8GNyEv8ckBy3/60rNDVO3H/0zyPdMgSv.F8JpWBTK2XBKQF7fOO', 'vendeur', '2025-04-20 03:49:09'),
(26, 'hamza', 'hamza@fefe.cv', '$2y$10$Uo1a5A.aVL0RtyjQ6ulp9O83eoeM4MpgHuA/LXQEx83VSeiwK8sFq', 'vendeur', '2025-04-23 09:01:26');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `seller_id` (`seller_id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT pour la table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sales_ibfk_2` FOREIGN KEY (`seller_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
