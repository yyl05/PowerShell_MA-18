Auteur : Emel Keres
Date : 23.02.2026
Établissement : CPNV

DNSetIP.ps1 - Gestionnaire IP & DNS

Ce script PowerShell permet de diagnostiquer rapidement la configuration réseau d'une interface spécifique et offre une interface interactive pour basculer entre un adressage DHCP (automatique) ou Statique (manuel).

Description :
Dans le cadre du module MA-18, ce script a été conçu pour simplifier l'administration réseau sous Windows. Il regroupe les fonctionnalités de consultation et de modification en un seul outil sécurisé.

Les fonctionnalités clés :
Un diagnostic en temps réel : Il affiche l'IP, la passerelle et les serveurs DNS actuels.
En mode DHCP : Réinitialise l'interface pour obtenir une configuration automatique.
En mode statique : Il permet de définir manuellement l'IP, le masque et le DNS.
Nettoyage automatique : Supprime les anciennes configurations pour éviter les conflits d'adresses.

L'utilisation du script
Quelques prérequis:
Exécuter PowerShell en tant qu'Administrateur.
Connaître le nom de votre interface (ex: "Ethernet0").
Lancement du script
Ouvrez un terminal dans le dossier du script et utilisez la commande suivante :
powershell
.\DNSetIP.ps1 -InterfaceAlias "NomDeVotreInterface" -Prefix 24
Utilisez le code avec précaution.

Note : Si vous ne connaissez pas le nom de votre interface, il faudra tapez Get-NetAdapter.
Les paramètres :
Paramètre	Type	Description	Obligatoire
-InterfaceAlias	String	Le nom de la carte réseau (ex: "Ethernet0").	Oui
-Prefix	Int	Longueur du masque de sous-réseau (ex: 24).	Non (défaut: 24)

La structure du Code (Conception)
Le script suit une logique modulaire :
Diagnostic : Utilisation de Get-NetIPConfiguration pour l'état initial.
Interaction : Menu de choix via Read-Host.
Application : Utilisation de New-NetIPAddress et Set-DnsClientServerAddress.
Vérification : Affichage final des changements.
Avertissement (!)
La modification des paramètres réseau peut couper votre connexion internet. Assurez-vous d'avoir les bonnes adresses IP avant d'appliquer le mode Statique.
