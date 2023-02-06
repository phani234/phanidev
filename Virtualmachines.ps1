$username = "Administrator"
$password = ConvertTo-SecureString "AXbNh?5.MzyjN6;q`$M.v)d.7zT(ZQKYZ" -AsPlainText -Force
$credential = New-Object System.Management.Automation.PSCredential($username, $password)
$computerName = "3.239.219.142"

$serviceName = "Excel"

$service = Get-WmiObject -Class Win32_Service -ComputerName $computerName -Credential $credential | Where-Object { $_.Name -eq $serviceName }

if ($service.State -eq "stopped") {
#    $service.StopService()
    Start-Sleep -Seconds 5
    $service.StartService()
}
 
#Test-Connection "3.239.219.142" -Count 1


#Invoke-Command -ComputerName 3.239.219.142 -Authentication Negotiate -ScriptBlock {Get-WmiObject win32_SystemEnclosure}