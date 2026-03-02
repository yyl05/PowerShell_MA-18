Write-Host "===== DIAGNOSTIC RESEAU =====" -ForegroundColor Cyan

# 1. Test connexion Internet (IP)
Write-Host "`nTest connexion Internet (10.229.60.22)..."

if (Test-Connection 10.229.60.22 -Count 2 -Quiet) {
    Write-Host "Connexion Internet OK" -ForegroundColor Green
} else {
    Write-Host "Pas de connexion Internet !" -ForegroundColor Red
}

# 2. Test résolution DNS
Write-Host "`nTest resolution DNS (cpnv.ch)..."

if (Test-Connection cpnv.ch -Count 2 -Quiet) {
    Write-Host "DNS fonctionne correctement" -ForegroundColor Green
} else {
    Write-Host "Probleme DNS detecte !" -ForegroundColor Red
}

# 3. Test port HTTPS (443)
Write-Host "`nTest du port 443 (HTTPS)..."

$testPort = Test-NetConnection google.com -Port 443

if ($testPort.TcpTestSucceeded) {
    Write-Host "Port 443 accessible" -ForegroundColor Green
} else {
    Write-Host "Port 443 bloque ou inaccessible" -ForegroundColor Red
}

Write-Host "`n===== FIN DU DIAGNOSTIC =====" -ForegroundColor Cyan

