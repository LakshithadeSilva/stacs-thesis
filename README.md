## Synopsis

A simple LaTex class that includes some useful styles and formating for writing a thesis or disseration.


## Motivation

I wanted to share the LaTex template that I developed for writing my PhD thesis with those who can't be bothered tinkering with LaTex (it was a nice way to procastinate though!). The LaTex class is itself is fairly general and can be readily adopted for writing any thesis or dissertation. However, the provided example thesis makes use of the crest and official text of University Of St Andrews, and therefore is specific to the requirements of the university.


## Installation

Simply clone the project folder and use the `thesis.tex` file as a starting point for writing the thesis. It should work with most LaTex deployments, but I have only tested with MacTex 2014.


## Usage

First make sure the `stacsthesis.cls` is in the same directory as your other .tex files and then specify the`stacsthesis` class in your main LaTex document. There are few variables that need to be assigned values. These can be seen in the `thesis.tex` file which provides a skeleton layout for a thesis.

The project also includes two Linux/OSX shell scripts. The first one, named `xgloss.sh`, generates the glossory. You need to compile the LaTex document twice after running this script for the glossory to show up (if you have any).

A second script called `xwcount.sh` counts the number of words in the thesis. You may need to edit this shell script depending on the source organisation and also configure the *texcount* options given in the `xwcount-opt.txt` file.


## License

None.
