$services = Get-Service 
$stopped = $services | Where-Object {$_.Status -eq "Stopped"} 

Write-Host "Services arrêtés :" 

$stopped | Select-Object Name, Status
