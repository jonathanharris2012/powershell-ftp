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
    $session.GetFiles("/POPS/JonathanH/Scripting/schedule.json", "C:\Temp\schedule.json").Check()
    $schedule = (Get-Content "C:\Temp\schedule.json") | ConvertFrom-Json
    write-host "Testing"
}
finally
{
    $session.Dispose()
}
