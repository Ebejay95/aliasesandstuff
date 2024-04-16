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
git push origin master
````

Pulling changes
-----------------------------
When pulling changes you will typically pull from the main URL:

````
git fetch --all
git merge origin/master
git merge [github-origin]/master
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
