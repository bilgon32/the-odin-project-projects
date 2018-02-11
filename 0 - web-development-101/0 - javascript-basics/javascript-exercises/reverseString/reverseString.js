var reverseString = function(string) {
  let stringLength = string.length;
  let slicedString = [];
  let reverseString = [];

  for (i = 0; i < stringLength; i++) {
    slicedString[i] = string.slice(i,i+1);
  }

  for (i = 0, j = stringLength; i < stringLength; i++, j--) {
    reverseString[i] = slicedString[j-1];
  }

  reverseString = reverseString.join('');

  return reverseString
}

module.exports = reverseString
