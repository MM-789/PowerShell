#oOwershell Version prüfen:


#Verzeichnise kopieren:


#Scheduled Task einrichten:
$Trigger = New-ScheduledTaskTrigger -Weekly -WeeksInterval 1 -DaysOfWeek Friday -At 1am
$User= "NT AUTHORITY\SYSTEM"
$Action= New-ScheduledTaskAction -Execute "powershell.exe" -Argument "C:\PSScript\PSWUpdate\PSWUpdate_v1.0.ps1"
Register-ScheduledTask -TaskName "PSWUpdate" -Trigger $Trigger -User $User -Action $Action -RunLevel Highest –Force
