1. Git Remote hinzufügen
-----------------------------

Zuerst definierst du einen Remote-Namen, den du verwenden möchtest (hier als origin bezeichnet), und fügst die erste URL hinzu:

````
```
git remote add origin git@github.com:deinBenutzername/deinProjekt.git
```
````


2. Zweite Push-URL hinzufügen
Anschließend fügst du eine zweite URL zum gleichen Remote hinzu, die ebenfalls beim Pushen verwendet werden soll:

bash
Copy code
git remote set-url --add --push origin git@bitbucket.org:deinBenutzername/deinProjekt.git
Mit diesem Befehl wird origin so konfiguriert, dass beim Ausführen von git push automatisch zu beiden URLs gepusht wird.

3. Überprüfen der Konfiguration
Überprüfe deine Konfiguration, um sicherzustellen, dass beide URLs korrekt eingerichtet sind:

bash
Copy code
git remote -v
Du solltest jetzt sehen, dass origin sowohl für Fetch als auch für Push korrekt eingestellt ist. Fetch zeigt auf GitHub, und Push sollte beide URLs anzeigen.

4. Änderungen pushen
Jetzt, wo alles eingerichtet ist, kannst du Änderungen an beide URLs gleichzeitig pushen, indem du einfach:

bash
Copy code
git push origin main  # Ersetze 'main' durch den Namen deines Hauptbranches, wenn er anders ist
verwendest. Git wird die Änderungen dann sowohl zu GitHub als auch zu Bitbucket senden.

5. Pullen von Änderungen
Beim Pullen von Änderungen wirst du normalerweise von der Haupt-URL (GitHub in diesem Fall) ziehen:

bash
Copy code
git pull origin main  # Stellt sicher, dass du die neuesten Änderungen von der Hauptquelle hast
Wenn du sicherstellen möchtest, dass du die neuesten Änderungen von beiden Seiten hast, kannst du abwechselnd von jeder URL fetchen und mergen, indem du spezifische Branch-Namen von jeder Remote verwendest.

6. Änderungen fetchen
Manchmal möchtest du vielleicht nur die neuesten Änderungen sehen, ohne sie direkt in deinen Branch zu mergen:

bash
Copy code
git fetch origin  # Holt alle neuen Änderungen von GitHub

Aliases u dont wann'a miss
-----------------------------

alias shellcache="source ~/.zshrc"

alias shelledit="nano ~/.zshrc"

alias n="norminette | grep Error"

alias i='open https://profile.intra.42.fr/' &

alias chatty='open https://chat.openai.com/' &

alias code='/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code' & 

alias test='make re && make clean && echo 
"###########################################\n\n\n" && ./bin'

alias push="git push origin && git push ebejay"

Valgrind Tester
-----------------------------

gcc -g -Og -std=gnu99 *.c -o bin   

valgrind -s --leak-check=full --show-leak-kinds=all ./bin