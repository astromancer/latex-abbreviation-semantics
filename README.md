# semantic-abbreviations-latex

This repo provides some latex utilities that enable you to define abbreviation
(acronym) commands that automatically expand to the appropriate (context
specific) form in the document.  This allows one to write the abbreviations in
the latex source code with semantics that closely resemble natural written
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
There is no install script, just copy the files into your main build folder.

# Usage
## Basic

Load the package by adding these lines in your document preamble.
```latex
\usepackage{abbrv-semantic}
\usepackage{abbrv-styles}
```

Abbreviations are defined as follows:
```latex
\abbreviation{XL}{Xeno-linguistics}
```


Following this definition, the following commands will be made available in the
document:

| Command | Expansion | Description | 
| --- | --- | --- |
| **`\XL`**   | `Xeno-linguistics (XL)`  upon first use,  `XL` thereafter | Standard form |
| **`\XL*`**  | `Xeno-linguistics (XL)`   | Full form |
| **`\XL+`**  | `Xeno-linguistics`        | Long form |
| **`\XL-`**  | `XL`                      | Short form |


## Enabling lowercase command definitions
You may enable lower case command variant definitions by adding the following
line to your document preamble (with the abbreviation definition as above):
```latex
\absEnableLowercaseDefs{}
```
In addition to the titlecase expanding commands shown above, the following
lowercase expanding commands will also be made available.

| Command | Expansion | Description | 
| --- | --- | --- |
| **`\xl`**   | `xeno-linguistics (XL)`  upon first use,  `XL` thereafter | Standard form |
| **`\xl*`**  | `xeno-linguistics (XL)`   | Full form |
| **`\xl+`**  | `xeno-linguistics`        | Long form |
<!-- | \xl-  | `XL`                      | Short form | -->

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
| Singular forms | Expansion | 
| --- | --- | 
| **`\AA`**   | `Alien Arcology (AA)`  upon first use,  `AA` thereafter | 
| **`\AA*`**  | `Alien Arcology (AA)`   | 
| **`\AA+`**  | `Alien Arcology`        | 
| **`\AA-`**  | `AA`                      | 

In addition, the following plural forms will also be available.

| **Plural forms** |  | 
| --- | --- | 
| **`\AAs`**   | `Alien Arcologies (AAs)`  upon first use,  `AAs` thereafter | 
| **`\AAs*`**  | `Alien Arcologies (AAs)`   | 
| **`\AAs+`**  | `Alien Arcologies`         | 
| **`\AAs-`**  | `AAs`                      | 

In addition, the lower case plural commands will also be defined if
`\absEnableLowercaseDefs{}` was used in the preamble.

Have a look at the `main.tex` document for a more complete example usage.

## Changing the command names and internal labels
If you'd like to use a command name that is named differently from the 


# Repo File Descriptions

| File | Description | 
| --- | --- |  
| [`main.tex`](/main.tex)                     | Main latex document example.
| [`abbrv-defs.tex`](/abbrv-defs.tex)         | Your abbreviations should be defined here.
| [`abbrv-styles.tex` ](/abbrv-styles.tex)    | Styles for formatting the abbreviations.
| [`abbrv-semantic.tex`](/abbrv-semantic.tex) | Command definition mechanisms live here.

# License
[MIT](/LICENSE)