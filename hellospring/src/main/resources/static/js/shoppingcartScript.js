var selectedProducts = [];
var product = {};
var newQuantity = 0;
var str = localStorage.getItem("array");
var parsedArr = JSON.parse(str);

fillInput();
updateCartPreview();


function fillInput() {
    parsedArr = parsedArr.filter(p => p.quantity != 0);
    if (parsedArr.length > 0) {
        for (let i = 0; i < parsedArr.length; i++) {
            let temp = parsedArr[i].price.replace(/\u20ac/g, "").trim();
            let price = Number(temp.replace(/,/g, '.'));
            document.getElementById('orderSummary').innerHTML +=
                '<input type="hidden" name="products[]" value="' + parsedArr[i].id + '" >' +
                '<div class="row mb-3" id="product_' + parsedArr[i].id + '">' +
                '<div class="col-6 text-start" id="name_' + parsedArr[i].id + '">' + parsedArr[i].name + '</div>' +
                '<div class="col-4">' +
                '<button type="button" class="btnMinus" onclick="return min(' + parsedArr[i].id + ')" style="color: red; background-color: pink; border: 2px solid red;"><i class="bi bi-dash-lg"></i></button>' +
                '<input type="text" id="' + parsedArr[i].id + '" name="quantity[]" min="0" max="100" value="' + parsedArr[i].quantity + '" class="quantityInput" style="width: 40px; text-align: center;"/>' +
                '<button type="button" class="btnPlus" onclick="return plus(' + parsedArr[i].id + ')" style="color: darkgreen; background-color: palegreen; border: 2px solid darkgreen;"><i class="bi bi-plus-lg"></i></button>' +
                '</div>' +
                '<div class="d-none" id="price_' + parsedArr[i].id + '">' + parsedArr[i].price + '</div>' +
                '<div class="col-2 text-end" id="totalprice_' + parsedArr[i].id + '"> &euro; ' + (price * Number(parsedArr[i].quantity)).toFixed(2) + '</div>' +
                '</div>'
        }
    }
    selectedProducts = parsedArr;
}

function plus(id) {
    let current = document.getElementById(id).value;
    if (Number(current) < 100) {
        document.getElementById(id).value = Number(current) + 1;
        newQuantity = Number(current) + 1;
        buildProduct(id, newQuantity);
        newPrice(newQuantity, id);

    }
}

function min(id) {
    let current = document.getElementById(id).value;
    if (Number(current) > 1) {
        document.getElementById(id).value = Number(current) - 1;
        newQuantity = Number(current) - 1;
        buildProduct(id, newQuantity);
        newPrice(newQuantity, id);
    } else {
        document.getElementById('product_' + id).style.cssText = "display: none;"
        selectedProducts = selectedProducts.filter(p => p.id !== id)
        const jsonArrOfProducts = JSON.stringify(selectedProducts);
        localStorage.setItem("array", jsonArrOfProducts);
        updateCartPreview();

    }
}

function newPrice(newQuantity, id) {
    let priceText = document.getElementById('price_' + id).innerText;
    let temp = priceText.replace(/\u20ac/g, "").trim();
    let price = Number(temp.replace(/,/g, '.'));
    console.log(priceText, temp, price);
    document.getElementById('totalprice_' + id).innerHTML = '&euro; ' + (newQuantity * price).toFixed(2)
}

function buildProduct(id, x) {
    product = {
        "id": id,
        "name": document.getElementById('name_' + id).innerText,
        "price": document.getElementById('price_' + id).innerText,
        "quantity": x,
    }
    keepProductListUpdate(product);
    updateCartPreview();
}

function keepProductListUpdate(product) {

    if (selectedProducts.length > 0) {
        const indexOfTheProduct = selectedProducts.findIndex((obj) => {
            // if the current object name key matches the string
            // return boolean value true
            if (obj.id === product.id) {
                obj.quantity = product.quantity
                return true;

            }
            selectedProducts.push(product);
            return false;
        });
    } else {
        selectedProducts.push(product);
    }
    const jsonArrOfProducts = JSON.stringify(selectedProducts);
    localStorage.setItem("array", jsonArrOfProducts);
}

function submitForm() {
    let validation = false;
    let firstname = document.getElementById('firstName').value;
    let lastname = document.getElementById('lastName').value;
    let email = document.getElementById('email').value;
    let voorwaarden = document.getElementById('voorwaarden').checked;

    if (firstname == null || lastname == null || email == null || !voorwaarden) {
        validation = false
        alert('Herbekijk je gegevens... Gelieve te verbeteren waar nodig...');
    } else {
        if (firstname.length > 2 && lastname.length > 5 && email.length > 10 && voorwaarden) {
            validation = true;
            document.getElementById('final').submit();
        }
    }
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