# Installer MySQL Server et MySQL Workbench sur Mac

Ce tutoriel explique comment installer MySQL sur macOS, configurer une connexion locale et exécuter un premier script SQL.

> **Objectif :** disposer d'un environnement fonctionnel pour réaliser les travaux pratiques de bases de données.

## Sommaire

1. [Comprendre les logiciels](#1-comprendre-les-logiciels)
2. [Identifier son Mac](#2-identifier-son-mac)
3. [Télécharger MySQL Server](#3-télécharger-mysql-server)
4. [Installer et configurer le serveur](#4-installer-et-configurer-le-serveur)
5. [Démarrer le serveur](#5-démarrer-le-serveur)
6. [Installer MySQL Workbench](#6-installer-mysql-workbench)
7. [Créer la connexion locale](#7-créer-la-connexion-locale)
8. [Exécuter une première requête](#8-exécuter-une-première-requête)
9. [Créer une base et une table](#9-créer-une-base-et-une-table)
10. [Ouvrir et enregistrer un script SQL](#10-ouvrir-et-enregistrer-un-script-sql)
11. [Comprendre le fonctionnement client-serveur](#11-comprendre-le-fonctionnement-client-serveur)
12. [Résoudre les problèmes fréquents](#12-résoudre-les-problèmes-fréquents)
13. [Reprendre le travail au prochain TP](#13-reprendre-le-travail-au-prochain-tp)
14. [Checklist de validation](#14-checklist-de-validation)

## 1. Comprendre les logiciels

Pour travailler avec une base de données sur son propre Mac, il faut installer **deux logiciels distincts**.

| Logiciel | Rôle |
| --- | --- |
| **MySQL Community Server** | Stocke les bases de données, gère les tables et exécute les requêtes SQL. |
| **MySQL Workbench** | Fournit une interface graphique pour écrire des requêtes et consulter les résultats. |

**Installer Workbench seul ne suffit pas pour disposer d'un serveur local.** Si votre établissement fournit un serveur distant, son installation sur le Mac n'est pas nécessaire : utilisez alors les paramètres de connexion fournis par l'enseignant.

## 2. Identifier son Mac

1. Ouvrir le menu ****.
2. Cliquer sur **À propos de ce Mac**.
3. Relever la **version de macOS** et la **puce ou le processeur**.

| Matériel affiché | Architecture à sélectionner |
| --- | --- |
| Puce Apple : M1, M2, M3, M4 ou génération suivante | **ARM, 64-bit / arm64** |
| Processeur Intel | **x86, 64-bit / x86_64** |

> **Compatibilité :** vérifier séparément la compatibilité de MySQL Server et de Workbench avec macOS. Les versions récentes peuvent ne plus proposer de paquet pour les Mac Intel ou les anciennes versions de macOS. Un paquet ARM ne convient pas à un Mac Intel.

Consulter les listes officielles :

- [Plateformes compatibles avec MySQL Server](https://www.mysql.com/support/supportedplatforms/database.html)
- [Plateformes compatibles avec MySQL Workbench](https://www.mysql.com/support/supportedplatforms/workbench.html)

## 3. Télécharger MySQL Server

1. Ouvrir la page [MySQL Community Server](https://dev.mysql.com/downloads/mysql/).
2. Dans **Select Version**, choisir la version demandée par l'enseignant.
3. Si aucune version n'est imposée, sélectionner une version **LTS** proposant un paquet compatible avec le Mac. Les étapes suivantes correspondent notamment à l'installateur MySQL 8.4.
4. Dans **Select Operating System**, choisir **macOS**.
5. Sélectionner l'architecture identifiée à l'étape précédente.
6. Télécharger le paquet **DMG Archive**.
7. Si une page de connexion Oracle apparaît, utiliser **No thanks, just start my download**, lorsque ce lien est proposé.

Il n'est pas nécessaire de créer un compte Oracle pour télécharger les éditions Community.

> Les intitulés et les écrans peuvent varier selon la version téléchargée. Ne choisissez pas une version uniquement parce qu'elle apparaît en premier : vérifiez sa compatibilité avec votre Mac et les consignes du TP.

## 4. Installer et configurer le serveur

### 4.1. Lancer l'installation

1. Ouvrir le dossier **Téléchargements**.
2. Double-cliquer sur le fichier MySQL **`.dmg`**.
3. Ouvrir le fichier **`.pkg`** contenu dans la fenêtre.
4. Cliquer sur **Continuer / Continue**.
5. Lire et accepter la licence.
6. Conserver les composants et l'emplacement proposés par défaut.
7. Cliquer sur **Installer / Install**.
8. Saisir le mot de passe administrateur du Mac lorsque macOS le demande.

### 4.2. Définir le mot de passe MySQL

L'assistant de configuration demande normalement de définir le mot de passe du compte MySQL **`root`**.

1. Choisir un mot de passe personnel.
2. Le confirmer.
3. Le conserver dans un gestionnaire de mots de passe.
4. Activer **Start MySQL Server after the configuration**, si cette option est proposée.
5. Terminer l'assistant.

Si une ancienne version de l'installateur fournit un **mot de passe temporaire**, le conserver et suivre la procédure de changement proposée à la première connexion.

| Mot de passe | Utilisation |
| --- | --- |
| Mot de passe du Mac | Autoriser l'installation et certaines actions système. |
| Mot de passe MySQL `root` | Se connecter au serveur MySQL comme administrateur. |

> Le compte `root` est utilisé ici pour la configuration initiale et les exercices locaux. Ne publiez jamais son mot de passe dans un dépôt GitHub ou dans un script SQL partagé.

## 5. Démarrer le serveur

1. Ouvrir ** → Réglages Système** ou **Préférences Système**, selon macOS.
2. Rechercher le panneau **MySQL**, si ce composant a été installé.
3. Vérifier l'état du serveur.
4. Si le serveur est arrêté, cliquer sur **Start MySQL Server**.
5. Autoriser l'action avec le mot de passe du Mac si nécessaire.

| État | Signification |
| --- | --- |
| **Running** | Le serveur est démarré. |
| **Stopped** | Le serveur est arrêté. |

Le démarrage automatique peut être activé dans ce panneau, selon les options disponibles.

> **Ne pas utiliser « Initialize Database » pour démarrer le serveur.** L'initialisation concerne la création ou la réinitialisation du répertoire de données.

Si le panneau n'est pas disponible, consulter la [documentation officielle du service de démarrage macOS](https://dev.mysql.com/doc/refman/8.4/en/macos-installation-launchd.html) correspondant à l'installation utilisée.

## 6. Installer MySQL Workbench

### 6.1. Télécharger l'application

1. Ouvrir [la page officielle de MySQL Workbench](https://dev.mysql.com/downloads/workbench/).
2. Choisir **macOS**.
3. Vérifier la version de macOS requise et l'architecture du paquet.
4. Télécharger le fichier **`.dmg`** compatible.

Si aucun paquet compatible n'est proposé, consulter les [archives officielles de Workbench](https://downloads.mysql.com/archives/workbench/). Une ancienne version peut être nécessaire, sans garantie de compatibilité avec les serveurs récents.

### 6.2. Installer et ouvrir Workbench

1. Double-cliquer sur le fichier **`.dmg`** téléchargé.
2. **Glisser l'icône MySQL Workbench dans le dossier Applications**.
3. Attendre la fin de la copie.
4. Ouvrir **Finder → Applications → MySQL Workbench**.
5. Confirmer l'ouverture si macOS le demande.
6. Une fois l'installation terminée, éjecter l'image disque depuis Finder.

> Le numéro de version de Workbench peut être différent de celui du serveur. Vérifier les indications de compatibilité de la version choisie, notamment si un avertissement apparaît lors de la connexion.

## 7. Créer la connexion locale

1. Ouvrir Workbench.
2. Sur la page d'accueil, repérer **MySQL Connections**.
3. Cliquer sur le bouton **`+`**.
4. Renseigner les paramètres suivants :

| Champ | Valeur |
| --- | --- |
| **Connection Name** | `MySQL Local Mac` |
| **Connection Method** | `Standard (TCP/IP)` |
| **Hostname** | `127.0.0.1` |
| **Port** | `3306` |
| **Username** | `root` |
| **Default Schema** | Laisser vide. |

5. Cliquer sur **Store in Keychain**, si cette option est proposée, pour enregistrer le mot de passe dans le trousseau macOS.
6. Saisir le mot de passe **MySQL `root`** défini pendant l'installation.
7. Cliquer sur **Test Connection**.
8. Vérifier que le test de connexion réussit.
9. Cliquer sur **OK** pour enregistrer la connexion.

**Explications :**

- `127.0.0.1` désigne le Mac sur lequel Workbench est ouvert.
- `3306` est le port MySQL par défaut ; l'adapter si le serveur a été configuré autrement.
- `root` est le compte administrateur MySQL.
- `MySQL Local Mac` est un nom libre donné à la connexion.

## 8. Exécuter une première requête

1. Sur l'accueil de Workbench, double-cliquer sur **MySQL Local Mac**.
2. Entrer le mot de passe MySQL s'il est demandé.
3. Ouvrir un nouvel onglet SQL si nécessaire.
4. Écrire :

```sql
SELECT VERSION();
```

5. Sélectionner la requête.
6. Cliquer sur l'icône **éclair** de la barre d'outils pour exécuter la sélection.

**Résultat attendu :** une grille affiche la version du serveur MySQL.

Pour vérifier également la connexion :

```sql
SELECT CURRENT_USER(), @@hostname, @@port;
```

Cette requête affiche le compte authentifié, le nom d'hôte du serveur et son port.

## 9. Créer une base et une table

Exécuter les blocs suivants dans l'ordre.

### 9.1. Créer et sélectionner la base

```sql
CREATE DATABASE IF NOT EXISTS tp_mysql;
USE tp_mysql;
```

- `CREATE DATABASE` crée la base.
- `IF NOT EXISTS` évite une erreur si elle existe déjà.
- `USE` sélectionne la base pour les instructions suivantes.

### 9.2. Créer une table

```sql
CREATE TABLE IF NOT EXISTS etudiant (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    prenom VARCHAR(100) NOT NULL
);
```

| Élément | Signification |
| --- | --- |
| `INT` | Nombre entier. |
| `AUTO_INCREMENT` | Génère automatiquement l'identifiant. |
| `PRIMARY KEY` | Identifie chaque ligne de manière unique. |
| `VARCHAR(100)` | Texte pouvant contenir jusqu'à 100 caractères. |
| `NOT NULL` | Interdit une valeur SQL `NULL`. |

### 9.3. Insérer une ligne

```sql
INSERT INTO etudiant (nom, prenom)
VALUES ('Tshibangu', 'Jean');
```

> Chaque exécution de cette instruction ajoute une nouvelle ligne. L'exécuter une seule fois pour obtenir le résultat illustré ci-dessous.

### 9.4. Consulter les données

```sql
SELECT * FROM etudiant;
```

Sur une table nouvellement créée, après une seule insertion :

| id | nom | prenom |
| --- | --- | --- |
| 1 | Tshibangu | Jean |

Dans **SCHEMAS**, à gauche, cliquer sur l'icône d'actualisation pour afficher la base `tp_mysql`, puis développer **Tables** pour voir `etudiant`.

## 10. Ouvrir et enregistrer un script SQL

### Ouvrir un fichier fourni pour le TP

1. Se connecter au serveur.
2. Choisir **File → Open SQL Script**.
3. Sélectionner le fichier **`.sql`**.
4. Lire les instructions avant l'exécution, notamment les éventuelles suppressions de tables ou de bases.
5. Vérifier que la bonne base est sélectionnée avec `USE nom_de_la_base;`.
6. Sélectionner les instructions à exécuter, puis cliquer sur l'icône éclair.

On peut également double-cliquer sur une base dans **SCHEMAS** pour la définir comme base active.

### Enregistrer son travail

1. Choisir **File → Save Script As**.
2. Donner un nom au fichier, par exemple **`premier_tp.sql`**.
3. Choisir son dossier de travail.
4. Enregistrer.

> **Un script SQL et une base de données sont différents.** Enregistrer un script conserve le texte des instructions. Pour sauvegarder les données du serveur, utiliser une procédure d'exportation, par exemple **Server → Data Export** dans Workbench.

## 11. Comprendre le fonctionnement client-serveur

Même lorsque les deux logiciels fonctionnent sur le même Mac, leur fonctionnement reste celui d'une architecture **client-serveur**.

| Étape | Ce qui se passe |
| --- | --- |
| 1. Saisie | L'utilisateur écrit `SELECT * FROM etudiant;` dans Workbench. |
| 2. Envoi | Workbench, le client, transmet la requête au serveur sur `127.0.0.1:3306`. |
| 3. Traitement | MySQL Server lit les données de la table et prépare le résultat. |
| 4. Affichage | Workbench reçoit les lignes et les affiche dans la grille de résultats. |

**Workbench sert à communiquer avec le serveur. Les données sont conservées par MySQL Server.**

## 12. Résoudre les problèmes fréquents

| Problème | Solution ou vérification |
| --- | --- |
| **Connection refused / Can't connect to MySQL server** | Démarrer MySQL Server. Vérifier l'adresse `127.0.0.1` et le port configuré, généralement `3306`. |
| **Access denied for user 'root'** | Vérifier le nom d'utilisateur et le mot de passe MySQL. Corriger le mot de passe enregistré dans le trousseau si nécessaire. |
| Workbench s'ouvre mais aucune connexion n'apparaît | Créer une connexion avec le bouton `+`. |
| Workbench est installé mais aucun serveur local ne répond | Vérifier que MySQL Community Server a également été installé et démarré. |
| L'application est incompatible avec le Mac | Vérifier l'architecture ARM/Intel et la version de macOS requise. |
| **No database selected** | Exécuter `USE tp_mysql;` ou sélectionner la base dans **SCHEMAS**. |
| La base n'apparaît pas dans **SCHEMAS** | Actualiser le panneau et vérifier que `CREATE DATABASE` a réussi. |
| **Table 'etudiant' already exists** | Vérifier si la table existe déjà. Le script de ce tutoriel utilise `IF NOT EXISTS` pour éviter cette erreur de création. |
| Plusieurs lignes identiques apparaissent | L'instruction `INSERT` a probablement été exécutée plusieurs fois. |
| Le serveur ne démarre pas | Vérifier qu'un autre serveur MySQL n'utilise pas déjà le même port et consulter le journal d'erreurs. |

### Mot de passe MySQL oublié

Le mot de passe du Mac ne remplace pas celui du compte MySQL. Consulter la [procédure officielle de réinitialisation du mot de passe root](https://dev.mysql.com/doc/refman/8.4/en/resetting-permissions.html), adaptée à la version installée.

**Ne pas réinitialiser le répertoire de données pour résoudre un simple oubli de mot de passe.**

## 13. Reprendre le travail au prochain TP

1. Vérifier que MySQL Server est démarré.
2. Ouvrir MySQL Workbench.
3. Double-cliquer sur **MySQL Local Mac**.
4. Ouvrir le script du TP ou un nouvel onglet SQL.
5. Sélectionner la base utilisée :

```sql
USE tp_mysql;
```

6. Reprendre les requêtes.

Fermer Workbench **n'arrête pas automatiquement le serveur**. Les bases et les tables restent enregistrées sur le serveur.

## 14. Checklist de validation

- [ ] J'ai identifié la version de macOS et l'architecture du Mac.
- [ ] J'ai téléchargé des paquets compatibles.
- [ ] MySQL Community Server est installé.
- [ ] Le mot de passe MySQL est conservé en lieu sûr.
- [ ] MySQL Server est démarré.
- [ ] MySQL Workbench est installé dans Applications.
- [ ] La connexion locale réussit.
- [ ] `SELECT VERSION();` renvoie un résultat.
- [ ] La base `tp_mysql` a été créée.
- [ ] La table `etudiant` contient la ligne insérée.
- [ ] Mon script est enregistré dans un fichier `.sql`.

## Documentation officielle

- [Téléchargement de MySQL Community Server](https://dev.mysql.com/downloads/mysql/)
- [Installation de MySQL 8.4 sur macOS avec le paquet natif](https://dev.mysql.com/doc/refman/8.4/en/macos-installation-pkg.html)
- [Gestion du serveur avec le panneau MySQL](https://dev.mysql.com/doc/refman/8.4/en/macos-installation-prefpane.html)
- [Téléchargement de MySQL Workbench](https://dev.mysql.com/downloads/workbench/)
- [Installation de MySQL Workbench sur macOS](https://dev.mysql.com/doc/workbench/en/wb-installing-mac.html)
- [Archives de MySQL Workbench](https://downloads.mysql.com/archives/workbench/)

