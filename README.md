Add or clone Git Remote
-----------------------------

For everyone who prefers nano to vim or vi:

````
git config --global core.editor "nano"
````

If a folder already exists locally, define a remote name you want to use (here called origin) and add the first URL:

````
git init
git remote add origin [vogshere-url]
````

or you clone the thing fresh as an empty repo from vogshere the folder shouldn't exist yet:

````
git clone [vogshere-url] [folder-name]
cd [folder-name]
````

Add second push URL
-----------------------------
Then add a second URL to the same remote, which should also be used when pushing: (ATTENTION! - the actual origin has to be added here again - strange, but that's how it is)
One more word about the origin names: It's best to just use the default (origin) for vogshere and a constant, different identifier for your github. Then you can simplify the pull push commands into general aliases
BE CAREFULL WITH GITHUB SETTING MAIN NOT MASTER BRANCH!!!

````
git remote add [github-origin] [github-url]
git remote set-url --add --push origin [vogshere-url]
git remote set-url --add --push origin [github-url]
````

This command configures origin to automatically push to both URLs when running git push.
Check this with:

````
git remote -v
````

Check the configuration
-----------------------------
Check your configuration to make sure both URLs are set up correctly:

````
git remote -v:

[github-origin] [github-url] (fetch)
[github-origin] [github-url] (push)
origin [vogshere-url] (fetch)
origin [vogshere-url]  (push)
origin [github-url] (push)

````

You should now see that origin is set correctly for both fetch and push. Fetch points to GitHub, and Push should show both URLs.

Push changes
-----------------------------
Now that everything is set up, you can push changes to both URLs at the same time by simply:

````
git push
````

Pulling changes
-----------------------------
When pulling changes you will typically pull from the main URL:

````
git fetch --all
git merge origin/master --allow-unrelated-histories
git merge [github-origin]/master --allow-unrelated-histories
````

Aliases for git
-----------------------------

````
alias push="git push origin master"
alias pull="git fetch --all && git merge origin/master && git merge [github-origin]/master"
````

Yeah Submodules
-----------------------------
````
git submodule add https://github.com/Ebejay95/libft.git libft
git submodule init
git submodule update
````
add to your Makefile the automated update:

````
$(LIBFT_LIB):
	@git submodule update --init --recursive --remote > /dev/null 2>&1
	@$(MAKE) -C $(LIBFT_DIR)
````

Procedure for project retry (change remote origin while keepint commit history)
-----------------------------
Remove the "old" vogshere origin
````
git remote rm origin
````
Add the new one as origin
````
git remote add origin [new vogshere url]
````
Commit to the still existing history
````
git add .
git commit -m "[YOUR MESSAGE]"
git push --set-upstream origin master 
````

Valgrind
-----------------------------

Recommended are devcontainers for VScode. A good one can be found here: https://github.com/Reptudn/42-docker-container
````
valgrind --leak-check=full --show-leak-kinds=all --track-origins=yes --verbose
````

explicit for minishell readline functions
create a readline.supp
````
{
	leak readline
	Memcheck:Leak
	...
	fun:readline
}
{
	leak add_history
	Memcheck:Leak
	...
	fun:add_history
}
````

````
valgrind --leak-check=full --show-leak-kinds=all --track-origins=yes --verbose --suppressions=readline.supp ./minishell 
````

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
alias submodule="git submodule update --init --remote"

Valgrind Tester
-----------------------------

gcc -g -Og -std=gnu99 *.c -o bin   

valgrind -s --leak-check=full --show-leak-kinds=all ./bin


````
#!/bin/bash

# Pfad zum Verzeichnis, dessen Dateien ausgedruckt werden sollen
directory="./"

# Ausgabe-Datei
output_file="out.txt"

# Leere die Ausgabedatei, falls sie bereits existiert
> "$output_file"

# Funktion zum rekursiven Durchsuchen des Verzeichnisses
process_directory() {
    local dir="$1"
    for item in "$dir"/*; do
        # Überprüfe, ob das aktuelle Verzeichnis 'libft' ist
        if [[ "$(basename "$item")" == "libft" ]]; then
            continue  # Überspringe das 'libft' Verzeichnis
        fi

        if [ -f "$item" ] && [[ "$item" == *.c ]]; then
            # Dateiinhalt ab Zeile 12 in die Ausgabedatei schreiben
            tail -n +12 "$item" >> "$output_file"
            # Eine Leerzeile nach jeder Datei hinzufügen
            echo "" >> "$output_file"
        elif [ -d "$item" ]; then
            # Rekursiv in Unterverzeichnisse gehen
            process_directory "$item"
        fi
    done
}

# Starte die rekursive Verarbeitung
process_directory "$directory"
````
