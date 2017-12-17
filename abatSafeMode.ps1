param
(
    [string] $computer = "",
    [string] $mode = "0",
    [string] $version = "10"
)
Invoke-Command -ComputerName $computer -ScriptBlock{
    if($mode -eq "1")
    {
        Set-ItemProperty -Path ("HKLM:\SOFTWARE\ASCI\ActiveBatch\V" + $version+ "0\JobSched") -Name "SAFEMODE" -Value $mode;
        Get-ItemPropertyValue -Path ("HKLM:\SOFTWARE\ASCI\ActiveBatch\V" + $version+ "0\JobSched") -Name "SAFEMODE";
    }
    elseif($mode -eq "2")
    {
        Remove-ItemProperty -Path ("HKLM:\SOFTWARE\ASCI\ActiveBatch\V" + $version+ "0\JobSched") -Name "SAFEMODE";
    }
    restart-Service abatjss;
}
