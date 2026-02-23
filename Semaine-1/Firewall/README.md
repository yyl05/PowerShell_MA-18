# 🔐 Gestion du Windows Defender Firewall avec PowerShell

---

##  Introduction

### Présentation du sujet

Ce module couvre la gestion complète du **Windows Defender Firewall** en utilisant **PowerShell**. Le firewall Windows est un élément critique de la sécurité des systèmes d'exploitation Windows, permettant de contrôler les connexions réseau entrantes et sortantes.

### Objectif du module

L'objectif de ce projet est d'acquérir les compétences suivantes :
-  Comprendre les principes fondamentaux du firewall Windows
-  Créer et modifier des règles de firewall avec PowerShell
-  Automatiser la gestion de la sécurité réseau
-  Implémenter des politiques de sécurité cohérentes et efficaces

---

##  Analyse

### Rôle du firewall Windows

Le Windows Defender Firewall est un **système de filtrage de paquets** qui :
- Contrôle le trafic réseau entrant et sortant
- Applique des règles basées sur les adresses IP, les ports et les protocoles
- Protège le système contre les accès non autorisés
- Peut être configuré par application ou par port

### Importance de la sécurité réseau

La sécurité réseau est un **pilier fondamental** de la cybersécurité. Un firewall bien configuré :
-  Réduit la surface d'attaque
-  Prévient les accès non autorisés
-  Limite la propagation de malwares
-  Assure la conformité réglementaire

### Concepts clés du Firewall

| Concept | Description | Exemple |
|---------|-------------|---------|
| **Direction** | Sens du trafic | Inbound (entrée), Outbound (sortie) |
| **Action** | Décision appliquée | Allow (autoriser), Block (bloquer) |
| **Protocol** | Protocole de transport | TCP, UDP, ICMP |
| **Port** | Point de communication | 80 (HTTP), 443 (HTTPS), 23 (Telnet) |
| **Profil** | Contexte réseau | Domain (domaine), Private (privé), Public (public) |

####  Direction du trafic

| Direction | Définition |
|-----------|-----------|
| **Inbound** | Trafic entrant vers le système |
| **Outbound** | Trafic sortant du système |

####  Protocoles de transport

- **TCP (Transmission Control Protocol)** : Protocole orienté connexion, fiable, utilisé pour HTTP, HTTPS, FTP
- **UDP (User Datagram Protocol)** : Protocole sans connexion, rapide, utilisé pour DNS, VoIP
- **ICMP** : Protocole de contrôle, utilisé pour le ping

####  Profils de firewall

| Profil | Utilisation |
|--------|------------|
| **Domain** | Ordinateurs connectés à un domaine Active Directory |
| **Private** | Réseaux privés de confiance (domicile, petit bureau) |
| **Public** | Réseaux publics non sécurisés (WiFi public, hôtel) |

---

##  Conception

### Description logique de la solution

Notre solution propose la création d'une **règle de firewall automatisée** qui :
1. Bloque le port 23 (Telnet) en trafic entrant
2. S'applique au profil Private
3. Utilise le protocole TCP
4. Peut être facilement gérée et vérifiée

### Diagramme de flux

```
┌─────────────────────────────────┐
│   Demande de trafic entrant     │
│   Port 23 (Telnet) - TCP        │
└────────────┬────────────────────┘
             │
             ▼
┌─────────────────────────────────┐
│  Profil = Private ?             │
└────────────┬────────────────────┘
             │
             ▼
┌─────────────────────────────────┐
│  Règle "Bloquer Telnet" active? │
└────────────┬────────────────────┘
             │
        ✓ Oui
             │
             ▼
┌────────────────────────────────���┐
│     BLOQUER la connexion      │
└─────────────────────────────────┘
```

### Logique d'implémentation

**Avant de créer une règle, il faut toujours :**

1. ✓ Vérifier si la règle existe déjà
2. ✓ Éviter les doublons et conflits
3. ✓ Documenter l'action effectuée
4. ✓ Valider le résultat

---

##  Exercice

### Consigne

**Créer une règle PowerShell qui bloque le port 23 (Telnet) en trafic entrant sur le profil Private.**

### Objectifs

- [ ] Comprendre la structure d'une commande `New-NetFirewallRule`
- [ ] Implémenter la règle de blocage de Telnet
- [ ] Vérifier que la règle est correctement appliquée
- [ ] Documenter la configuration

---

##  Implémentation

### Création de la règle

La commande suivante crée une règle de firewall qui bloque le trafic Telnet entrant :

```powershell
New-NetFirewallRule `
-DisplayName "Bloquer Telnet" `
-Direction Inbound `
-Protocol TCP `
-LocalPort 23 `
-Profile Private `
-Action Block
```

**Détail des paramètres :**

| Paramètre | Valeur | Description |
|-----------|--------|-------------|
| `-DisplayName` | "Bloquer Telnet" | Nom affiché dans l'interface du firewall |
| `-Direction` | Inbound | Applique la règle au trafic entrant |
| `-Protocol` | TCP | Utilise le protocole TCP |
| `-LocalPort` | 23 | Cible le port 23 (Telnet) |
| `-Profile` | Private | S'applique aux réseaux privés |
| `-Action` | Block | Bloque les connexions correspondantes |

### Vérification de la règle

Pour confirmer que la règle a été correctement créée, exécutez :

```powershell
Get-NetFirewallRule -DisplayName "Bloquer Telnet"
```

**Résultat attendu :**

```
Name                : Bloquer Telnet
DisplayName         : Bloquer Telnet
Description         :
Direction           : Inbound
Enabled             : True
Action              : Block
Profile             : Private
...
```

### Commandes supplémentaires utiles

**Voir tous les paramètres de la règle :**

```powershell
Get-NetFirewallRule -DisplayName "Bloquer Telnet" | Format-List
```

**Modifier la règle :**

```powershell
Set-NetFirewallRule -DisplayName "Bloquer Telnet" -Enabled $false
```

**Supprimer la règle :**

```powershell
Remove-NetFirewallRule -DisplayName "Bloquer Telnet"
```

---

##  Conclusion

### Résumé

Ce module a démontré comment utiliser **PowerShell** pour gérer le **Windows Defender Firewall** de manière efficace et professionnelle. Nous avons :

-  Compris les concepts fondamentaux du firewall
-  Créé une règle de blocage pour le service Telnet
-  Vérifié l'application correcte de la règle
-  Automatisé une tâche de sécurité critique

### Importance de l'automatisation avec PowerShell

L'automatisation des tâches de sécurité réseau apporte de nombreux avantages :

| Avantage | Bénéfice |
|----------|----------|
| **Rapidité** | Exécution instantanée, aucun délai |
| **Cohérence** | Résultats identiques à chaque exécution |
| **Scalabilité** | Appliquer des règles à des centaines de machines |
| **Auditabilité** | Tracer toutes les modifications |
| **Réduction des erreurs** | Éliminer les erreurs manuelles |
| **Conformité** | Respecter les politiques de sécurité |

### Prochaines étapes

Pour aller plus loin :
- 🔗 Explorer les profils de groupe (Group Policy)
- 🔗 Créer des scripts de déploiement massif
- 🔗 Implémenter la journalisation du firewall
- 🔗 Automatiser l'audit de sécurité

---

##  Informations supplémentaires

**Auteur :** Mateo  
**Date de création :** 2026-02-23  
**Environnement :** Windows 10/11 avec PowerShell 5.1+  
**Privilèges requis :** Administrateur


