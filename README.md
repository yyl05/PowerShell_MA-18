# Administration serveur (Semaines 5 à 8)

### Diagnostic des Services Windows
**Objectif** : Apprendre à surveiller l'état des composants du serveur avec PowerShell.

# Notions travaillées
- [ ] Utilisation de la cmdlet `Get-Service`
- [ ] Filtrage avec `Where-Object`
- [ ] Sélection de colonnes avec `Select-Object`
- [ ] Affichage de texte avec `Write-Host`

## Exercice réalisé : Liste des services arrêtés
Création d'un script de diagnostic rapide pour identifier les pannes potentielles sur le serveur.

**Fonctionnalités du script :**
- Récupérer tous les services installés sur la machine.
- Isoler uniquement les services qui ne fonctionnent pas (`Stopped`).
- Afficher un message clair pour l'administrateur.
- Présenter un tableau propre avec uniquement le **Nom** et le **Statut**.
