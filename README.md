Git Remote hinzufügen oder klonen
-----------------------------

Fuer alle die nano lieber als vim oder vi moegen:

````
git config --global core.editor "nano"
````

Wenn bereits lokal ein Ordner existiert definierst du einen Remote-Namen, den du verwenden möchtest (hier als origin bezeichnet), und fügst die erste URL hinzu:

````
git init
git remote add origin [vogshere-url]
````

oder du klonst das Ding frisch als leeres Repo von vogshere der ordner sollte noch nicht existieren:

````
git clone [vogshere-url] [folder-name]
cd [folder-name]
````

Zweite Push-URL hinzufügen
-----------------------------
Anschließend fügst du eine zweite URL zum gleichen Remote hinzu, die ebenfalls beim Pushen verwendet werden soll: (ACHTUNG! - die eigenliche origin muss hier nochmal hinzugefuegt werden - komisch, iss aber so)
Noch ein Wort zu den origin Namen: Nutze fuer vogshere am besten einfach den default (origin) und fuer dein github einen gleichbleibden anderen bezeichner. Dann kannst du die pull push commands gleich vereinfachen in allgemeinen aliassen
````
git remote add [github-origin] [github-url]
git remote set-url --add --push origin [vogshere-url]
git remote set-url --add --push origin [github-url]
````

Mit diesem Befehl wird origin so konfiguriert, dass beim Ausführen von git push automatisch zu beiden URLs gepusht wird.
Pruefe das mit:

````
git remote -v
````

Überprüfen der Konfiguration
-----------------------------
Überprüfe deine Konfiguration, um sicherzustellen, dass beide URLs korrekt eingerichtet sind:

````
git remote -v:

[github-origin] [github-url] (fetch)
[github-origin] [github-url] (push)
origin [vogshere-url] (fetch)
origin [vogshere-url]  (push)
origin [github-url] (push)

````

Du solltest jetzt sehen, dass origin sowohl für Fetch als auch für Push korrekt eingestellt ist. Fetch zeigt auf GitHub, und Push sollte beide URLs anzeigen.

Änderungen pushen
-----------------------------
Jetzt, wo alles eingerichtet ist, kannst du Änderungen an beide URLs gleichzeitig pushen, indem du einfach:

````
git push origin master
````

Pullen von Änderungen
-----------------------------
Beim Pullen von Änderungen wirst du normalerweise von der Haupt-URL  ziehen:

````
git fetch --all
git merge origin/master
git merge [github-origin]/master
````

Aliases for git
-----------------------------
alias push="git push origin master"
alias pull="git fetch --all && git merge origin/master && git merge [github-origin]/master"

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