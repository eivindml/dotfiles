{CompositeDisposable} = require 'atom'

ShowTodoView = require './todo-view'
TodoCollection = require './todo-collection'
TodoIndicatorView = null

module.exports =
  config:
    findTheseTodos:
      type: 'array'
      default: [
        'FIXME'
        'TODO'
        'CHANGED'
        'XXX'
        'IDEA'
        'HACK'
        'NOTE'
        'REVIEW'
      ]
      items:
        type: 'string'
    findUsingRegex:
      description: 'Single regex used to find all todos. ${TODOS} is replaced with the findTheseTodos array.'
      type: 'string'
      default: '/\\b(${TODOS})[:;.,]?\\d*($|\\s.*$|\\(.*$)/g'
    ignoreThesePaths:
      type: 'array'
      default: [
        '**/node_modules/'
        '**/vendor/'
        '**/bower_components/'
      ]
      items:
        type: 'string'
    showInTable:
      type: 'array'
      default: ['Text', 'Type', 'Path']
    sortBy:
      type: 'string'
      default: 'Text'
      enum: ['All', 'Text', 'Type', 'Range', 'Line', 'Regex', 'Path', 'File', 'Tags', 'Id', 'Project']
    sortAscending:
      type: 'boolean'
      default: true
    openListInDirection:
      type: 'string'
      default: 'right'
      enum: ['up', 'right', 'down', 'left', 'ontop']
    rememberViewSize:
      type: 'boolean'
      default: true
    saveOutputAs:
      type: 'string'
      default: 'List'
      enum: ['List', 'Table']
    statusBarIndicator:
      type: 'boolean'
      default: false

  URI:
    workspace: 'atom://todo-show/todos'
    project: 'atom://todo-show/project-todos'
    open: 'atom://todo-show/open-todos'
    active: 'atom://todo-show/active-todos'

  activate: ->
    @collection = new TodoCollection
    @collection.setAvailableTableItems(@config.sortBy.enum)

    @disposables = new CompositeDisposable
    @disposables.add atom.commands.add 'atom-workspace',
      'todo-show:find-in-workspace': => @show(@URI.workspace)
      'todo-show:find-in-project': => @show(@URI.project)
      'todo-show:find-in-open-files': => @show(@URI.open)

    # Register the todolist URI, which will then open our custom view
    @disposables.add atom.workspace.addOpener (uriToOpen) =>
      scope = switch uriToOpen
        when @URI.workspace then 'workspace'
        when @URI.project then 'project'
        when @URI.open then 'open'
        when @URI.active then 'active'
      if scope
        @collection.scope = scope
        new ShowTodoView(@collection, uriToOpen)

  deactivate: ->
    @destroyTodoIndicator()
    @disposables?.dispose()

  destroyPaneItem: ->
    pane = atom.workspace.paneForItem(@showTodoView)
    return false unless pane

    pane.destroyItem(@showTodoView)
    # Ignore core.destroyEmptyPanes and close empty pane
    pane.destroy() if pane.getItems().length is 0
    return true

  show: (uri) ->
    prevPane = atom.workspace.getActivePane()
    direction = atom.config.get('todo-show.openListInDirection')

    return if @destroyPaneItem()

    switch direction
      when 'down'
        prevPane.splitDown() if prevPane.parent.orientation isnt 'vertical'
      when 'up'
        prevPane.splitUp() if prevPane.parent.orientation isnt 'vertical'
      when 'left'
        prevPane.splitLeft() if prevPane.parent.orientation isnt 'horizontal'

    atom.workspace.open(uri, split: direction).then (@showTodoView) =>
      prevPane.activate()

  consumeStatusBar: (statusBar) ->
    atom.config.observe 'todo-show.statusBarIndicator', (newValue) =>
      if newValue
        TodoIndicatorView ?= require './todo-indicator-view'
        @todoIndicatorView ?= new TodoIndicatorView(@collection)
        @statusBarTile = statusBar.addLeftTile(item: @todoIndicatorView, priority: 200)
      else
        @destroyTodoIndicator()

  destroyTodoIndicator: ->
    @todoIndicatorView?.destroy()
    @todoIndicatorView = null
    @statusBarTile?.destroy()
    @statusBarTile = null
