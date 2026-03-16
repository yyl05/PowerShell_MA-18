

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

Les adaptateurs réseau sont essentiels au fonctionnement d'un système informatique connecté. PowerShell permet de les administrer efficacement via des cmdlets dédiées.

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



# Exercice PowerShell – Gestion d’un adaptateur réseau
Créer un script PowerShell qui permet de vérifier et d’activer un adaptateur réseau.

## Consigne

Le script doit :

1. **Afficher** la liste des adaptateurs réseau de l’ordinateur.
2. **Demander** à l’utilisateur de saisir le nom d’un adaptateur.
3. **Vérifier** si l’adaptateur existe :
   - S’il n’existe pas → afficher un message d’erreur et arrêter le script.
4. S’il existe :
   - Vérifier s’il est **activé ou désactivé**.
   - S’il est déjà activé → afficher un message indiquant que tout est normal.
   -  S’il est désactivé → l’activer.
5. **Vérifier à nouveau** son état.
6. **Afficher un message final** indiquant le résultat.
7. **Terminer le script proprement.**

## Contraintes

- Utiliser les cmdlets PowerShell adaptées (`Get-NetAdapter`, `Enable-NetAdapter`).
- Le script doit être exécuté en tant qu’administrateur.
---
## Conclusion

Les adaptateurs réseau servent à connecter un ordinateur à un réseau, que ce soit en filaire (Ethernet) ou en sans-fil (Wi-Fi). Ils permettent l’échange de données entre l’ordinateur et d’autres appareils, ainsi que l’accès à Internet.

Grâce à des outils comme PowerShell, il est possible de les gérer facilement : vérifier leur état, les activer ou les désactiver, consulter leur configuration IP et diagnostiquer d’éventuels problèmes.

En résumé, les adaptateurs réseau sont indispensables au bon fonctionnement des communications informatiques, et savoir les administrer est une compétence essentielle en administration système et réseau.
