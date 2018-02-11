var pigLatin = require("./pigLatin.js");

describe('#translate', function() {
	it('translates a word beginning with a vowel', function() {
		s = pigLatin.translate("apple");
		expect(s).toEqual('appleay');
	});

	it('translates a word beginning with a consonant', function() {
		s = pigLatin.translate("banana");
		expect(s).toEqual("ananabay");
	});

	it('translates a word beginning with two consonants', function() {
		s = pigLatin.translate("cherry");
		expect(s).toEqual('errychay');
	});

	it('translates two words', function() {
		s = pigLatin.translate("eat pie");
		expect(s).toEqual('eatay iepay');
	});

	it('translates a word beginning with three consonants', function() {
		expect(pigLatin.translate("three")).toEqual("eethray");
	});

	it('counts "sch" as a single phoneme', function() {
		s = pigLatin.translate("school");
		expect(s).toEqual("oolschay");
	});

	it('counts "qu" as a single phoneme', function() {
		s = pigLatin.translate("quiet");
		expect(s).toEqual("ietquay");
	});

	it('counts "qu" as a consonant even when its preceded by a consonant', function() {
		s = pigLatin.translate("square");
		expect(s).toEqual("aresquay");
	});

	it('translates many words', function() {
		s = pigLatin.translate("the quick brown fox");
		expect(s).toEqual("ethay ickquay ownbray oxfay");
	});
});
