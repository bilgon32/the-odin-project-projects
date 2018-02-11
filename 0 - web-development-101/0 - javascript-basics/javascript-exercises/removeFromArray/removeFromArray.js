let removeFromArray = function() {
  let originalArray = arguments[0];

  for(i = 1; i <= arguments.length - 1; i++){
    let location = originalArray.indexOf(arguments[i]);
    if(location != -1) {
      originalArray.splice(location,1);
    }
  }

  return originalArray
}

module.exports = removeFromArray
