# Diagnostic Réseau avec PowerShell

## Introduction

Nous allons apprendre comment utiliser **PowerShell** pour effectuer des tests de connectivité réseau et analyser la configuration réseau d’un système Windows.

Ces compétences sont essentielles pour :

* Diagnostiquer des problèmes de connectivité
* Vérifier l’état des interfaces réseau
* Analyser les routes et connexions actives
* Optimiser les performances réseau

La gestion des paramètres réseau peut rapidement devenir complexe pour les administrateurs système. PowerShell permet d’automatiser ces diagnostics de manière fiable et reproductible.

---

## Prérequis

* Windows 10 / Windows Server 2016 ou plus récent
* PowerShell 5.1 ou supérieur
* Droits administrateur pour certaines commandes

---

## Tester la connectivité réseau

### Test-Connection

Équivalent de la commande `ping`, elle permet de vérifier si une machine distante est joignable.

```powershell
Test-Connection google.com
```

Exemple avec un nombre de requêtes défini :

```powershell
Test-Connection google.com -Count 4
```

---

### Test-NetConnection

Commande plus avancée que `Test-Connection`, elle permet de tester la connectivité réseau ainsi que des ports spécifiques.

```powershell
Test-NetConnection google.com
```

Test d’un port spécifique (ex: HTTPS) :

```powershell
Test-NetConnection google.com -Port 443
```

---

## Informations sur la configuration réseau

### Get-NetIPAddress

Affiche les adresses IP configurées sur le système.

```powershell
Get-NetIPAddress
```

---

### Get-NetIPConfiguration

Affiche une vue complète de la configuration réseau (IP, passerelle, DNS).

```powershell
Get-NetIPConfiguration
```

---

### Get-NetAdapter

Liste les interfaces réseau disponibles et leur état.

```powershell
Get-NetAdapter
```

Afficher uniquement les interfaces actives :

```powershell
Get-NetAdapter | Where-Object Status -eq "Up"
```

---

## Gestion des interfaces réseau

### Enable-NetAdapter

Active une interface réseau.

```powershell
Enable-NetAdapter -Name "Ethernet"
```

---

### Disable-NetAdapter

Désactive une interface réseau.

```powershell
Disable-NetAdapter -Name "Ethernet"
```

Cette commande peut couper la connexion réseau distante. Donc faire attention à l'usage

---

## Analyse du routage réseau

### Get-NetRoute

Affiche la table de routage du système.

```powershell
Get-NetRoute
```

---

## Analyse des connexions TCP

### Get-NetTCPConnection

Affiche les connexions TCP actives sur le système.

```powershell
Get-NetTCPConnection
```

Filtrer par état :

```powershell
Get-NetTCPConnection | Where-Object State -eq "Established"
```

---

## Exemple de scénario de diagnostic

1. Vérifier l’état de la carte réseau (`Get-NetAdapter`)
2. Vérifier la configuration IP (`Get-NetIPConfiguration`)
3. Tester la connectivité locale et distante (`Test-Connection`)
4. Tester les ports réseau (`Test-NetConnection`)
5. Analyser les routes (`Get-NetRoute`)
6. Examiner les connexions actives (`Get-NetTCPConnection`)

---

## Conclusion


