# Résumé Technique : Surveillance des Services PowerShell

Ce document présente l'analyse de l'exercice d'administration serveur concernant la gestion des services Windows.

---

## Présentation de la Notion
La gestion des **services** est un pilier de l'administration serveur. Un service est un programme qui tourne en arrière-plan (ex: serveur web, base de données). 
L'objectif technique ici est de savoir **interroger le système** pour isoler les composants en panne ou arrêtés.

---

## Aspects Techniques
Le script utilise le concept de **Pipeline (`|`)**, qui permet de faire passer les données d'une commande à une autre pour les filtrer.

### Analyse du code :
1. **`Get-Service`** : Commande qui va chercher la liste de tous les services installés.
2. **`Where-Object`** : Le "filtre". On demande à PowerShell de ne garder que les objets où le statut est égal (`-eq`) à "Stopped".
3. **`Select-Object`** : Le "nettoyage". On choisit d'afficher uniquement le **Nom** et le **Statut** pour éviter d'avoir un tableau trop chargé.

---

## Analyse du Script

| Point Analysé | Observation |
| :--- | :--- |
| **Efficacité** | Le script est très rapide et consomme peu de ressources serveur. |
| **Lisibilité** | L'utilisation de `Write-Host` permet de donner un titre clair à l'utilisateur. |
| **Précision** | Le filtrage est exact, mais il ne fait pas de différence entre un service arrêté normalement et un service en erreur. |

---

## Conclusion & Perspectives
Cet exercice pose les bases du **monitoring** (surveillance).
