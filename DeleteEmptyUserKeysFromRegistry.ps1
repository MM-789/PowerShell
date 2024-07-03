#...
$RegPath= "HKLM:\software\microsoft\windows nt\currentversion\profilelist"
$Userkeys = get-childitem -path $regpath | get-itemproperty | where-object -Property ProfileImagePath -eq $null

$count = 0
Foreach ($Key in $Userkeys) {
    Remove-Item $Key.PSPath
    $count++
}
Write-Host $count . " keys deleted!"
