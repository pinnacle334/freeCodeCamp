const inputText = document.getElementById("number");
const convertBtn = document.getElementById("convert-btn");
const outputText = document.getElementById("output");

convertBtn.addEventListener("click", () => {
    const input = parseInt(inputText.value, 10);

    if (isNaN(input)) {
        outputText.style.display = "block";
        outputText.innerText = "Please enter a valid number";
    }
    // Check for input less than 1
    else if (input < 1) {
        outputText.style.display = "block";
        outputText.innerText = "Please enter a number greater than or equal to 1";
    }
    // Check for input greater than or equal to 4000
    else if (input >= 4000) {
        outputText.style.display = "block";
        outputText.innerText = "Please enter a number less than or equal to 3999";
    }
    // Valid input case
    else {

        outputText.style.display = "block";
        outputText.innerText = convertToRoman(input);
    }
});

function convertToRoman(num) {
    const romanNumerals = [
        { value: 1000, symbol: "M" },
        { value: 900, symbol: "CM" },
        { value: 500, symbol: "D" },
        { value: 400, symbol: "CD" },
        { value: 100, symbol: "C" },
        { value: 90, symbol: "XC" },
        { value: 50, symbol: "L" },
        { value: 40, symbol: "XL" },
        { value: 10, symbol: "X" },
        { value: 9, symbol: "IX" },
        { value: 5, symbol: "V" },
        { value: 4, symbol: "IV" },
        { value: 1, symbol: "I" }
    ];

    let result = "";
    for (const { value, symbol } of romanNumerals) {
        while (num >= value) {
            result += symbol;
            num -= value;
        }
    }
    return result;
}
