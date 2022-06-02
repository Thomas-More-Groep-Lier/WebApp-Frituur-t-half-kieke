    function confirmDelete(id){
    const ok = confirm("Weet je zeker dat je dit artikel wenst te verwijderen?")
    if (ok) {
    window.location.href = `/Admin/Product/Delete?id=${id}`;
}
}

function deleteCondiment(id){
        window.location.href = `/Admin/Product/DeleteCondiment?id=${id}`;
}
    function changeDisplay() {
    let select = document.getElementById('category');
    let value = select.options[select.selectedIndex].value;
    let Frieten = Array.from(document.getElementsByClassName("Frieten"));
    for (const row of Frieten) {
    row.style.cssText = "display: none;";
}
    let Snack = Array.from(document.getElementsByClassName("Snack"));
    for (const row of Snack) {
    row.style.cssText = "display: none;";
}
    let VegetarischeSnacks = Array.from(document.getElementsByClassName("VegetarischeSnack"));
    for (const row of VegetarischeSnacks) {
    row.style.cssText = "display: none;";
}
    let KoudeSauzen = Array.from(document.getElementsByClassName("KoudeSaus"));
    for (const row of KoudeSauzen) {
    row.style.cssText = "display: none;";
}
    let WarmeSauzen = Array.from(document.getElementsByClassName("WarmeSaus"));
    for (const row of WarmeSauzen) {
    row.style.cssText = "display: none;";
}
    let Frisdrank = Array.from(document.getElementsByClassName("Frisdrank"));
    for (const row of Frisdrank) {
    row.style.cssText = "display: none;";
}
    let Bier = Array.from(document.getElementsByClassName("Bier"));
    for (const row of Bier) {
    row.style.cssText = "display: none;";
}

    switch (value) {
    //         <option value="1">Frieten</option>
    case "1":
    for (const row of Frieten) {
    row.style.cssText = "";
}
    break;
    //         <option value="2">Snack</option>
    case "2":
    for (const row of Snack) {
    row.style.cssText = "";
}
    break;
    //         <option value="3">Vegetarische Snack</option>
    case "3":
    for (const row of VegetarischeSnacks) {
    row.style.cssText = "";
}
    break;
    //         <option value="4">Koude Saus</option>
    case "4":
    for (const row of KoudeSauzen) {
    row.style.cssText = "";
}
    break;
    //         <option value="5">Warme Saus</option>
    case "5":
    for (const row of WarmeSauzen) {
    row.style.cssText = "";
}
    break;
    //         <option value="6">Frisdrank</option>
    case "6":
    for (const row of Frisdrank) {
    row.style.cssText = "";
}
    break;
    //         <option value="7">Bier</option>
    case "7":
    for (const row of Bier) {
    row.style.cssText = "";
}
    break;
    default:
    for (const row of Frieten) {
    row.style.cssText = "";
}
    for (const row of Snack) {
    row.style.cssText = "";
}
    for (const row of VegetarischeSnacks) {
    row.style.cssText = "";
}
    for (const row of KoudeSauzen) {
    row.style.cssText = "";
}
    for (const row of WarmeSauzen) {
    row.style.cssText = "";
}
    for (const row of Frisdrank) {
    row.style.cssText = "";
}
    for (const row of Bier) {
    row.style.cssText = "";
}
    break;

}

}
    function addNew(id) {
    if (id !== undefined && id !== null) {
    let price = document.getElementById(`productPrice_` + id).innerText.replace("€", "");
    let select = document.getElementById('category');
    document.getElementById('productId').value = id;
    document.getElementById('btnAdd').classList.add('d-none');
    document.getElementById('btnEdit').classList.remove('d-none');
    document.getElementById('btnClear').classList.remove('d-none');
    document.getElementById('productPrice').value = Number(price.replace(/,/g, '.'));
    document.getElementById('productName').value = document.getElementById(`productName_` + id).innerText;
    let classList = document.getElementById(id).classList;
    let category = "";
    for (let x = 0; x < classList.length; x++){
        category = classList[x];
    }
    switch (category){
        case "Frieten":document.getElementById('productCategory').value = 1;
            break
        case "Snack": document.getElementById('productCategory').value = 2;
            break;
        case "VegetarischeSnack": document.getElementById('productCategory').value = 3;
            break;
        case "KoudeSaus": document.getElementById('productCategory').value = 4;
            break;
        case "WarmeSaus": document.getElementById('productCategory').value = 5;
            break;
        case "Frisdrank": document.getElementById('productCategory').value = 6
            break;
        case "Bier": document.getElementById('productCategory').value = 7;
            break;
        default: document.getElementById('productCategory').value = select.options[select.selectedIndex].value;
            break;
    }
} else {
    document.getElementById('productId').value = id;
    document.getElementById('btnAdd').classList.remove('d-none');
    document.getElementById('btnClear').classList.add('d-none');
    document.getElementById('btnEdit').classList.add('d-none');
    document.getElementById('productPrice').value = "";
    document.getElementById('productName').value = "";
    document.getElementById('productCategory').value = "";
}

}

    function clearId() {
    addNew();
}