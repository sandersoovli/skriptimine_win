# vajalikud parameetrid
param(
$KastajaNimi,
$TaisNimi,
$KontoKirjeldus
)
#loome kasutaja jaoks parool
$KasutajaParool = ConvertTo-SecureString 'Qwerty12!' -AsPlainText -Force
# loome kasutaja
New-LocalUser $KastajaNimi -Password $KasutajaParool -FullName 'TaisNimi' -Description 'KontoKirjeldus'