@Task = React.createClass
  getInitialState: ->
    completed: @props.task.completed_on
  handleComplete: (e) ->
    e.preventDefault()
    today_date = (new Date())
    data =
      completed_on: today_date
    $.ajax
      method: 'PUT'
      url: "/users/#{ @props.task.user_id }/tasks/#{ @props.task.id }"
      dataType: 'JSON'
      data:
        task: data
      success: (data) =>
        @setState completed: true
        @props.handleCompleteTask @props.task, data
  taskShow: ->
    React.DOM.div
      className: 'task panel panel-default'
      React.DOM.div
        className: 'task-description panel-title panel-heading'
        @props.task.description
      React.DOM.div
        className: 'task-due-date panel-body'
        'Task due date: ' + @props.task.due_date_on
      React.DOM.div
        className: 'task-complete panel-footer'
        React.DOM.a
          className: 'btn btn-default btn-primary'
          onClick: @handleComplete
          'Complete task'
  taskShowCompleted: ->
    React.DOM.div
      className: 'task panel panel-info'
      React.DOM.div
        className: 'task-description panel-title panel-heading'
        @props.task.description
      React.DOM.div
        className: 'task-due-date panel-body'
        'Task due date: ' + @props.task.due_date_on
      React.DOM.div
        className: 'task-complete panel-footer'
        React.DOM.div
          className: 'task-completed_on'
          'Task completed_on: ' +@props.task.completed_on


  render: ->
    if @state.completed
      @taskShowCompleted()
    else
      @taskShow()
