# Using _Pandoc_ to convert between various document types:
  - If you need to convert files from one markup format into another, pandoc is your swiss-army knife. Pandoc can convert documents in markdown, reStructuredText, textile, HTML, X and many others.

## Installation:
* Using Chocoley: `choco install pandoc -y` or `cinst pandoc -y`
* Download the [Latest release from github]. Choose `pandoc-2.2.1-windows-x86_64.msi` under `Assets`.
* To go from `docx` to `pdf` you will need `LaTeX`, for windows its better to use `MiKTeX`
    - To Install (Setup Wizard):
    - Command Line ([Reference Here]) : 
    ```Powershell
    .\miktexsetup --local-package-repository=O:\info_tech\chocolatey-package-repository\miktex_local_package_repository --package-set=essential --quiet download
    .\miktexsetup install
    ```
    
#### To convert a doc.md Markdown file into a PDF document, the following command can be used:

```
pandoc -s -o doc.pdf doc.md
```

#### Pandoc is able to merge multiple Markdown files into a single PDF document. To generate a single PDF document out of two Markdown files you can use:

```
pandoc -s -o doc.pdf part01.md part02.md
```

#### By default the page margins in the resulting PDF document are quite large. You can change this by passing a margin parameter:

```
pandoc -s -V geometry:margin=1in -o documentation.pdf part01.md part02.md
```

#### To create HTML or DOCX documents you simply have to change the file extension of the target file:

```
pandoc -s -o doc.html part01.md part02.md
pandoc -s -o doc.docx part01.md part02.md
```

#### The resulting documents are well formatted. The following two screenshot show a DOCX and a PDF document created out of two small example markdown files:

* __Resulting DOCX document:__

![alt text](https://www.mscharhag.com/files/2016/pandoc-docx.png "Word docx document generated by Pandoc")


* __Resulting PDF document:__

![alt text](https://www.mscharhag.com/files/2016/pandoc-pdf.png "Pdf document generated by Pandocd")


#### Experimental
* Unattended install;
    - src https://miktex.org/howto/deploy-miktex
    - share directory with everyone: net share miktex=\\steve\Internal\info_tech\chocolatey-package-repository\miktex_local_package_repository /grant:everyone,READ #Does not work right now.
    
    @echo off
'.\C:\Users\ryanbaas\OneDrive - Signalysis, Inc\Documents\mygit\uc-github\Cheat-Sheets\Pandoc-Doc-Converter\tools\miktexsetup-2.9.6672-x64' --quiet --local-package-repository=\\steve\Internal\info_tech\chocolatey-package-repository\miktex_local_package_repository --package-set=essential install


[Latest release from github]: https://github.com/jgm/pandoc/releases
[Reference Here]: https://docs.miktex.org/manual/miktexsetup.html