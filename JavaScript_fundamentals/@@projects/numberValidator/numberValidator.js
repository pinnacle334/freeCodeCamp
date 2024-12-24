const userInput = document.getElementById("user-input");
const result = document.getElementById("results-div");
const checkBtn = document.getElementById("check-btn");
const clearBtn = document.getElementById("clear-btn");

const numRegex1 = /^1?(\s*\([0-9]{3}\))(\s*-?[0-9]{3}\s*-?)[0-9]{4}$/;
const numRegex2 = /^1?(\s*[0-9]{3})(\s*-?[0-9]{3}\s*-?)[0-9]{4}$/;

const validRegex = [numRegex1, numRegex2];

const checkValidity = () => {
    const msg = document.createElement('p');
    const input = userInput.value.trim();
    if (input === "") {
        console.log("Empty input");
        alert("Please provide a phone number");
    } else {
        const isValid = validRegex.some((regex) => regex.test(input)); 
        msg.textContent = (isValid) ? `Valid US number: ${input}` : `Invalid US number: ${input}`;
    }
    result.appendChild(msg);
    clearInput();
}

const clearMsg = () => result.innerHTML = "";
const clearInput = () => userInput.value = "";


checkBtn.addEventListener("click", checkValidity);
userInput.addEventListener("keydown", (event) => {
    //event.preventDefault();
    if (event.key === "Enter") {
        checkValidity();
    }
    });
clearBtn.addEventListener("click", clearMsg);

