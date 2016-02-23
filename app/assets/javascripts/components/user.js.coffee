@User = React.createClass
  getInitialState: ->
    edit: false
  handleToggle: (e) ->
    e.preventDefault()
    @setState edit: !@state.edit
  handleRedirectToTasks: (e) ->
    window.location = "/users/#{ @props.user.id }/tasks";
  handleDelete: (e) ->
    e.preventDefault()
    $.ajax
      method: 'DELETE'
      url: "/users/#{ @props.user.id }"
      dataType: 'JSON'
      success: () =>
        @props.handleDeleteUser @props.user
  handleEdit: (e) ->
    e.preventDefault()
    data =
      email: ReactDOM.findDOMNode(@refs.email).value
      created_at: ReactDOM.findDOMNode(@refs.created_at).value
    $.ajax
      method: 'PUT'
      url: "/users/#{ @props.user.id }"
      dataType: 'JSON'
      data:
        user: data
      success: (data) =>
        @setState edit: false
        @props.handleEditUser @props.user, data
  userForm: ->
    React.DOM.tr null,
      React.DOM.td null,
        React.DOM.input
          className: 'form-control'
          type: 'email'
          defaultValue: @props.user.email
          ref: 'email'
      React.DOM.td null,
        React.DOM.input
          className: 'form-control'
          type: 'datetime'
          defaultValue: @props.user.created_at
          ref: 'created_at'
      React.DOM.td null,
        React.DOM.a
          className: 'btn btn-default'
          onClick: @handleRedirectToTasks
          'Tasks'
      React.DOM.td null,
        React.DOM.a
          className: 'btn btn-default'
          onClick: @handleEdit
          'Update'
        React.DOM.a
          className: 'btn btn-danger'
          onClick: @handleToggle
          'Cancel'
  userRow: ->
    React.DOM.tr null,
      React.DOM.td null, @props.user.email
      React.DOM.td null, @props.user.created_at
      React.DOM.td null,
        React.DOM.a
          className: 'btn btn-default'
          onClick: @handleRedirectToTasks
          'Tasks'
      React.DOM.td null,
        React.DOM.a
          className: 'btn btn-default'
          onClick: @handleToggle
          'Edit'
        React.DOM.a
          className: 'btn btn-danger'
          onClick: @handleDelete
          'Delete'

  render: ->
    if @state.edit
      @userForm()
    else
      @userRow()
