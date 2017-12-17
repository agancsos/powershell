param
(
    [double]$temp = 100.00,
    [switch]$f,
    [switch]$c,
    [switch]$k
)

if($f)
{
    write-host ("C: " + (($temp - 32) * .5556));
    write-host ("K: " + ((($temp - 32) * .5556) +  273.15));
}
if($c)
{
    write-host ("F: " + (($temp * 1.8) + 32));
    write-host ("K: " + ($temp + 273.15));
}
if($k)
{
    write-host ("F: " + ((($temp - 273.15) * 1.8) + 32));
    write-host ("C: " + ($temp - 273.15));
}
