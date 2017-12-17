param(
 [string]$hostname,
 [string]$ip,
 [string]$range,
 [string]$base = "10.10.100."
)

write-host ("").PadRight(80,"=");
write-host ("Hostname: $hostname");
write-host ("IP      : $ip");
write-host ("").PadRight(80,"=");

if($range -ne ""){
 $rangeRaw = $range.Split(",");
 [int32]$min = (0 + $rangeRaw[0]);
 [int32]$max = (0 + $rangeRaw[1]);
write-host $min.gettype();
 while($min -le $max){
  [string]$minStr = $min;
  write-host ($base + $minStr);
  $min++;
 }
}
elseif($hotname -eq "" -and $ip -eq "" -or (-not $hostname -and -not $ip -and -not $range)){
 write-host "Que?";
}
elseif($hostname -ne "" -and $ip -ne ""){
 write-host "Please only specify 1 of hostname or IP";
}
else{
 if($hostname -ne ""){
  $hostObject = [System.Net.Dns]::GetHostEntry($hostname).AddressList[0];
  write-host $hostObject;
 }
 elseif($ip -ne ""){
  $hostObject = [System.Net.Dns]::GetHostEntry($ip).HostName;
  write-host $hostObject;
 }
}