# Diagnostic Réseau avec PowerShell

---

## Informations Générales

| Élément | Détail |
|---------|--------|
| **Sous-thème** | Diagnostic réseau |
| **Élève** | Adin Durakovic |
| **Domaine** | Administration système & Réseau |

---

## ANALYSE

Le diagnostic réseau est une étape essentielle pour identifier l’origine d’un problème de connectivité.

Lorsqu’un utilisateur ne peut pas accéder à Internet ou à une ressource réseau, il est nécessaire de vérifier plusieurs éléments :

- L’état de la connexion réseau
- La configuration IP
- La résolution DNS
- L’accessibilité des ports
- Les routes réseau
- Les connexions actives

PowerShell fournit des outils efficaces permettant d’analyser rapidement ces différents points.

---

## Notions Clés

### Identifier un problème de connectivité
Vérifier si une machine distante est joignable.

### Vérifier la configuration IP
Contrôler l’adresse IP, la passerelle et les serveurs DNS.

### Tester les ports réseau
Vérifier si un service (HTTPS, RDP, etc.) est accessible.

### Analyser les routes
Examiner la table de routage du système.

### Examiner les connexions actives
Identifier les connexions TCP en cours.

---

## Commandes PowerShell Essentielles

| Commande | Description |
|----------|-------------|
| `Test-Connection` | Teste la connectivité (équivalent ping) |
| `Test-NetConnection` | Teste la connectivité et les ports |
| `Get-NetIPConfiguration` | Affiche la configuration IP complète |
| `Get-NetRoute` | Affiche la table de routage |
| `Get-NetTCPConnection` | Affiche les connexions TCP actives |
| `Resolve-DnsName` | Vérifie la résolution DNS |

---

## Analyse des Commandes

### 1. Test-Connection

Permet de vérifier si une machine distante répond.

Analyse :
- Réponse rapide (< 20 ms) : Connexion correcte
- Latence élevée : Possible congestion réseau
- Aucune réponse : Problème réseau ou pare-feu

---

### 2. Test-NetConnection

Permet de tester un port spécifique.

Exemples :
- Port 443 : HTTPS
- Port 3389 : RDP

Analyse :
- `TcpTestSucceeded : True` : Service accessible
- `TcpTestSucceeded : False` : Port bloqué ou service arrêté

---

### 3. Get-NetIPConfiguration

Permet de vérifier :

- Adresse IP
- Passerelle par défaut
- Serveurs DNS

Analyse :
- Adresse `169.254.x.x` : Problème DHCP
- Pas de passerelle : Impossible d’accéder à Internet
- DNS incorrect : Problème de résolution des noms

---

### 4. Get-NetRoute

Affiche la table de routage.

Analyse :
- Vérifier la présence de la route par défaut (`0.0.0.0/0`)
- Identifier d’éventuelles routes incorrectes

---

### 5. Get-NetTCPConnection

Permet d’analyser les connexions TCP actives.

Analyse :
- Trop de connexions `TIME_WAIT` : Possible surcharge
- Connexions inhabituelles : Vérification de sécurité recommandée

---

## Exemple de Scénario de Diagnostic

1. Vérifier la configuration IP  
   `Get-NetIPConfiguration`

2. Tester la passerelle locale  
   `Test-Connection`

3. Tester une IP publique  
   `Test-Connection 8.8.8.8`

4. Tester un nom de domaine  
   `Test-Connection google.com`

5. Tester un port spécifique  
   `Test-NetConnection google.com -Port 443`

6. Vérifier les routes  
   `Get-NetRoute`

7. Examiner les connexions actives  
   `Get-NetTCPConnection`

---

## Objectifs d'Apprentissage

- Maîtriser les commandes PowerShell de diagnostic réseau  
- Identifier les problèmes de connectivité  
- Interpréter correctement les résultats  
- Appliquer une méthodologie structurée  

---

## Conclusion

Le diagnostic réseau avec PowerShell permet d’identifier rapidement l’origine d’un problème de connectivité.

En suivant une méthode structurée et en interprétant correctement les résultats des commandes, il est possible de :

- Réduire le temps d’intervention  
- Éviter des manipulations inutiles  
- Améliorer l’efficacité du dépannage  
- Professionnaliser la gestion des incidents réseau  

---

Adin Durakovic  
Diagnostic Réseau avec PowerShell
