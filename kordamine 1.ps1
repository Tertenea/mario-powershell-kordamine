#P.Kiviorg
#13.12.2022
#Nimed emailist

$skriptiAsukoht = $MyInvocation.MyCommand.Path
$dir = Split-Path $skriptiAsukoht

$fail = Read-Host -Prompt "Sisesta csv faili nimi"
if($fail -like '*.csv*') {$import = Import-Csv $dir\$fail} 
else {Write-Host "Antud fail pole csv fail"}
foreach ($User in $import)
{
$email = $User.emails
$nimiemailis = $email.split("@")[0]

$enimi = $nimiemailis.Split(".")[0]
$pnimi = $nimiemailis.Split(".")[1]

$krenimi = $enimi.substring(0,1).toupper()+$enimi.substring(1).tolower()
$krpnimi = $pnimi.substring(0,1).toupper()+$pnimi.substring(1).tolower()

$krenimi+" "+$krpnimi >> $dir\nimed.txt
}