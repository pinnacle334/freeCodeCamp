class DrumMachine extends React.Component {
    constructor(props) {
      super(props);
      this.state = {
        displayText: "" // To show the name of the triggered drum sound
      };
      this.handlePlaySound = this.handlePlaySound.bind(this);
      this.handleKeyPress = this.handleKeyPress.bind(this);
    }
    
    componentDidMount() {
      document.addEventListener("keydown", this.handleKeyPress);
    }
    
    componentWillUnmount() {
      document.removeEventListener("keydown", this.handleKeyPress);
    }
    
    handleKeyPress(event) {
      const key = event.key.toUpperCase();
      const drumPad = document.getElementById(key);
      if (drumPad) {
        drumPad.parentElement.click(); // Simulate click on the drum-pad
      }
    }
    
    handlePlaySound(audioId, soundName) {
      const audio = document.getElementById(audioId);
      if (audio) {
        audio.currentTime = 0;
        audio.play();
        this.setState({ displayText: soundName });
      }
    }
    
    render() {
      const drumPads = [
        { key: "Q", sound: "Heater 1", src: "https://s3.amazonaws.com/freecodecamp/drums/Heater-1.mp3" },
        { key: "W", sound: "Heater 2", src: "https://s3.amazonaws.com/freecodecamp/drums/Heater-2.mp3" },
        { key: "E", sound: "Heater 3", src: "https://s3.amazonaws.com/freecodecamp/drums/Heater-3.mp3" },
        { key: "A", sound: "Heater 4", src: "https://s3.amazonaws.com/freecodecamp/drums/Heater-4_1.mp3" },
        { key: "S", sound: "Clap", src: "https://s3.amazonaws.com/freecodecamp/drums/Heater-6.mp3" },
        { key: "D", sound: "Open-HH", src: "https://s3.amazonaws.com/freecodecamp/drums/Dsc_Oh.mp3" },
        { key: "Z", sound: "Kick-n'-Hat", src: "https://s3.amazonaws.com/freecodecamp/drums/Kick_n_Hat.mp3" },
        { key: "X", sound: "Kick", src: "https://s3.amazonaws.com/freecodecamp/drums/RP4_KICK_1.mp3" },
        { key: "C", sound: "Closed-HH", src: "https://s3.amazonaws.com/freecodecamp/drums/Cev_H2.mp3" }
      ];
      
      return (
        <div id="drum-machine" style={{ textAlign: "center", padding: "20px" }}>
          <h2>React Drum Machine</h2>
          <div id="display" style={{ marginBottom: "20px", fontSize: "20px", fontWeight: "bold" }}>
            {this.state.displayText}
          </div>
          <div style={{ display: "grid", gridTemplateColumns: "repeat(3, 100px)", gap: "10px", justifyContent: "center" }}>
            {drumPads.map(pad => (
              <div
                key={pad.key}
                id={pad.sound}
                className="drum-pad"
                style={{ padding: "20px", border: "2px solid black", textAlign: "center", cursor: "pointer" }}
                onClick={() => this.handlePlaySound(pad.key, pad.sound)}
              >
                {pad.key}
                <audio className="clip" id={pad.key} src={pad.src}></audio>
              </div>
            ))}
          </div>
        </div>
      );
    }
  }
  
  ReactDOM.render(<DrumMachine />, document.getElementById("root")); 