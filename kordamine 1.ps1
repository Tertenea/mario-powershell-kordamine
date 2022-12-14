#P.Kiviorg
#13.12.2022
#Nimed emailist
$loop = 1
while($loop -eq 1)
{
$skriptiAsukoht = $MyInvocation.MyCommand.Path
$dir = Split-Path $skriptiAsukoht

$fail = Read-Host -Prompt "Sisesta csv faili nimi"
if($fail -like "*.csv*")
{
$loop = 0
$import = Import-Csv $dir\$fail
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
}
else {Write-Host "Antud fail pole csv fail"}
}