or create a new repository on the command line
echo "# ansiblelab" >> README.md
git init
git add README.md
git commit -m "first commit"
git branch -M main
git remote add origin https://github.com/senthilkveeranan/ansiblelab.git
git push -u origin main
…or push an existing repository from the command line
git remote add origin https://github.com/senthilkveeranan/ansiblelab.git
git branch -M main
git push -u origin main