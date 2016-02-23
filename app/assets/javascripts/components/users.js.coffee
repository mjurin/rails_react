@Users = React.createClass
  getInitialState: ->
    users: @props.data
  getDefaultProps: ->
    users: []
  addUser: (user) ->
    users = React.addons.update(@state.users, { $push: [user] })
    @setState users: users
  deleteUser: (user) ->
    index = @state.users.indexOf user
    users = React.addons.update(@state.users, { $splice: [[index, 1]] })
    @replaceState users: users
  updateUser: (user, data) ->
    index = @state.users.indexOf user
    users = React.addons.update(@state.users, { $splice: [[index, 1, data]] })
    @replaceState users: users
  users_sum: ->
    users_sum = @state.users.length
  render: ->
    React.DOM.div
      className: 'users row'
      React.DOM.h2
        className: 'title col-sm-12'
        'Users'
      React.DOM.div
        className: 'col-sm-6'
        React.createElement UserForm, handleNewUser: @addUser
      React.DOM.div
        className: 'col-sm-6'
        React.createElement AmountBox, type: 'success', amount: @users_sum(), text: 'Users number'
      React.DOM.hr
        className: 'horizontal-line'
      React.DOM.table
        className: 'table table-bordered'
        React.DOM.thead null,
          React.DOM.tr null,
            React.DOM.th null, 'Email'
            React.DOM.th null, 'created_at'
            React.DOM.th null, 'Tasks'
            React.DOM.th null, 'Actions'
        React.DOM.tbody null,
          for user in @state.users
            React.createElement User, key: user.id, user: user, handleDeleteUser: @deleteUser, handleEditUser: @updateUser
