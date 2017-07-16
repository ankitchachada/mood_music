var Main = React.createClass({
 getInitialState: function() {
    return { moods: [] };
  },
  componentDidMount: function() {
    /*
      Solution for sorting is an hack. It can be improved by implementing react library
    */
    if (window.location.href.indexOf("sort") == -1)
      $.getJSON('/moods.json', (response) => { this.setState({ moods: response }) });
    else{
      if (window.location.href.indexOf("asc") == -1){
       $('#status').attr('href','/moods?sort=asc');
        $.getJSON('/moods.json?sort=asc', (response) => { this.setState({ moods: response }) }); 
      }
      else {
       $('#status').attr('href','/moods?sort=desc');
        $.getJSON('/moods.json?sort=desc', (response) => { this.setState({ moods: response }) }); 
      }
      } 
    },

  render: function() {
    return(
      
        <div className="row">
          <div className="col-md-12">
            <MoodTable  moods={this.state.moods}/>
          </div>
        </div>
     
    )
  }
});