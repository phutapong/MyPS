# Upload files
        $transferOptions = New-Object WinSCP.TransferOptions
        $transferOptions.TransferMode = [WinSCP.TransferMode]::Binary
 
        $transferResult =
            $session.PutFiles("d:\toupload\*", "/home/user/", $False, $transferOptions)
 
        # Throw on any error
        $transferResult.Check()
 
        # Print results
        foreach ($transfer in $transferResult.Transfers)
        {
            Write-Host "Upload of $($transfer.FileName) succeeded"
        }
    }
    finally
    {
        # Disconnect, clean up
        $session.Dispose()
    }
 
    exit 0
}
catch
{
    Write-Host "Error: $($_.Exception.Message)"
    exit 1
