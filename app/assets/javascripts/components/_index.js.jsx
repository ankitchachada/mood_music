var MoodTable = React.createClass({ 
	 render: function() {
    var moods = [];
    this.props.moods.forEach(function(mood) {
      moods.push(<Mood mood={mood}
                         key={'mood' + mood.id}/>);
    }.bind(this));  return(
      <table className="table table-striped">
        <thead>
          <tr>
            <th className="col-md-4">Input URL</th>
            <th className="col-md-4"><a href="/moods?sort=asc" id="status" value="asc">Status</a></th>
            <th className="col-md-4">Output URL</th>
          </tr>
        </thead>
        <tbody>{moods}</tbody>
      </table>
    )	

   
} 
});

