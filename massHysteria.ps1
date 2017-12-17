param
(
    [string] $computer = "",
    [switch] $disable
)
Invoke-Command -ComputerName $computer -ScriptBlock{
    foreach($service in Get-Service)
    {
        write-host("* " + $service.Name + ": " + $service.Status);
        if($disable)
        {
            try
            {
                stop-service $service.Name;
            }
            catch
            {
            }
        }
    }
}
