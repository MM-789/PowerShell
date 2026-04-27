## Nützliche Befehle

### AD

LastLogontime Computerobjekt auslesen:
```powershell
Get-ADComputer -Idendity PC-0xxx -Properties * | ft Name, LastLogonDate
```
OutOfScope-Geräte auflisten (älter als 190 Tage):
```powershell
 Get-ADComputer -Filter * -Properties LastLogonDate | sort LastLogonDate | where {($_.Enabled -eq "True") -and ($_.LastLogonDate -le (get-date).adddays(-190))} | ft Name, LastLogonDate -AutoSize
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
