<#
.NOTES
    **************************************************************
    CPNV

    Nom du script : DNSetIP.ps1
    Auteur : Emel Keres
    Date : 09.02.2026

    **************************************************************
    Modifications
    Date : -
    Auteur : -
    Raisons : -

    **************************************************************

.SYNOPSIS
    DNS et adresse IP

.DESCRIPTION
    Le script affiche la configuration IP et DNS actuelle pour une interface donnée.

.PARAMETER InterfaceAlias
    Nom de l'interface réseau (ex. "Wi-Fi", "Ethernet").

.PARAMETER PrefixLength
    Longueur du préfice de sous-réseau (ex: 24 pour 255.255.255.0).

.EXEMPLE
    .\DNSetIP.ps1 - InterfaceAlias "Wi-Fi" -PrefixLength 24
#>

param(
    [Parameter(Mandatory=$true)]
    [string]$InterfaceAlias,

    [int]$Prefix = 24
)

#####################################################################################
# Zone de définition des varibales
# $mode : permet de choisir la configuration en DHCP ou en Statique
$mode = Read-Host "`nChoisir : [D]HCP ou [S]tatique ?"

#####################################################################################
# Zone de tests

# Vérifie si l'interface existe
if ($mode -eq "D") {
    Set-NetIPInterface -InterfaceAlias $InterfaceAlias -Dhcp Enabled
    Set-DnsClientServerAddress -InterfaceAlias $InterfaceAlias -ResetServerAddresses
    Write-Host "Mode DHCP activé" -Green
}

elseif ($mode -eq "S"){
    $ip = Read-Host "IP souhaitée"
    $gw = Read-Host "Passerelle"
    $dns = Read-Host "DNS"

    Remove-NetIPAddress -InterfaceAlias $InterfaceAlias -Confirm:$false
    New-NetIPAddress -InterfaceAlias $InterfaceAlias -IPAddress $ip -PrefixLength $Prefix -DefaultGateway $gw
    Set-DnsClientServerAddress -InterfaceAlias $InterfaceAlias -ServerAddresses $dns
}

Write-Host "nNouvelle configuration" -ForegroundColor Yellow
Get-NetIPConfiguration -InterfaceAlias $InterfaceAlias