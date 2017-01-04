#' @export
launchExternalEditorFile <- function() {
  path <- rstudioapi::getActiveDocumentContext()$path
  if (nchar(path) == 0) {
    # If we're in an untitled document, put the contents in a temp file
    # and open that instead
    path <- tempfile()
    writeLines(rstudioapi::getActiveDocumentContext()$contents, path)
  }

  launchExternalEditor(path)
}

#' @export
launchExternalEditorCwd <- function() {
  launchExternalEditor(getwd())
}

launchExternalEditor <- function(path) {
  editor <- getOption("exteditor")
  if (is.null(editor)) {
    stop("No editor is configured (e.g. `options(exteditor='subl')`)", call. = FALSE)
  }

  message("Opening \"", path, "\" in an external editor")

  cmd <- paste(editor, shQuote(path))

  if (.Platform$OS.type == "windows")
    system(cmd, wait = FALSE, invisible = FALSE)
  else
    system(cmd, wait = FALSE)
}
