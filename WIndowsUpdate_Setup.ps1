#Powershell Version prüfen:
if ($PSVersionTable.PSVersion -ge [Version]"5.1") {
    Write-Output "Ok, PS 5.1 oder neuer ist installiert"
} else {
    Write-Output "Es wird mind. Powershell 5.1 benötigt. Aktuell ist eine ältere Version installiert!"
}

#Verzeichnise kopieren:
Copy-Item -Path '\\kawdaten-user\gruppen$\EDV\Programmierung & Scripte\Powershell Module\PSWindowsUpdate' -Destination "C:\Program Files\WindowsPowerShell\Modules\PSWindowsUpdate" -Recurse
Copy-Item -Path '\\kawdaten-user\gruppen$\EDV\Programmierung & Scripte\Powershell Module\PSWUpdate' -Destination "C:\PSScript\PSWUpdate" -Recurse

#Scheduled Task einrichten:
$Trigger = New-ScheduledTaskTrigger -Weekly -WeeksInterval 1 -DaysOfWeek Friday -At 10pm
$User= "NT AUTHORITY\SYSTEM"
$Action= New-ScheduledTaskAction -Execute "powershell.exe" -Argument "C:\PSScript\PSWUpdate\PSWUpdate_v1.0.ps1"
Register-ScheduledTask -TaskName "PSWUpdate" -Trigger $Trigger -User $User -Action $Action -RunLevel Highest –Force
