function add (x,y) {
	return x + y;
}

function subtract (x,y) {
	return x - y;
}

function sum (sumArray) {
	let sum = 0;
	sumArray.forEach(number => sum += +number);
	return sum;
}

function multiply (multArray) {
	let mult = 1;
	multArray.forEach(number => mult *= +number);
	return mult;
}

function power(x,y) {
	return Math.pow(x,y);
}

function factorial(number) {
	if(number < 1) {return 0}
	let factorial = 1;
	for(i = number; i > 1; i--) {
		factorial *= i;
	}
	return factorial;
}

module.exports = {
	add,
	subtract,
	sum,
	multiply,
    power,
	factorial
}
