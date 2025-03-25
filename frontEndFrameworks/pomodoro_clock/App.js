class PomodoroClock extends React.Component {
    constructor(props) {
      super(props);
      this.state = {
        breakLength: 5, // Default break time in minutes
        sessionLength: 25, // Default session time in minutes
        timeLeft: 25 * 60, // Session time in seconds
        isRunning: false, // Timer running state
        isSession: true, // True = session, False = break
        timer: null, // Stores the interval function
      };
    }
  
    // Function to format time in mm:ss format
    formatTime = (time) => {
      let minutes = Math.floor(time / 60);
      let seconds = time % 60;
      return `${minutes < 10 ? "0" : ""}${minutes}:${seconds < 10 ? "0" : ""}${seconds}`;
    };
  
    // Start/Stop Timer
    handleStartStop = () => {
      if (this.state.isRunning) {
        clearInterval(this.state.timer);
        this.setState({ isRunning: false, timer: null });
      } else {
        const timer = setInterval(() => {
          this.setState((prevState) => {
            if (prevState.timeLeft === 0) {
              this.playBeep(); // Play beep when time reaches 00:00
              return {
                isSession: !prevState.isSession, // Switch between session and break
                timeLeft: prevState.isSession
                  ? prevState.breakLength * 60
                  : prevState.sessionLength * 60,
              };
            }
            return { timeLeft: prevState.timeLeft - 1 };
          });
        }, 1000);
        this.setState({ isRunning: true, timer });
      }
    };
  
    // Reset Timer
    handleReset = () => {
      clearInterval(this.state.timer);
      this.setState({
        breakLength: 5,
        sessionLength: 25,
        timeLeft: 25 * 60,
        isRunning: false,
        isSession: true,
        timer: null,
      });
      const beep = document.getElementById("beep");
      beep.pause();
      beep.currentTime = 0; // Rewind audio to start
    };
  
    // Function to handle increment (break/session)
    handleIncrement = (type) => {
      if (this.state[type] < 60) {
        this.setState((prevState) => ({
          [type]: prevState[type] + 1,
          timeLeft: type === "sessionLength" && !this.state.isRunning ? (prevState[type] + 1) * 60 : prevState.timeLeft,
        }));
      }
    };
  
    // Function to handle decrement (break/session)
    handleDecrement = (type) => {
      if (this.state[type] > 1) {
        this.setState((prevState) => ({
          [type]: prevState[type] - 1,
          timeLeft: type === "sessionLength" && !this.state.isRunning ? (prevState[type] - 1) * 60 : prevState.timeLeft,
        }));
      }
    };
  
    // Function to play beep sound
    playBeep = () => {
      const beep = document.getElementById("beep");
      beep.play();
    };
  
    render() {
      return (
        <div className="pomodoro-clock" style={{ textAlign: "center", fontFamily: "Arial" }}>
          {/* Break Section */}
          <div>
            <h2 id="break-label">Break Length</h2>
            <button id="break-decrement" onClick={() => this.handleDecrement("breakLength")}>-</button>
            <span id="break-length">{this.state.breakLength}</span>
            <button id="break-increment" onClick={() => this.handleIncrement("breakLength")}>+</button>
          </div>
  
          {/* Session Section */}
          <div>
            <h2 id="session-label">Session Length</h2>
            <button id="session-decrement" onClick={() => this.handleDecrement("sessionLength")}>-</button>
            <span id="session-length">{this.state.sessionLength}</span>
            <button id="session-increment" onClick={() => this.handleIncrement("sessionLength")}>+</button>
          </div>
  
          {/* Timer Display */}
          <div>
            <h2 id="timer-label">{this.state.isSession ? "Session" : "Break"}</h2>
            <h1 id="time-left">{this.formatTime(this.state.timeLeft)}</h1>
          </div>
  
          {/* Controls */}
          <div>
            <button id="start_stop" onClick={this.handleStartStop}>{this.state.isRunning ? "Pause" : "Start"}</button>
            <button id="reset" onClick={this.handleReset}>Reset</button>
          </div>
  
          {/* Beep Sound */}
          <audio
            id="beep"
            src="https://www.soundjay.com/button/beep-07.wav"
          ></audio>
        </div>
      );
    }
  }
  
  ReactDOM.render(<PomodoroClock />, document.getElementById("root"));
  