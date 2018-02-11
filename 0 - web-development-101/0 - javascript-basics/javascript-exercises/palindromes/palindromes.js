var palindromes = function(value) {
  // let value = 'ZZZZ car, a man, a maraca.';
  let valueArray = [];

  for(i = 0, j = 0; j < value.length; j++) {
    if(value.charCodeAt(j) >= 65 && value.charCodeAt(j) <= 90 || value.charCodeAt(j) >= 97 && value.charCodeAt(j) <= 122) {
      valueArray[i] = value.slice(j,j+1);
      i++;
    }
  }

  for(i = 0, j = valueArray.length - 1; j >= 0; j--, i++) {
    if(valueArray[i].toUpperCase() != valueArray[j].toUpperCase()) {
      return false;
      break;
    } else {
      return true;
    }
  }
}

module.exports = palindromes
