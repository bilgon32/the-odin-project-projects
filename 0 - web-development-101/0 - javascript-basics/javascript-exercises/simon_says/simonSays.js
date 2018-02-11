function echo(value) {
	return value;
}

function shout(value) {
	return value.toUpperCase();
}

function repeat(value, times = 2) {
	let output = value;
	for(i = 1; i < times; i++) {
		output += ' ' + value;
	}
	return output;
}

function pieceOfWord(value, pos) {
	return value.slice(0,pos);
}

function firstWord(value) {
	let pos = value.indexOf(' ');
	return value.slice(0, pos);
}

function capitalize(word) {
	return word.charAt(0).toUpperCase() + word.slice(1);
	// This function just capitalizes the word given to it, use in conjunction with titleCreator
}

function titleCreator(value) {
	let splitted = value.split(' ');
	let string = capitalize(splitted[0]);

	return string;
}

module.exports = {
	echo,
	shout,
	repeat,
	pieceOfWord,
	firstWord,
	titleCreator
}
