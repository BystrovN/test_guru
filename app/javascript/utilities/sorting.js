document.addEventListener('turbolinks:load', () => {
  const control = document.querySelector('.sort-by-title');

  if (control) { control.addEventListener('click', sortRowsByTitle); }
});

function sortRowsByTitle() {
  const table = document.querySelector('table');

  const tableClass = table.getAttribute('class');
  const tableStyle = table.getAttribute('style');

  const rows = table.querySelectorAll('tr');
  const sortedRows = [];

  // select all table rows except the first one which is the header
  for (let i = 1; i < rows.length; i++) {
    sortedRows.push(rows[i]);
  }

  if (this.querySelector('.octicon-arrow-up').classList.contains('hide')) {
    sortedRows.sort(compareRowsAsc);
    this.querySelector('.octicon-arrow-up').classList.remove('hide');
    this.querySelector('.octicon-arrow-down').classList.add('hide');
  } else {
    sortedRows.sort(compareRowsDesc);
    this.querySelector('.octicon-arrow-down').classList.remove('hide');
    this.querySelector('.octicon-arrow-up').classList.add('hide');
  }

  const sortedTable = document.createElement('table');
  sortedTable.setAttribute('class', tableClass);
  sortedTable.setAttribute('style', tableStyle);

  const thead = document.createElement('thead');
  const tbody = document.createElement('tbody');

  thead.appendChild(rows[0]);

  for (let i = 0; i < sortedRows.length; i++) {
    tbody.appendChild(sortedRows[i]);
  }

  sortedTable.appendChild(thead);
  sortedTable.appendChild(tbody);

  table.parentNode.replaceChild(sortedTable, table);
}

function compareRowsAsc(row1, row2) {
  const testTitle1 = row1.querySelector('td').textContent;
  const testTitle2 = row2.querySelector('td').textContent;

  if (testTitle1 < testTitle2) { return -1; }
  if (testTitle1 > testTitle2) { return 1; }
  return 0;
}

function compareRowsDesc(row1, row2) {
  const testTitle1 = row1.querySelector('td').textContent;
  const testTitle2 = row2.querySelector('td').textContent;

  if (testTitle1 < testTitle2) { return 1; }
  if (testTitle1 > testTitle2) { return -1; }
  return 0;
}
