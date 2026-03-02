#Durakovic Adin


# Afficher la liste des adaptateurs réseau
Write-Host "Liste des adaptateurs réseau disponibles :" -ForegroundColor Cyan
Get-NetAdapter | Format-Table -AutoSize

# Demander à l'utilisateur le nom de l'adaptateur
$adapterName = Read-Host "`nEntrez le nom de l'adaptateur à vérifier"

# Vérifier si l'adaptateur existe
$adapter = Get-NetAdapter -Name $adapterName -ErrorAction SilentlyContinue

if (-not $adapter) {
    Write-Host "Erreur : L'adaptateur '$adapterName' n'existe pas." -ForegroundColor Red
    exit
}

Write-Host "`nAdaptateur trouvé : $($adapter.Name)" -ForegroundColor Green
Write-Host "État actuel : $($adapter.Status)"

# Vérifier si l'adaptateur est activé
if ($adapter.Status -eq "Up") {
    Write-Host "L'adaptateur est déjà activé." -ForegroundColor Yellow
}
else {
    Write-Host "L'adaptateur est désactivé. Activation en cours..." -ForegroundColor Cyan
    
    Enable-NetAdapter -Name $adapterName -Confirm:$false
    
    # Vérifier le nouvel état
    Start-Sleep -Seconds 2
    $adapter = Get-NetAdapter -Name $adapterName

    if ($adapter.Status -eq "Up") {
        Write-Host "Succès : L'adaptateur est maintenant activé." -ForegroundColor Green
    }
    else {
        Write-Host "Attention : L'adaptateur n'a pas pu être activé." -ForegroundColor Red
    }
}

Write-Host "`nFin du script."