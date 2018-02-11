var fibonacci = function(input) {
  if(input<1) {
    return 'OOPS';
  }
  let output = [1, 1];
  for(i = 2; i < input; i++) {
    output[i] = output[i-2] + output[i-1];
  }
  return output[input-1];
}

module.exports = fibonacci
