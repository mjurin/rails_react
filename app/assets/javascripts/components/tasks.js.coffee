@Tasks = React.createClass
  getInitialState: ->
    user: @props.user,
    tasks: @props.tasks
  getDefaultProps: ->
    user: null,
    tasks: []
  handleBackToUserList: ->
    window.location = "/users/";
  addTask: (task) ->
    tasks = React.addons.update(@state.tasks, { $push: [task] })
    @setState tasks: tasks
  updateTask: (task, data) ->
    index = @state.tasks.indexOf task
    tasks = React.addons.update(@state.tasks, { $splice: [[index, 1, data]] })
    @replaceState tasks: tasks
  render: ->
    React.DOM.div
      className: 'title row'
      React.DOM.div
        className: 'col-sm-12'
        React.DOM.h2
          className: 'title'
          'User tasks ' + @props.user.email
      React.DOM.div
        className: 'col-sm-6'
        React.createElement TaskForm, handleNewTask: @addTask
      React.DOM.div
        className: 'col-sm-6'
        React.DOM.a
          className: 'btn btn-default'
          onClick: @handleBackToUserList
          'Back to user list'
      React.DOM.hr
        className: 'horizontal-line'
      for task in @state.tasks
        React.DOM.div
          className: 'col-sm-4'
          React.createElement Task, key: task.id, task: task, handleCompleteTask: @updateTask
