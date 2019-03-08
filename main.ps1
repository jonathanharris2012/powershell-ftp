# Load WinSCP .NET assembly
Add-Type -Path ".\WinSCP\WinSCPnet.dll"

# Set up session options
$sessionOptions = New-Object WinSCP.SessionOptions -Property @{
    Protocol = [WinSCP.Protocol]::Sftp
    HostName = "pos-ftp.sonicpartnernet.com"
    UserName = "jonathan.harris"
    Password = "xxxxxxx"
    SshHostKeyFingerprint = "ssh-rsa 2048 8NoV4Z7l67RrsR4E6pPeZ2njDWu14dwUHJ6arAOkJQw="
}

$sessionOptions.AddRawSettings("ProxyPort", "0")

$session = New-Object WinSCP.Session

try
{
    # Connect
    $session.Open($sessionOptions)
    # Your code
    # $session.GetFiles("/POPS/JonathanH/Syncing/*", "$Home\OneDrive\Work\Syncing\").Check()
    $session.SynchronizeDirectories(
        [WinSCP.SynchronizationMode]::Local, "$Home\OneDrive\Work\Syncing", "/POPS/JonathanH/Syncing", $False)
}
finally
{
    $session.Dispose()
}


#cd $Home\OneDrive\Work\syncing