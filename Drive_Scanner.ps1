$targetDir="C:\Users\Administrator\certificates"

While (1){
$Bar = Read-Host -Prompt 'Scan bar code'


$Starbar = "*" + $Bar.replace(".", "") + "*"



$Files = @(Get-ChildItem -Path $targetDir -Recurse -Filter $Starbar -Exclude "*Terminated*")

#write-host $Files


if ($Files.length -eq 0) {
  write-host "***NOT Success!***" -BackgroundColor Red
} else {
  write-host "SUCCESS!!" -BackgroundColor Green
}


}
