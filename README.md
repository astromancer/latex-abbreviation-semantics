# latex-abbreviations

> User friendly abbreviation definitions for latex documents. 📜✨

This repo provides some latex utilities that enable you to define abbreviation
(acronym) commands that automatically expand to the appropriate (context
specific) form in the document.  This allows one to write the abbreviations in
the latex source code with syntax that closely resemble natural written
language.

The context specific commands (tex vs section header vs caption etc), are
written for [`memoir`](https://www.ctan.org/pkg/memoir) and will not work with
any other document class. The code uses the
[`glossaries-extra`](https://www.ctan.org/pkg/glossaries-extra) package in the
background to manage the location tracking and hyperlinks etc, but the
abbreviation definition mechanism is custom.

## Required reading
You somewhat familiar with the `glossaries-extra` latex package. This code is
simply an automation layer that makes it easier to work with this package under
certain use cases. For example, allowing you to write `\AAs+` instead of
`\glsxtrlongpl{AA}` or `\glsfmtlongpl{AA}` depending on context.

# Install
There is no install script, just copy or clone the files into your main build 
folder.
```shell
git clone https://github.com/astromancer/latex-abbreviations/
```

# Usage
## Basic

Load the package by adding these lines in your document preamble.
```latex
\usepackage{abbreviations}
\usepackage{abbreviation-styles}
```

Abbreviations are defined as follows:
```latex
\abbreviation{XL}{Xeno-linguistics}
```


After this definition, the following commands will be made available in the
document:

| Form     | Command     | Expansion | 
| ---      | ---         | --- |
| Standard | **`\XL`**   | `Xeno-linguistics (XL)`  upon first use,  `XL` thereafter |
| Full     | **`\XL*`**  | `Xeno-linguistics (XL)`   |
| Long     | **`\XL+`**  | `Xeno-linguistics`        |
| Short    | **`\XL-`**  | `XL`                      |


## Enabling lowercase command definitions
You may enable lower case command variant definitions by adding the following
line to your document preamble (with the abbreviation definition as above):
```latex
\absEnableLowercaseDefs{}
```
In addition to the titlecase expanding commands shown above, the following
lowercase expanding commands will also be made available.

| Form     | Command     | Expansion | 
| ---      | ---         | --- |
| Standard | **`\xl`**   | `xeno-linguistics (XL)`  upon first use,  `XL` thereafter |
| Full     | **`\xl*`**  | `xeno-linguistics (XL)`   |
| Long     | **`\xl+`**  | `xeno-linguistics`        |
<!-- | Short | \xl-  | `XL`                      | -->

## Overwriting commands
By default, existing commands will not be overwritten. You may force the
overwrite by following your definition with an exclamation character "!". Use
this with caution.
```latex
\abbreviation{AA}{Alien Arcology}!
```
The trailing "!" is necessary to overwrite the builtin `\AA` command (Å symbol).


## Defining plural command versions
By default, no plural command versions are defined. If you would like these,
use the star variant of the `\abbreviation` command:
```latex
\abbreviation*[longplural={Alien Arcologies}]{AA}{Alien Arcology}!
```
Notice that the optional key-value parameters are passed through to glossaries'
`\newabbreviation` command.  After this definition, the following document
commands will be available:
| Singular forms | Expansion                                               |
| ---            | ---                                                     | 
| **`\AA`**      | `Alien Arcology (AA)`  upon first use,  `AA` thereafter | 
| **`\AA*`**     | `Alien Arcology (AA)`                                   | 
| **`\AA+`**     | `Alien Arcology`                                        | 
| **`\AA-`**     | `AA`                                                    | 

In addition, the following plural forms will also be available.

| **Plural forms** |                                                             |
| ---              | ---                                                         | 
| **`\AAs`**       | `Alien Arcologies (AAs)`  upon first use,  `AAs` thereafter | 
| **`\AAs*`**      | `Alien Arcologies (AAs)`                                    | 
| **`\AAs+`**      | `Alien Arcologies`                                          | 
| **`\AAs-`**      | `AAs`                                                       | 

In addition, the lower case plural commands will also be defined if
`\absEnableLowercaseDefs{}` was used in the preamble.


## Changing the command names and internal labels
If you'd like to use a command name that is named differently from the
abbreviation short form, you may use the optional parameters as below:
```latex
\abbreviation*[longplural=Supernovae]{SN}<mylabel:SNe>[BANG](SNe){Supernova}
```
This will define the entry with internal label `mylabel:SNe` having short form
`SN` and long form `Supernova`. The singular command form for the abbreviation
is `\BANG`, which will expand identically to the standard glossary command
`\cgls{mylabel:SNe}` in the text context. Likewise, the plural form command
`\SNe` will expand identically to the standard glossary command
`\cglspl{mylabel:SNe}`.

## Sectioning commands
The abbreviation commands can usually be used in sectioning commands without
problems. Usage inside sectioning commands will always expand to long form and
will suppress the hyperlink (internally, using the `\glsfmt...` type commands
from `glossaries-extra`). This also means that the terms appear as long form in
the document table of contents and page headers etc. PDF bookmarks are 
also expanded to long form and will resolve correctly.

 Have a look at the [`main.tex`](/main.tex) document for a more complete example
usage that also demonstrates these use cases.

# Repo File Forms

| File | Form                                            |
| ---  | ---                                             |
| [`main.tex`](/main.tex)                                | Main latex document example.
| [`definitions.tex`](/definitions.tex)                  | Your abbreviations should be defined here.
| [`abbreviation-styles.tex` ](/abbreviation-styles.tex) | Styles for formatting the abbreviations.
| [`abbreviations.tex`](/abbreviations.tex)              | Command definition mechanisms live here.

# Contribute
PRs are welcome! 🚀😎

# License
[MIT](/LICENSE)