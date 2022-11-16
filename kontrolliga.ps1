# loome_kasutaja_ja_parool
$kasutajaParool = ConvertTo-SecureString "Parool1!" -AsPlainText -Force
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
# kontroll
if(!$?){
    Write-output "Tekkinud probleem kasutaja loomisega"
}
# süsteemi teaded tagasi sisse
$ErrorActionPreference = 'stop'