const searchInput = document.getElementById("search-input");
const searchBtn = document.getElementById("search-button");
const displayBox = document.getElementById("display-box");
const pokemonName = document.getElementById("pokemon-name");
const pokemonId = document.getElementById("pokemon-id");
const weight = document.getElementById("weight");
const height = document.getElementById("height");
const types = document.getElementById("types");
const hp = document.getElementById("hp");
const attack = document.getElementById("attack");
const defense = document.getElementById("defense");
const specialAttack = document.getElementById("special-attack");
const specialDefense = document.getElementById("special-defense");
const speed = document.getElementById("speed");

const fetchPokemon = async () => {
    try {
        const response = await fetch("https://pokeapi-proxy.freecodecamp.rocks/api/pokemon");
        const data = await response.json();
        updateUI(data.results);
    } catch (err) {
        console.error(err);
    }
};

const searchPokemon = (input, allPokemon) => allPokemon.filter(pokemon => 
    pokemon.name.toLowerCase() === input.toLowerCase() || +pokemon.id === +input
);

const updateUI = async (allPokemon) => {
    const input = searchInput.value.trim();
    if (!input) return alert("Please enter a Pokémon name or ID");

    const specificPokemon = searchPokemon(input, allPokemon);
    if (specificPokemon.length === 0) return alert("Pokémon not found");

    const { url } = specificPokemon[0];
    try {
        const response = await fetch(url);
        const pokemon = await response.json();
        displayData(pokemon);
    } catch (err) {
        console.error(err);
    }
};

const displayData = (pokemon) => {
    types.innerHTML = "";
    pokemon.types.forEach(t => {
        const typeSpan = document.createElement("span");
        typeSpan.textContent = t.type.name.toUpperCase();
        types.appendChild(typeSpan);
    });

    pokemonName.textContent = pokemon.name;
    pokemonId.textContent = pokemon.id;
    weight.textContent = pokemon.weight;
    height.textContent = pokemon.height;
    hp.textContent = pokemon.stats.find(item => item.stat.name === 'hp')?.base_stat || "N/A";
    attack.textContent = pokemon.stats.find(item => item.stat.name === 'attack')?.base_stat || "N/A";
    defense.textContent = pokemon.stats.find(item => item.stat.name === 'defense')?.base_stat || "N/A";
    specialAttack.textContent = pokemon.stats.find(item => item.stat.name === 'special-attack')?.base_stat || "N/A";
    specialDefense.textContent = pokemon.stats.find(item => item.stat.name === 'special-defense')?.base_stat || "N/A";
    speed.textContent = pokemon.stats.find(item => item.stat.name === 'speed')?.base_stat || "N/A";

    const existingSprite = document.getElementById("sprite");
    if (existingSprite) existingSprite.remove();

    const sprite = document.createElement("img");
    sprite.id = "sprite";
    sprite.src = pokemon.sprites.front_default;
    displayBox.appendChild(sprite);
};

searchBtn.addEventListener("click", fetchPokemon);

