# Diagnostic Réseau avec PowerShell

## Introduction

Nous allons apprendre comment utiliser **PowerShell** pour effectuer des tests de connectivité réseau et analyser la configuration réseau d’un système Windows.

Ces compétences sont essentielles pour :

- Diagnostiquer des problèmes de connectivité  
- Vérifier l’état des interfaces réseau  
- Analyser les routes et connexions actives  
- Optimiser les performances réseau  

La gestion des paramètres réseau peut rapidement devenir complexe pour les administrateurs système. PowerShell permet d’automatiser ces diagnostics de manière fiable et reproductible.

---

## Prérequis

- Windows 10 / Windows Server 2016 ou plus récent  
- PowerShell 5.1 ou supérieur  
- Droits administrateur pour certaines commandes  

---

# Tester la connectivité réseau

## Test-Connection

Équivalent de la commande `ping`, elle permet de vérifier si une machine distante est joignable.

```powershell
Test-Connection google.com
```

Exemple avec un nombre de requêtes défini :

```powershell
Test-Connection google.com -Count 4
```

---

## Test-NetConnection

Commande plus avancée que `Test-Connection`, elle permet de tester la connectivité réseau ainsi que des ports spécifiques.

```powershell
Test-NetConnection google.com
```

Test d’un port spécifique (ex : HTTPS) :

```powershell
Test-NetConnection google.com -Port 443
```

---

# Informations sur la configuration réseau

## Get-NetIPAddress

Affiche les adresses IP configurées sur le système.

```powershell
Get-NetIPAddress
```

---

## Get-NetIPConfiguration

Affiche une vue complète de la configuration réseau (IP, passerelle, DNS).

```powershell
Get-NetIPConfiguration
```

---

## Get-NetAdapter

Liste les interfaces réseau disponibles et leur état.

```powershell
Get-NetAdapter
```

Afficher uniquement les interfaces actives :

```powershell
Get-NetAdapter | Where-Object Status -eq "Up"
```

---

# Gestion des interfaces réseau

## Enable-NetAdapter

Active une interface réseau.

```powershell
Enable-NetAdapter -Name "Ethernet"
```

---

## Disable-NetAdapter

Désactive une interface réseau.

```powershell
Disable-NetAdapter -Name "Ethernet"
```

⚠️ Cette commande peut couper la connexion réseau distante. Faire attention à l'usage.

---

# Analyse du routage réseau

## Get-NetRoute

Affiche la table de routage du système.

```powershell
Get-NetRoute
```

---

# Analyse des connexions TCP

## Get-NetTCPConnection

Affiche les connexions TCP actives sur le système.

```powershell
Get-NetTCPConnection
```

Filtrer par état :

```powershell
Get-NetTCPConnection | Where-Object State -eq "Established"
```

---

# Analyse approfondie des résultats

## Analyse de la connectivité

### Interprétation de Test-Connection

Points importants à analyser :

- **Latency (ResponseTime)**  
  - < 10 ms → Réseau local performant  
  - 10–50 ms → Connexion correcte  
  - > 100 ms → Possible latence réseau ou problème WAN  

- **Perte de paquets (Packet Loss)**  
  - 0% → Normal  
  - > 0% → Problème potentiel (Wi-Fi instable, surcharge, câble défectueux)

Si la commande échoue totalement :

- Vérifier la résolution DNS  
- Vérifier la passerelle par défaut  
- Tester une IP directe (ex : `8.8.8.8`) pour exclure un problème DNS  

---

### Interprétation de Test-NetConnection

Points clés :

- **TcpTestSucceeded : True**
  - Le port distant est ouvert  

- **TcpTestSucceeded : False**
  - Port bloqué (firewall, service arrêté, filtrage réseau)

Exemples :

- Port 443 fermé → Service HTTPS indisponible  
- Port 3389 fermé → RDP inaccessible  

Cela permet d’identifier si le problème est :

- Réseau  
- Pare-feu  
- Service applicatif  

---

## Analyse de la configuration IP

Avec `Get-NetIPConfiguration`, vérifier :

1. Adresse IP valide  
   - 169.254.x.x → Problème DHCP (APIPA)

2. Passerelle par défaut configurée  
   - Absente → Impossible d’accéder à Internet

3. Serveurs DNS corrects  
   - Mauvais DNS → Résolution de noms impossible

---

## Analyse des interfaces réseau

Avec `Get-NetAdapter`, contrôler :

- **Status = Up** → Interface active  
- **Status = Disconnected** → Câble débranché ou Wi-Fi non connecté  
- **Speed faible ou fluctuante** → Possible problème matériel  

---

## Analyse de la table de routage

Avec `Get-NetRoute`, vérifier :

- Présence d’une route par défaut (`0.0.0.0/0`)  
- Routes statiques incorrectes  
- Conflits de métriques  

Une mauvaise route peut empêcher l’accès à certains réseaux.

---

## Analyse des connexions TCP

Avec `Get-NetTCPConnection`, examiner :

- Trop de connexions en **TIME_WAIT** → Possible surcharge  
- Nombre élevé de connexions **Established** vers une IP suspecte  
- Ports locaux ouverts inattendus → Risque de sécurité  

---

# Méthodologie de diagnostic structurée

Lors d’un incident réseau, suivre cet ordre logique :

1. Vérifier l’interface réseau (`Get-NetAdapter`)  
2. Vérifier la configuration IP (`Get-NetIPConfiguration`)  
3. Tester la passerelle locale  
4. Tester une IP publique  
5. Tester un nom de domaine  
6. Tester un port spécifique  
7. Vérifier les routes  
8. Examiner les connexions actives  

---

# Problèmes courants et causes possibles

| Symptôme | Cause probable |
|----------|---------------|
| IP 169.254.x.x | DHCP inaccessible |
| Ping IP OK mais pas le nom | Problème DNS |
| Port fermé mais ping OK | Firewall ou service arrêté |
| Latence élevée | Saturation réseau |
| Connexions bloquées | Route incorrecte |

---

# Bonnes pratiques

- Toujours tester **IP puis DNS**  
- Documenter les résultats  
- Automatiser les diagnostics  
- Comparer avec un poste fonctionnel  
- Vérifier les journaux système si nécessaire  

---

# Conclusion

PowerShell est un outil puissant pour diagnostiquer les problèmes réseau sous Windows.  

La clé n’est pas seulement d’exécuter les commandes, mais de savoir **interpréter les résultats et corréler les informations** afin d’identifier rapidement la source d’un incident.

Une approche méthodique permet :

- De réduire le temps de diagnostic  
- D’éviter des interventions inutiles  
- D’améliorer la fiabilité du réseau  
- De professionnaliser les procédures de dépannage  
