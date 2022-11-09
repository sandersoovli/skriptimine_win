# kontroll parameetrite arvule
if($args.Count -ne 3){
    echo ".\skriptifailnimi.ps1 kasutajanimi täisnimi kirjeldus"
} else{
    # vajalikud parameetrid
    $KastajaNimi = $args[0]
    $TaisNimi = $args[1]
    $KontoKirjeldus = $args[2]
    #loome kasutaja jaoks parool
$KasutajaParool = ConvertTo-SecureString 'Qwerty12!' -AsPlainText -Force
    # loome kasutaja
New-LocalUser $KastajaNimi -Password $KasutajaParool -FullName 'TaisNimi' -Description 'KontoKirjeldus'
}