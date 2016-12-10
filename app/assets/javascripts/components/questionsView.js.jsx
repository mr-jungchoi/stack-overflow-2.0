class QuestionView extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      questions: []
    };
  }

  // componentDidMount() {
  //   this.fetchQuestions();
  // }
  //
  // fetchQuestions() {
  //   $.ajax({
  //     url: '/questions',
  //     method: 'get',
  //     dataType: "json"
  //   })
  //   .done((response) => {
  //     this.setState({
  //       questions: response
  //     });
  //   });
  // }

  render() {
    debugger
    return (
      <div><QuestionsList questions={this.props.questions} /></div>
    );
  }
}

function QuestionsList(props) {
  return (
    <div className="container">
      <ul>
        {props.questions.map(function(question, i) {
          return <Question key={i} question={question}/>
        })}
      </ul>
    </div>
  )
}

function Question(props) {
  return (
    <td>
      <div className="question">
        <a href='/questions/<%= question.id %>'><span className="question-title">{props.question.title}</span></a>
        <p> asked by
        <a href='<%= "/users/#{question.author.id}" %>'><span className="author-name">{props.question.author.username}</span></a>
        </p>
      </div>
    </td>
  )
}
