//THESE ARE IN ONE FILE. RESTRUCTURE THEM IN A BETTER REACT APP

const Twitter = ({ color }) => {
    return (
      <div className="icons" style={{ backgroundColor: color }}>
        <a href="twitter.com/intent/tweet" id="tweet-quote" target="_blank" style={{ color: "white" }}><i className="bi bi-twitter"></i></a>
      </div>
    );
  };
  
  const Facebook = ({ color }) => {
    return (
      <div className="icons" style={{ backgroundColor: color }}>
        <a href="#" target="_blank" style={{ color: "white" }}><i className="bi bi-facebook"></i></a>
      </div>
    );
  };
  
  class QuoteBox extends React.Component {
    constructor(props) {
      super(props);
      this.state = {
        quote: "The Lord is my shepherd, I shall not want.",
        author: "Psalm 23:1",
        color: this.colorGen()
      };
      this.getQuote = this.getQuote.bind(this);
      this.colorGen = this.colorGen.bind(this);
    }
    
    colorGen(){
      const r = Math.floor(Math.random() * 100); // 0-99 (Dark Red)
      const g = Math.floor(Math.random() * 100); // 0-99 (Dark Green)
      const b = Math.floor(Math.random() * 100); // 0-99 (Dark Blue)
    
      return `#${r.toString(16).padStart(2, '0')}${g.toString(16).padStart(2, '0')}${b.toString(16).padStart(2, '0')}`;
    };
  
    getQuote() {
      const quotes = [
        { text: "Believe you can and you're halfway there.", author: "Theodore Roosevelt" },
        { text: "The only limit to our realization of tomorrow is our doubts of today.", author: "Franklin D. Roosevelt" },
        { text: "Act as if what you do makes a difference. It does.", author: "William James" }
      ];
      
      const randomIndex = Math.floor(Math.random() * quotes.length);
      const color = this.colorGen();
      
      this.setState({
        quote: quotes[randomIndex].text,
        author: quotes[randomIndex].author,
        color : color
      });
    }
    
    componentDidMount() {
      document.body.style.backgroundColor = this.state.color;
    }
  
    render() {
      return (
        <div className="d-flex flex-column" id="quote-box">
            <div>
                <div id="text" style={{ color: this.state.color }}>
              <h3><i style={{ fontSize: 55, color: this.state.color }} className="bi bi-quote"></i>{this.state.quote}</h3>
               </div>
               <p id="author" className="text-end" style={{ color: this.state.color }}>- {this.state.author}</p>
            </div>
            <div className="d-flex justify-content-between">
                <div className="d-flex gap-2">
                  <Twitter color={this.state.color}/>
                  <Facebook color={this.state.color}/>
               </div>
               <button id="new-quote" style={{ backgroundColor: this.state.color }} onClick={this.getQuote}>New Quote</button>
            </div>
        </div>
      );
    }
  }
  
  class App extends React.Component {
    render() {
      return (
        <div id="container" className="">
          <QuoteBox />
          <p id="owner" className="text-center">- by Michael Ekanem</p>
        </div>
      );
    }
  }
  
  ReactDOM.render(<App />, document.getElementById("root"));