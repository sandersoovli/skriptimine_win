# loome kasutaja jaoks parool
$KasutajaParool = ConvertTo-SecureString 'Qwerty12!' -AsPlainText -Force
# loome kasutaja
New-LocalUser 'kasutaja1' -Password $KasutajaParool -FullName 'Esimene kasutaja' -Description 'local account'