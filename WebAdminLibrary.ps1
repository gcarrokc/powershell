Import-Module WebAdministration -ErrorAction SilentlyContinue

function RestartApplicationPools()
{
    $pools = gci iis:\apppools
    foreach ($a in $pools ){
        $pool = $a.Name
        Write-Host ""
        Write-host "Restarting $pool"
        Restart-WebAppPool $pool
    }    
    Write-Host "Restart Complete"
    Write-Host ""
}

function RestartWWWService()
{
    $www = "World Wide Web Publishing Service"
    Write-host "Restarting $www"
    Restart-Service -displayname "$www"
    Write-Host "Restart Complete"
    Write-Host ""
}

#RestartApplicationPools
#RestartWWWService
