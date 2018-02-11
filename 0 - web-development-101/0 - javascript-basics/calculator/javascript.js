const screen = document.getElementById('screen');
const buttons = [
  document.getElementById('DEL'),
  document.getElementById('CE'),
  document.getElementById('7'),
  document.getElementById('8'),
  document.getElementById('9'),
  document.getElementById('mult'),
  document.getElementById('4'),
  document.getElementById('5'),
  document.getElementById('6'),
  document.getElementById('div'),
  document.getElementById('1'),
  document.getElementById('2'),
  document.getElementById('3'),
  document.getElementById('minus'),
  document.getElementById('0'),
  document.getElementById('decimal'),
  document.getElementById('equal'),
  document.getElementById('add')
];

let primary = null;
let secondary = null;
let display = '0';
let operation = null;
let isEqual = false;

buttons.forEach(button => button.addEventListener('click',operate));

function operate(e) {
  let pressedButton = e.toElement.id;

  if(pressedButton >= 0 && pressedButton <= 9 || pressedButton == 'decimal') {
    if(pressedButton == 'decimal' && !(isNaN(display + '.'))) {
      display += '.';
    } else if (pressedButton != 'decimal') {
      display += pressedButton;
    }
    secondary = +display;
    if(display.length < 11){
      screen.textContent = +display;
    } else {
      screen.textContent = '<' + display.slice(-10);
    }
  }

  if(pressedButton == 'mult' || pressedButton == 'add' || pressedButton == 'minus' || pressedButton == 'div') {

    if(!secondary) {
      secondary = +display;
    }

    if(!primary) {
      operation = pressedButton;
      primary = secondary;
      secondary = 0;
    } else if (!isEqual) {
      operationChooser(operation);
    } else if (isEqual) {
      isEqual = false;
    }

    operation = pressedButton;
    screen.textContent = +primary;
    display = '0';

  } //if

  if(pressedButton == 'equal' && primary) {
    isEqual = true;
    operationChooser(operation);
    screen.textContent = +primary;
  }

  if(pressedButton == 'CE') {
    primary = null;
    secondary = null;
    display = '0';
    operation = null;
    isEqual = false;
    screen.textContent = +display;
  }
  variables_list();
} //function

function operationChooser(operation) {
  switch(operation) {
    case 'mult':
      primary = multiply();
      break;
    case 'add':
      primary = add();
      break;
    case 'minus':
      primary = subtract();
      break;
    case 'div':
      primary = divide();
      break;
    }
}

function add() {
  return +primary + +secondary;
}

function subtract() {
  return +primary - +secondary;
}

function multiply() {
  return +primary * +secondary;
}

function divide() {
  if(+secondary == 0) {
    alert("Can't divide by 0");
    return primary;
  } else {
    return +primary / +secondary;
  }
}

let variables = {}

function variables_list() {
  variables = {
    primary,
    secondary,
    display,
    operation
  };
  console.table(variables);
}
