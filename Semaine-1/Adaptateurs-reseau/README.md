

# 🌐 Administration des Adaptateurs Réseau avec PowerShell  <img src="https://raw.githubusercontent.com/PowerShell/PowerShell/master/assets/Powershell_256.png" width="40" alt="PowerShell Logo">

---

## 📚 Informations Générales

| Élément | Détail |
|---------|--------|
| **Sous-thème** | Adaptateurs réseau |
| **Élève** | Adin Durakovic |
| **Domaine** | Administration système & Réseau |

---

## ANALYSE

Les adaptateurs réseau sont **essentiels au fonctionnement** d'un système informatique connecté. PowerShell permet de les administrer efficacement via des **cmdlets dédiées**.

---

## Notions Clés

### Identifier les adaptateurs réseau
Découvrir et lister tous les adaptateurs disponibles

### Vérifier leur état (activé / désactivé)
Contrôler le statut opérationnel de chaque interface

### Activer / désactiver un adaptateur
Gérer l'activation et la désactivation des interfaces

### Obtenir les informations IP
Récupérer les configurations d'adresses IP

### Diagnostiquer des problèmes simples
Identifier et résoudre les dysfonctionnements

---

## Commandes PowerShell Essentielles

| Commande | Description |
|----------|-------------|
| `Get-NetAdapter` | Liste tous les adaptateurs réseau |
| `Get-NetIPAddress` | Affiche les adresses IP configurées |
| `Enable-NetAdapter` | Active un adaptateur |
| `Disable-NetAdapter` | Désactive un adaptateur |
| `Get-NetAdapterStatistics` | Statistiques de l'adaptateur |
|`Get-Process -Confirm:$false`|	Obtient la liste des processus actifs sans demander de confirmation |
|`Remove-Item -Confirm:$false`| Supprime un élément sans demander de confirmation |


	



	

---

## Objectifs d'apprentissage

- [ ] Maîtriser les commandes PowerShell réseau ci dessus
- [ ] Identifier les problèmes de connectivité
- [ ] Configurer et gérer les adaptateurs
- [ ] Interpréter les diagnostics réseau

---

**Adin Durakovic** | *Adaptateurs réseau*
