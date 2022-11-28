# location of AD users file
$file = "C:\Users\Administrator\Documents\adusers.csv"
# import file content
$users = Import-CSV $file -Encoding Default -Delimiter ";"
# foreach user data row in file
foreach ($user in $users){
    # username is firstname.lastname
    $username = $user.FirstName + "." + $user.LastName
    $username = $username.ToLower()
    $username = Translit($username)
    # user principal name
    $upname = $username + "@sv-kool.local"
    # display name - eesnimi + perenimi
    $displayname = $user.FirstName + " " + $user.LastName
    New-ADUser -Name $username `
        -DisplayName $displayname `
        -GivenName $user.FirstName `
        -Surname $user.LastName `
        -Department $user.Department `
        -Title $user.Role `
        -UserPrincipalName $upname `
        -AccountPassword (ConvertTo-SecureString $user.Password -AsPlainText -Force) -Enabled $true
}
# function translit UTF-8 characters to LATIN
function Translit {
    # function use as parameter string to translit
    param(
        [string] $inputString
    )
    # define the characters wich have to be translited
        $Translit =@{
        [char]'ä' = "a"
        [char]'ö' = "o"
        [char]'ü' = "u"
        [char]'õ' = "o"
        }
    # create translited output
    $outputString=""
    # transfer string to array of characters and by character
    foreach ($character in $inputCharacter = $inputString.ToCharArray())
    {
        # if character is exsists in list of character for transliting
        if ($Translit[$character] -cne $null ){
            # add to output translited character
            $outputString += $Translit[$character]
        } else {
            # otherwise add the initial character
            $outputString += $character
        }
    }
    Write-Output $outputString
}

#konto_kustutamine
Remove-LocalUser  $kasutajanimi
if(!$?){

Echo "Viga! kontot ei eksisteeri."
}
else
{
Echo "Konto $kasutajanimi on kustutatud"
}
$ErrorActionPreference = "Stop"