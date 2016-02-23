@UserForm = React.createClass
  getInitialState: ->
    email: ''
  handleSubmit: (e) ->
    e.preventDefault()
    $.post '', { user: @state }, (data) =>
      @props.handleNewUser data
      @setState @getInitialState()
    , 'JSON'
  render: ->
    React.DOM.form
      className: 'form-inline'
      onSubmit: @handleSubmit
      React.DOM.div
        className: 'form-group'
        React.DOM.input
          type: 'email'
          className: 'form-control'
          placeholder: 'Email'
          name: 'email'
          value: @state.date
          onChange: @handleChange
      React.DOM.button
        type: 'submit'
        className: 'btn btn-primary'
        disabled: !@valid()
        'Create record'
  handleChange: (e) ->
    name = e.target.name
    @setState "#{ name }": e.target.value
  valid: ->
    @state.email
