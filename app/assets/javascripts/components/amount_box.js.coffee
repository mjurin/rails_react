@AmountBox = React.createClass
  render: ->
    React.DOM.div
      className: "panel panel-#{ @props.type }"
      React.DOM.div
        className: 'panel-body'
        @props.text + ': ' + @props.amount
