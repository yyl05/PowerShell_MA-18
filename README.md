# Administration Serveur (Semaines 5 à 8)

**Objectif** : Gérer les ressources d'un serveur, surveiller son état et automatiser les tâches de maintenance avec PowerShell.

---

### 🖥️ Gestion des Services & Processus
**Notions travaillées :**
* Utilisation de `Get-Service` et `Get-Process`.
* Filtrage simple avec `Where-Object`.
* Arrêt et redémarrage de services.

**Exercices réalisés :**
* Création d'un script pour lister les services arrêtés.
* Script d'alerte si l'utilisation de la RAM dépasse 90%.
* Commande pour relancer automatiquement le service "Print Spooler" s'il plante.

---

### 💾 Gestion du Stockage & Disques
**Notions travaillées :**
* Analyse de l'espace disque avec `Get-Volume`.
* Nettoyage automatique des fichiers temporaires.
* Gestion des droits d'accès (ACL).

**Exercices réalisés :**
* Script de nettoyage qui supprime les fichiers vieux de plus de 30 jours.
* Affichage d'un avertissement si un disque dur est presque plein.
* Création automatique de dossiers de sauvegarde datés.

---

### 👤 Utilisateurs & Active Directory (AD)
**Notions travaillées :**
* Création d'utilisateurs en masse.
* Vérification des mots de passe expirés.
* Gestion des groupes de sécurité.

**Exercices réalisés :**
* Script pour créer 10 utilisateurs d'un coup à partir d'une liste.
* Vérification de qui ne s'est pas connecté au serveur depuis 3 mois.
* Reset de mot de passe simplifié via une question `Read-Host`.

---

### 🛡️ Logs & Sécurité Serveur
**Notions travaillées :**
* Lecture des journaux d'événements (`Get-EventLog`).
* Exportation de rapports en format texte ou CSV.
* Surveillance des erreurs critiques.

**Exercices réalisés :**
* Extraction des 10 dernières erreurs du système dans un fichier `rapport.txt`.
* Script qui surveille les tentatives de connexion échouées.
