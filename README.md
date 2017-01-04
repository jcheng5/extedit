## RStudio add-in for launching an external editor

Adds two commands to the RStudio Addins menu:

* `Launch Editor (cwd)` launches an external editor, passing the current working directory as an argument.
* `Launch Editor (source)` launches an external editor, passing the path to the source pane's active document as an argument. (Or if the keyboard focus is in the Console, then you get the contents of the console input buffer in a temp file.)

Use `options(exteditor="path-to-editor")` to configure the editor to use. You may want to put this in your [~/.Rprofile or Rprofile.site](https://stat.ethz.ch/R-manual/R-devel/library/base/html/Startup.html).

Designed to work with:

* Atom: `options(exteditor="atom")`
* Sublime Text: `options(exteditor="subl")`
* Visual Studio Code: `options(exteditor="code")`
