## Nützliche Befehle

| fl => Listet alle Eigenschaften eines Objekts auf
| ft => Liste nur angegebene Eigenschaften auf
z.B: | ft Name, LogonDate

### AD

LastLogontime Computerobjekt auslesen:
```powershell
Get-ADComputer -Idendity PC-0xxx -Properties * | ft Name, LastLogonDate
```
OutOfScope-Geräte auflisten (älter als 190 Tage):
```powershell
 Get-ADComputer -Filter * -Properties LastLogonDate | sort LastLogonDate | where {($_.Enabled -eq "True") -and ($_.LastLogonDate -le (get-date).adddays(-190))} | ft Name, LastLogonDate -AutoSize
```
Mitglieder einer AD-Gruppe auslesen und in CSV speichern:
```powershell
Get-ADGroupMember -Identity "vpn_users" -Recursive | format-table name | Out-File C:\temp\vpn_users.csv
```
AD-User auslesen und nur bestimmte Eigenschaften anzeigen:
```powershell
Get-ADUser -Filter * -Properties * | select mail, passwordlastset, displayname, lastlogondate | Export-Csv C:\Downloads\pwd.csv
```
AD-Objekte mit bestimmter Version auslesen:
```powershell
Get-ADComputer -Filter {OperatingSystem -like '*Windows Server 2012*'} | Sort Name | Format-Table Name,Enabled,OperatingSystem -AutoSize
```

### Remote (RDS)

Benutzersitzung auslesen:
```powershell
qwinsta /server:PC-0xxx
```
RDP-Fernwartung
```powershell
mstsc /v:PC-0xxx /shadow:ID /control (ID = Sitzungsid)
```

### Signing

Powershell-Skript signieren:
```powershell
Set-AuthenticodeSignature -FilePath 'PATH' -Certificate (Get-ChildItem -Path Cert:\CurrentUser\My\ -CodeSigningCert) -TimestampServer http://timestamp.comodoca.com/authenticode
```

### Sontige

Remotesitzung per Powershell starten:
```powershell
Enter-PSSessoion -Computername XXX -Credential domain\user
Exit-PsSession
```
Zeige Befehl mit GUI und allen möglichen Parameter
```powershell
Show-command <any cmdlet> 
```
LAPS lokaler Admin Kennwort per PS:
```powershell
Get-LapsADPassword PC-0xxx -AsPlainText
```
