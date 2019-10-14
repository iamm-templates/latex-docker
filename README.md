# :whale: XeLaTeX
Docker-based XeLaTeX documents compilation.
Download the compilation script:
```
wget https://github.com/iamm-templates/xelatex-docker/raw/master/latexdockercmd.sh -O latexdockercmd.sh
chmod a+x latexdockercmd.sh
```
To compile the document `main.tex` just run the command (assuming you have Docker installed)
```
./latexdockercmd.sh main.tex
```
If your document includes or depends on other files in the same directory, don't worry, the script will mount the current working directory by default.
