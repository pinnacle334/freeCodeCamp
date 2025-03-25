class Calculator extends React.Component {
    constructor(props) {
      super(props);
      this.state = {
        input: "0",
        expression: "",
        lastClicked: "",
      };
    }
  
    handleClear = () => {
      this.setState({ input: "0", expression: "", lastClicked: "" });
    };
  
    handleNumberClick = (num) => {
      this.setState((prevState) => {
        const { input, expression, lastClicked } = prevState;
  
        let newInput = input === "0" || /[+\-*/=]/.test(lastClicked) ? num : input + num;
        let newExpression = expression === "0" ? num : expression + num;
  
        return {
          input: newInput,
          expression: newExpression,
          lastClicked: num,
        };
      });
    };
  
    handleOperatorClick = (operator) => {
      this.setState((prevState) => {
        let { expression, lastClicked } = prevState;
  
        if (/[*/+.-]$/.test(expression)) {
          if (operator === "-" && lastClicked !== "-") {
            expression += operator; // Allow negative numbers
          } else {
            expression = expression.replace(/[*/+.-]+$/, operator); // Replace other operators
          }
        } else {
          expression += operator;
        }
  
        return { input: operator, expression, lastClicked: operator };
      });
    };
  
    handleDecimalClick = () => {
      this.setState((prevState) => {
        const { input, expression, lastClicked } = prevState;
  
        if (!input.includes(".")) {
          return {
            input: input + ".",
            expression: expression + ".",
            lastClicked: ".",
          };
        }
      });
    };
  
    handleEqualsClick = () => {
      try {
        let result = eval(this.state.expression);
        result = parseFloat(result.toFixed(4));
  
        this.setState({
          input: result.toString(),
          expression: result.toString(),
          lastClicked: "=",
        });
      } catch (error) {
        this.setState({ input: "Error", expression: "", lastClicked: "" });
      }
    };
  
    render() {
      return (
        <div style={{ width: "300px", margin: "auto", textAlign: "center", fontFamily: "Arial, sans-serif", border: "2px solid black", borderRadius: "10px", padding: "10px", background: "#f4f4f4" }}>
          <div id="display" style={{ fontSize: "24px", background: "#ddd", padding: "10px", marginBottom: "10px", textAlign: "right" }}>
            {this.state.input}
          </div>
          <div>
            <button id="clear" onClick={this.handleClear} style={{ width: "100%", padding: "10px", background: "red", color: "white", fontSize: "18px" }}>C</button>
          </div>
          <div style={{ display: "grid", gridTemplateColumns: "repeat(4, 1fr)", gap: "5px", marginTop: "10px" }}>
            <button id="divide" onClick={() => this.handleOperatorClick("/")} >/</button>
            <button id="multiply" onClick={() => this.handleOperatorClick("*")} >*</button>
            <button id="subtract" onClick={() => this.handleOperatorClick("-")} >-</button>
            <button id="add" onClick={() => this.handleOperatorClick("+")} >+</button>
  
            {[...Array(10).keys()].map(num => (
              <button key={num} id={["zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"][num]} onClick={() => this.handleNumberClick(num.toString())}>{num}</button>
            ))}
  
            <button id="decimal" onClick={this.handleDecimalClick} >.</button>
            <button id="equals" onClick={this.handleEqualsClick} style={{ background: "green", color: "white" }}>=</button>
          </div>
        </div>
      );
    }
  }
  
  ReactDOM.render(<Calculator />, document.getElementById("root"));
  