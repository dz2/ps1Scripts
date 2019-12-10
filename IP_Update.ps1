$previous = gc .\ip.txt 
While (1) {
    Write-Output 'hi this is while loop'
    
    $current = Invoke-RestMethod http://ipinfo.io/json | Select-object -exp ip
    if ($previous -ne $current) {
        Write-Output 'hi this is if statement'
        $previous = $current
        $username   = 'jeff.thompson@cfsalberta.ca'
        $password   = 'Yruhere2'
        $secstr     = New-Object -TypeName System.Security.SecureString
        $password.ToCharArray() | ForEach-Object {$secstr.AppendChar($_)}

        $hash = @{
            from       = "jeff.thompson@cfsalberta.ca"
            to         = "calgary.shop@cfsalberta.ca"
            subject    = "IP address change"
            smtpserver = "mail.cfsalberta.ca"
            port       = "25"
            body       = "test msg"
            credential = New-Object -typename System.Management.Automation.PSCredential -argumentlist $username, $secstr
            usessl     = $false
            verbose    = $true
        }

        Send-MailMessage @hash
    }

    Start-Sleep -s 3600
}