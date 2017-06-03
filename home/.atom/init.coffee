# Your init script
#
# Atom will evaluate this file each time a new window is opened. It is run
# after packages are loaded/activated and after the previous editor state
# has been restored.
#
# An example hack to log to the console when each text editor is saved.
#
# atom.workspace.observeTextEditors (editor) ->
#   editor.onDidSave ->
#     console.log "Saved! #{editor.getPath()}"

path = require 'path'
atom.workspace.onDidOpen ({item}) ->
  if item.getPath?() && path.basename(item.getPath()) is 'LICENSE'
    item.setGrammar(atom.grammars.grammarForScopeName('source.gfm'))

  if item.getPath?() && path.basename(item.getPath()) is 'Movefile'
    item.setGrammar(atom.grammars.grammarForScopeName('source.yaml'))
