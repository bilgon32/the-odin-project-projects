const vowels = ['a','e','i','o','u'];

function translate(toTranslate) {
	toTranslate = toTranslate.split(" ");

	for(i = 0; i < toTranslate.length; i++) {
		toTranslate[i] = pigLatinTranslation(toTranslate[i]);
	}
	return toTranslate.join(' ');
}

function pigLatinTranslation(toTranslate) {
	arrayWord = toTranslate.split('');
	if(vowels.indexOf(arrayWord[0]) < 0) {
		translatedWord = startsWithConsonant(arrayWord);
	} else {
		translatedWord = startsWithVowel(arrayWord);
	}
	return translatedWord;
}

function startsWithConsonant(arrayWord) {
	let lastConsonantFromPhoneme = 0;
	for(i = 1; i < arrayWord.length; i++) {
		if(vowels.indexOf(arrayWord[i]) < 0) {
			lastConsonantFromPhoneme = i;
		} else if (arrayWord[i] == 'u' && arrayWord[i-1] == 'q') {
			lastConsonantFromPhoneme = i;
		} else {
			i = arrayWord.length;
		}
	}

	let word = arrayWord.join('');
	translatedWord = word.slice(lastConsonantFromPhoneme+1) + word.slice(0, lastConsonantFromPhoneme+1) + 'ay';

	return translatedWord;
}

function startsWithVowel(word) {
	word = word.join('');
	translatedWord = word + 'ay';
	return translatedWord;
}

module.exports = {
	translate
}
