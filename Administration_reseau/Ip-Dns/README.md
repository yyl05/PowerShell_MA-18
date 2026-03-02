# DNSetIP.ps1 - Gestionnaire IP & DNS

**Auteur** : Emel Keres  
**Date** : 23.02.2026  
**Établissement** : CPNV  
**Module** : MA-18

---

## Vue d'ensemble

**DNSetIP.ps1** est un script PowerShell conçu pour simplifier l'administration réseau sous Windows. Il permet de diagnostiquer rapidement la configuration réseau d'une interface spécifique et offre une interface interactive pour basculer entre un adressage DHCP (automatique) ou statique (manuel).

Ce script regroupe les fonctionnalités de consultation et de modification en un seul outil sécurisé, destiné aux administrateurs réseau.

---

## Fonctionnalités clés

**Diagnostic en temps réel** : Affiche l'IP, la passerelle et les serveurs DNS actuels  
**Mode DHCP** : Réinitialise l'interface pour obtenir une configuration automatique  
**Mode statique** : Permet de définir manuellement l'IP, le masque et les serveurs DNS  
**Nettoyage automatique** : Supprime les anciennes configurations pour éviter les conflits d'adresses  

---

## Prérequis

- Exécuter PowerShell **en tant qu'Administrateur**
- Connaître le **nom de votre interface** réseau (ex: "Ethernet0")
- Windows 7 ou supérieur (cmdlets réseau disponibles)

---

## Utilisation du script

### Lancement

```powershell
.\DNSetIP.ps1 -InterfaceAlias "NomDeVotreInterface" -Prefix 24
