# loome_kasutaja_ja_parool
Add-Type -AssemblyName 'System.Web'
$parool_tekstina = [System.Web.Security.Membership]::GeneratePassword(8, 2)
echo $parool_tekstina
$kasutajaParool = ConvertTo-SecureString $parool_tekstina -AsPlainText -Force
# küsime kasutaja andmeds
$Eesnimi = Read-Host "Sisesta oma Eesnimi"
$Perenimi = Read-Host "Sisesta oma Perenimi"
# loome_kasutajanimi
$kasutajanimi = $Eesnimi.ToLower() + "." + $Perenimi.ToLower()
# taisnime loomine
$Taisnimi = $Eesnimi + "." + $Perenimi
# kontokirjeldus
$kasutajakirjeldus = "Lokaalne_konto -" + $kasutajanimi
New-LocalUser $kasutajanimi -Password $kasutajaParool -FullName $Taisnimi -Description $kasutajakirjeldus
$ErrorActionPreference = 'stop'