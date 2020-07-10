# Load WinSCP .NET assembly
Add-Type -Path "WinSCPnet.dll"

# Set up session options
$sessionOptions = New-Object WinSCP.SessionOptions -Property @{
    Protocol = [WinSCP.Protocol]::Ftp
    HostName = "test"
    UserName = "test"
    Password = "test"
    FtpSecure = [WinSCP.FtpSecure]::Implicit
}

$session = New-Object WinSCP.Session

try
{
    # Connect
    $session.Open($sessionOptions)

    # Upload files
        $transferOptions = New-Object WinSCP.TransferOptions
        $transferOptions.TransferMode = [WinSCP.TransferMode]::Binary
 
        $transferResult =
            $session.PutFiles("d:\EDI_files\*", "/home/test/", $False, $transferOptions)
 
        # Throw on any error
        $transferResult.Check()
 
        # Print results
        foreach ($transfer in $transferResult.Transfers)
        {
            Write-Host "Upload of $($transfer.FileName) succeeded"
        }
}

catch
{
    Write-Host "Error: $($_.Exception.Message)"
    exit 1
}
finally
{
    $session.Dispose()
}
