function AtualizarKPI() {
    var temperatura1 = sessionStorage.Temperatura1
    var temperatura2 = sessionStorage.Temperatura2
    var temperatura3 = sessionStorage.Temperatura3
    var temperatura4 = sessionStorage.Temperatura4

    if (temperatura1 < 0 || temperatura1 > 15) {
        alerta1.innerHTML = 'Tanque 1 - Super em alerta';
        boxalerta1.style.backgroundColor = "rgba(255, 0, 0, 0.211)";
    } else if (temperatura1 >= 0 && temperatura1 < 10 || temperatura1 > 12 && temperatura1 <= 15) {
        alerta1.innerHTML = 'Tanque 1- Em alerta';
        boxalerta1.style.backgroundColor = "#f6ffc2ba";
    } else {
        alerta1.innerHTML = '';
        boxalerta1.style.backgroundColor = "rgba(255, 255, 255, 0)";
    }
    if (temperatura2 <= 1 || temperatura2 >= 30) {
        alerta2.innerHTML = 'Tanque 2 - Super em alerta';
        boxalerta2.style.backgroundColor = "rgba(255, 0, 0, 0.211)";
    } else if (temperatura2 >= 2 && temperatura2 <= 17 || temperatura2 >= 21 && temperatura2 <= 29) {
        alerta2.innerHTML = 'Tanque 2 - Em alerta';
        boxalerta2.style.backgroundColor = "#f6ffc2ba";
    } else {
        alerta2.innerHTML = '';
        boxalerta2.style.backgroundColor = "rgba(255, 255, 255, 0)";
    }
    if (temperatura3 < 0 || temperatura3 > 15) {
        alerta3.innerHTML = 'Tanque 3 - Super em alerta';
        boxalerta3.style.backgroundColor = "rgba(255, 0, 0, 0.211)";
    } else if (temperatura3 >= 0 && temperatura3 < 10 || temperatura3 > 12 && temperatura3 <= 15) {
        alerta3.innerHTML = 'Tanque 3 - Em alerta';
        boxalerta3.style.backgroundColor = "#f6ffc2ba";
    } else {
        alerta3.innerHTML = '';
        boxalerta3.style.backgroundColor = "rgba(255, 255, 255, 0)";
    }
    if (temperatura4 <= 1 || temperatura4 >= 30) {
        alerta4.innerHTML = 'Tanque 4 - Super em alerta';
        boxalerta4.style.backgroundColor = "rgba(255, 0, 0, 0.211)";
    } else if (temperatura4 >= 2 && temperatura4 <= 17 || temperatura4 >= 21 && temperatura4 <= 29) {
        alerta4.innerHTML = 'Tanque 4 - Em alerta';
        boxalerta4.style.backgroundColor = "#f6ffc2ba";
    } else {
        alerta4.innerHTML = '';
        boxalerta4.style.backgroundColor = "rgba(255, 255, 255, 0)";
    }
}