var selectedProducts = [];
var product = {};
var newQuantity = 0;
var str = localStorage.getItem("array");
var parsedArr = JSON.parse(str);

fillInput();
updateCartPreview();

function fillInput() {
    if (parsedArr !== null && parsedArr.length > 0) {
        for (let i = 0; i < parsedArr.length; i++) {
            let input = document.getElementById(parsedArr[i].id);
            if (input !== null) {
                input.value = parsedArr[i].quantity;
            }
        }
        if (selectedProducts.length == 0) {
            selectedProducts = parsedArr;
        }
    }
}
function plus(id) {
    let current = document.getElementById(id).value;
    if (Number(current) < 100) {
        document.getElementById(id).value = Number(current) + 1;
        newQuantity = Number(current) + 1;
        buildProduct(id, newQuantity);
    }
}
function min(id) {
    let current = document.getElementById(id).value;
    if (Number(current) > 0) {
        document.getElementById(id).value = Number(current) - 1;
        newQuantity = Number(current) - 1;
        buildProduct(id, newQuantity);
    }
}
function keepProductListUpdate(product) {
    if (selectedProducts.length > 0) {
        const indexOfTheProduct = selectedProducts.findIndex((obj) => {
            if (obj.id === product.id) {
                obj.quantity = product.quantity;
                return true;
            }
            return false;
        });
        return indexOfTheProduct;
    }
}
function buildProduct(id, x) {
    product = {
        "id": id,
        "name": document.getElementById('name_' + id).innerText,
        "price": document.getElementById('price_' + id).innerText,
        "quantity": x,
    };
    let index = keepProductListUpdate(product);
    if (index == -1 || index == undefined) {
        selectedProducts.push(product);
    }
    else {
        selectedProducts[index].quantity = product.quantity;
    }
    const jsonArrOfProducts = JSON.stringify(selectedProducts);
    localStorage.setItem("array", jsonArrOfProducts);
    updateCartPreview();
}
function updateCartPreview() {
    let nrOfProducts = 0;
    let totalPrice = 0;
    if (selectedProducts !== null && selectedProducts.length > 0) {
        for (let x = 0; x < selectedProducts.length; x++) {
            let temp = selectedProducts[x].price.replace(/\u20ac/g, "").trim();
            let price = Number(temp.replace(/,/g, '.'));
            nrOfProducts = nrOfProducts + selectedProducts[x].quantity;
            totalPrice = totalPrice + (selectedProducts[x].quantity * price);
        }
    }
    document.getElementById('cartQuantity').textContent = nrOfProducts.toString();
    document.getElementById('cartTotalPrice').innerText = Number(totalPrice).toFixed(2);
}

