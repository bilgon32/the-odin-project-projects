var snakeCase = function(string) {
  string = string.replace(/[-]/g , ' ');

  string = string.replace(/\.\./g , ' ');

  string = string.replace(/[^A-Za-z ]/g , '');

  if(string.indexOf(' ') < 0) {
    string = string.replace(/([A-Z])/g , ' $1');
  }

  string = string.trim();

  stringArray = string.split(" ");
  return stringArray
                .join('_')
                .toLowerCase();
}

module.exports = snakeCase
