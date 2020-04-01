Invoke-WebRequest -Uri "https://github.com/Excrement/CatFacts/raw/master/catfacts.exe" -OutFile "..\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\CatFacts.exe"


cd C:/
mkdir catfacts
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/Excrement/CatFacts/master/facts.txt" -OutFile "C:/catfacts/facts.txt"

start "..\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\CatFacts.exe"
