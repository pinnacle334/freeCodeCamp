const textInput = document.getElementById("text-input");
const result = document.getElementById("result");
const button = document.getElementById("check-btn");

let inputWord = "";
let reverseInputWord = "";
let resultMessage = "";

const sortToAlphanumeric = (input) => {
    const regex = /^[a-zA-Z0-9]+$/;
    let newStr = "";
    for (let i = 0; i < input.length; i++) {
        if (regex.test(input[i])) {
            newStr += input[i].toLowerCase();
        }
    }
    return newStr;
}

const reverseString = (input) => {
    let newStr = "";
    for (let i = input.length - 1; i >= 0; i--) {
        newStr += input[i];
    }
    return newStr;
}

const isPalindrome = () => {
    if (textInput.value) {
        let input = textInput.value;
        inputWord = sortToAlphanumeric(input);
        reverseInputWord = reverseString(inputWord);
        if (inputWord === reverseInputWord) {
            resultMessage = `${textInput.value} is a palindrome`;
        } else {
            resultMessage = `${textInput.value} is not a palindrome`;
        }
        result.innerText = resultMessage;
        result.style.display = "block";
    } else {
        alert("Please input a value");
    }
}
button.addEventListener("click", isPalindrome);

