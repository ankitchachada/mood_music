var Mood = React.createClass({
  propTypes: {
    input_url: React.PropTypes.string,
    status: React.PropTypes.string,
    output_url: React.PropTypes.string
  },
  render: function() {
    var mood = this.props.mood;
    return(
      <tr>
        <td>{mood.input_url}</td>
        <td>{mood.status}</td>
        <td>{mood.output_url}</td>
      </tr>
    )
  }
});