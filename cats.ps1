$messagelimit = 254 
Add-Type -AssemblyName System.speech
$speak = New-Object System.Speech.Synthesis.SpeechSynthesizer
$speak.Rate   = -2  # -10 to 10; -10 is slowest, 10 is fastest
sleep 15
$textline = 0
function fact {
$textline = $textline + 1
$message = (gc C:/cats.txt | select-object -Index $textline) | Out-String
write-output $message
$speak.Speak($message)
sleep 
if($textline -lt $messagelimit) {
fact
}
$textline = 0
fact
}
fact
