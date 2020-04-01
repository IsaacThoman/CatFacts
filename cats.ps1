$messagelimit = 254 
Add-Type -AssemblyName System.speech
$speak = New-Object System.Speech.Synthesis.SpeechSynthesizer
$speak.Rate   = 0 
sleep 2
$textline = 0
function fact {
$textline = Get-Random -Minimum 1 -Maximum 250
$message = (gc C:/catfacts/facts.txt | select-object -Index $textline) | Out-String
write-output $message
$speak.Speak($message)
$nextfactin = Get-Random -Minimum 10 -Maximum 3000
sleep $nextfactin
if($textline -lt $messagelimit) {
fact
}
$textline = 0
fact
}
fact
