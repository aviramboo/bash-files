###############connect to oracle and enter oracle to backup mode################
#set script running time
$snapname = (Get-Date -Format HHmmddMMyyy ) + "SnapTest"
#create error log
$ErrorActionPreference="SilentlyContinue"
Stop-Transcript | out-null
$ErrorActionPreference = "Continue"
Start-Transcript -path C:\scripts\output.txt -append
###############Enter SMVI CLI directory
###cd "C:\Program Files\NetApp\Virtual Storage Console\smvi\cli\bin\"
#delete 15th snapthsot from smvi
###./smvi backup delete -noprompt -backup-name SnapJLRNFS15
###############smvi snap retention
###./smvi backup rename -backup-name SnapJLRNFS14 -new-backup-name SnapJLRNFS15
###./smvi backup rename -backup-name SnapJLRNFS13 -new-backup-name SnapJLRNFS14
###./smvi backup rename -backup-name SnapJLRNFS12 -new-backup-name SnapJLRNFS13
###./smvi backup rename -backup-name SnapJLRNFS11 -new-backup-name SnapJLRNFS12
###./smvi backup rename -backup-name SnapJLRNFS10 -new-backup-name SnapJLRNFS11
###./smvi backup rename -backup-name SnapJLRNFS9 -new-backup-name SnapJLRNFS10
###./smvi backup rename -backup-name SnapJLRNFS8 -new-backup-name SnapJLRNFS9
###./smvi backup rename -backup-name SnapJLRNFS7 -new-backup-name SnapJLRNFS8
###./smvi backup rename -backup-name SnapJLRNFS6 -new-backup-name SnapJLRNFS7
###./smvi backup rename -backup-name SnapJLRNFS5 -new-backup-name SnapJLRNFS6
###./smvi backup rename -backup-name SnapJLRNFS4 -new-backup-name SnapJLRNFS5
###./smvi backup rename -backup-name SnapJLRNFS3 -new-backup-name SnapJLRNFS4
###./smvi backup rename -backup-name SnapJLRNFS2 -new-backup-name SnapJLRNFS3
###./smvi backup rename -backup-name SnapJLRNFS1_recent -new-backup-name SnapJLRNFS2
#delete 15th snapthsot from smvi
###./smvi backup delete -noprompt -backup-name SnapJLRNFS15
#Load SSH Library
$DllPath = "C:\scripts\Renci.SshNet\lib\RenciSSH\Renci.SshNet.dll"
[void][reflection.assembly]::LoadFrom( (Resolve-Path $DllPath) )
#connect to linux server
$SshClient = New-Object Renci.SshNet.SshClient("10.70.48.69", 22, "root", "redbend")
$SshClient.Connect()
#run command on linux server
if ($SshClient.IsConnected) {
    $SshCommand = $SshClient.RunCommand("runuser -l oracle -c /home/oracle/lock_db.sh")
}
#clear connection from linux server
$SshCommand.Dispose()
$SshClient.Disconnect()
$SshClient.Dispose()
###############run SMVI snapshot
###./smvi backup create -id "JLRNFS1" -backup-name SnapJLRNFS1_recent
###############connect to oracle and exit oracle from backup mode################
#connect to linux server
$SshClient = New-Object Renci.SshNet.SshClient("10.70.48.69", 22, "root", "redbend")
$SshClient.Connect()
#run command on linux server
if ($SshClient.IsConnected) {
    $SshCommand = $SshClient.RunCommand("runuser -l oracle -c /home/oracle/unlock_db.sh")
}
#clear connection from linux server
$SshCommand.Dispose()
$SshClient.Disconnect()
$SshClient.Dispose()
Stop-Transcript