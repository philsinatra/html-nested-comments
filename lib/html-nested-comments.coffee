# https://atom.io/docs/latest/hacking-atom-package-modifying-text

module.exports =
  activate: ->
    atom.commands.add 'atom-workspace',
      'html-nested-comments:comment': => @comment()

  comment: ->
    # This assumes the active pane item is an editor
    if editor = atom.workspace.getActiveTextEditor()
      fileName  = editor.getTitle()
      selection = editor.getSelectedText()
      ext       = fileName.split('.').pop()

      # File extensions that will use this type of commenting
      extensions = [
        'html'
        'htm'
        'php'
        'md',
        'asp',
        'cfm'
      ]

      if ext in extensions
        modifiedText = ToggleNestedComments(selection)
        editor.insertText(modifiedText)

ToggleNestedComments = (selectedText) ->
  prefix = selectedText.substring 0, 4
  if prefix != '<!--'
    modifiedText = selectedText.replace(/<!--/g, '<!~~')
    modifiedText = modifiedText.replace(/-->/g, '~~>')
    modifiedText = '<!-- ' + modifiedText + ' -->'
  else
    modifiedText = selectedText.replace(/<!-- /g, '')
    modifiedText = modifiedText.replace(/<!--/g, '')
    modifiedText = modifiedText.replace(/-->/g, '')
    modifiedText = modifiedText.replace(/<!~~/g, '<!--')
    modifiedText = modifiedText.replace(/~~>/g, '-->')
  return modifiedText
