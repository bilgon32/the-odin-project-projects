const container = document.getElementById('container');
const colorChooser = document.getElementById('colors');
let boxes;
let gridSize = 16;
let selectedColor = 'red';

colorChooser.addEventListener('change',function () {
  selectedColor = colorChooser.value;
});

document.getElementById('reset').addEventListener('click',resetGrid);

function resetGrid() {
  gridSize = prompt('Grid size (n x n)');
  if(gridSize == null || gridSize == '') {
    return;
  }
  while(!Number.isInteger(Number(gridSize)) || gridSize < 1 || gridSize > 64) {
    gridSize = prompt('The size entered is invalid or too big.');
    if(gridSize == null || gridSize == '') {
      return;
    }
  }
  createDivs(gridSize);
}

function createDivs(grid = 16) {
  container.innerHTML = '';
  container.style = `grid-template-columns: repeat(${grid}, 1fr)`;

  for(i = 0; i < grid ** 2; i++) {
    container.innerHTML += `<div id="${i}" class="box"></div>`;
  }

  boxes = Array.from(document.querySelectorAll(".box"));
  boxes.forEach(box => box.addEventListener('mouseenter',changeColor));
}

function changeColor() {
  if(selectedColor == 'red' || selectedColor == 'green' || selectedColor == 'blue') {
    this.style.opacity = 1;
    this.style.backgroundColor = selectedColor;
  }
  else if (selectedColor == 'random') {
    this.style.opacity = 1;
    this.style.backgroundColor = 'rgb(' + Math.floor(Math.random() * 255) + ',' +
        Math.floor(Math.random() * 255) + ',' + Math.floor(Math.random() * 255) +
        ')';
  }
  else if (selectedColor == 'transparent') {
    if(this.style.backgroundColor != 'black'){
      this.style.opacity = 0.1;
      this.style.backgroundColor = 'black';
    } else if(this.style.opacity < 1){
      this.style.opacity = Number(this.style.opacity) + 0.1;
      this.style.backgroundColor = 'black';
    }
  }

}


createDivs();
