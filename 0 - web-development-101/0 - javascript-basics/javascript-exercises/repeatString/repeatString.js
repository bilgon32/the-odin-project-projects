var repeatString = function(string,numberOfTimes) {
  if (numberOfTimes < 0) {
    return 'ERROR'
  }
  let finalString = '';
  for(i = 0; i < numberOfTimes; i++) {
    finalString += string;
  }
  return finalString
}

module.exports = repeatString
