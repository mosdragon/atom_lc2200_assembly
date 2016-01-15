AtomLc2200AssemblyView = require './atom-lc2200-assembly-view'
{CompositeDisposable} = require 'atom'

module.exports = AtomLc2200Assembly =
  atomLc2200AssemblyView: null
  modalPanel: null
  subscriptions: null

  activate: (state) ->
    @atomLc2200AssemblyView = new AtomLc2200AssemblyView(state.atomLc2200AssemblyViewState)
    @modalPanel = atom.workspace.addModalPanel(item: @atomLc2200AssemblyView.getElement(), visible: false)

    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace', 'atom-lc2200-assembly:toggle': => @toggle()

  deactivate: ->
    @modalPanel.destroy()
    @subscriptions.dispose()
    @atomLc2200AssemblyView.destroy()

  serialize: ->
    atomLc2200AssemblyViewState: @atomLc2200AssemblyView.serialize()

  toggle: ->
    console.log 'AtomLc2200Assembly was toggled!'

    if @modalPanel.isVisible()
      @modalPanel.hide()
    else
      @modalPanel.show()
