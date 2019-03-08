# Set up session options
$Protocol = "Sftp"
$HostName = "pos-ftp.sonicpartnernet.com"
$UserName = "jonathan.harris"
# Need to remove password, as it will be entered upon script execution
$Password = "xxxxxxxx"
$SshHostKeyFingerprint = "ssh-rsa 2048 8NoV4Z7l67RrsR4E6pPeZ2njDWu14dwUHJ6arAOkJQw="
$local = "C:\Users\Jonathan\OneDrive\Work\Syncing"
$remote = "/POPS/JonathanH/Syncing"

$session = New-WinSCPSession -SessionOption (New-WinSCPSessionOption -HostName $HostName -SshHostKeyFingerprint $SshHostKeyFingerprint -Protocol $Protocol -Credential $UserName)

try
{
    # This will sync the local with the files on the ftp site
    # Adding or removing files in the pos-ftp will be reflected locally once sync is complete
    $result = Sync-WinSCPPath -WinSCPSession $session -Mode Local -Remove -LocalPath $local -RemotePath $remote
}
finally
{
    $session.Dispose()
}
