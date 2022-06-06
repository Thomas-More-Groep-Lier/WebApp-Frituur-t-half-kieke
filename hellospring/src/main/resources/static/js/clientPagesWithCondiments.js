var selectedProducts = [];
var product = {};
var newQuantity = 0;
var str = localStorage.getItem("array");
var parsedArr = JSON.parse(str);


function fillInput() {
    if (parsedArr !== null && parsedArr.length > 0) {
        if (parsedArr.length < selectedProducts.length) {
//            console.log("localeStorage blocking detected! Copy data from selected products array... ")
            parsedArr = selectedProducts;
        }
        parsedArr = parsedArr.filter(p => p.quantity !== 0);
        for (let i = 0; i < parsedArr.length; i++) {
            let totalQuantity = 0;
            //   let info = document.getElementById("info_" + parsedArr[i].id);
            let input = document.getElementById(parsedArr[i].id);
            if (input !== null) {
                for (let x = 0; x < parsedArr.length; x++) {
                    if (parsedArr[x].id == parsedArr[i].id) {
                        totalQuantity += Number(parsedArr[x].quantity);
                        // info.innerHTML += `${parsedArr[x].condiment} (${parsedArr[x].quantity})<br>`
                    }
                }
                input.value = totalQuantity;
                //   info.classList.remove('d-none');
            }
        }
        if (selectedProducts.length == 0) {
            selectedProducts = parsedArr;
        }
    }
}

function prepareModal(id, description, price) {
    document.getElementById('productId').value = id;
    document.getElementById('productTitle').innerHTML = description;
    document.getElementById('productPrice').innerHTML = Number(price).toFixed(2);
    document.getElementById('condimenten').innerHTML = "";
    for (let x = 0; x < condimenten.length; x++) {
        if (condimenten[x].productId === id) {
            document.getElementById('condimenten').innerHTML += "<div class=\"form-check form-check-inline\">" +
                "<input class=\"form-check-input condimentChoice\" type=\"radio\" name=\"inlineRadioOptions\" id=\"" + condimenten[x].id + "\" value=\"" + condimenten[x].condimentId + "\" onchange=\"updateNr(this," + id + ")\" checked>" +
                "<label class=\"form-check-label\" for=\"" + condimenten[x].id + "\">" + condimenten[x].condiment + "</label>" +
                "</div>"
        }
    }
    let condiment = 0;
    let c = document.getElementsByClassName('condimentChoice');
    for (i = 0; i < c.length; i++) {
        if (c[i].checked) {
            condiment = c[i].value;
        }
    }
    updateNr(condiment, id)
}

function updateNr(e, id) {
    if (e.value != undefined) {
        e = e.value;
    }
    const select = document.getElementById('nrOfProducts');
    if (parsedArr != null) {
        if (parsedArr.filter(x => x.id == id && (x.condiment == e)).length > 0) {
            for (let x = 0; x < parsedArr.length; x++) {
                if (parsedArr[x].id == id && parsedArr[x].condiment == e) {
                    select.value = parsedArr[x].quantity;
                }
            }
        } else {
            select.value = 0;
        }

    }
}

function saveProduct(id, newQuantity, productPrice) {
  //  console.log(id, newQuantity, productPrice);
    let quantity = null;
    let price = null;
    let totalprice = null;
    let condiment = null;
    let condimentName = null;
    let productId = null;
    let productName = null;

    if (id != null && newQuantity != null && productPrice != null) {
        productName = document.getElementById('name_' + id).innerText
        productId = id.toString();
        quantity = newQuantity.toString();
        price = productPrice;
        totalprice = Number(quantity) * Number(price);
    } else {
        productName = document.getElementById('productTitle').innerText;
        productId = document.getElementById('productId').value;
        quantity = document.getElementById('nrOfProducts').value;
        price = document.getElementById('productPrice').innerText;
        totalprice = Number(quantity) * Number(price);
        let c = document.getElementsByClassName('condimentChoice');
        for (i = 0; i < c.length; i++) {
            if (c[i].checked) {
                condiment = c[i].value;
            }
        }
        let x = condimenten.filter(x => x.condimentId == condiment);
        condimentName = x[0].condiment;
    }
    product = {
        "guid": `${productId}_${condiment}`,
        "id": productId,
        "name": productName,
        "price": Number(totalprice).toFixed(2),
        "quantity": quantity,
        "condiment": condiment,
        "condimentName" : condimentName,
    };

    let index = keepProductListUpdate(product);
    if (index === -1 || index === undefined) {
        selectedProducts.push(product);
   //     console.log("product added!");
    } else {
        selectedProducts[index].price = product.price;
        selectedProducts[index].quantity = product.quantity;
    //    console.log("product updated!");
    }
    saveInLocaleStorage(selectedProducts);
}

function keepProductListUpdate(product) {
    if (selectedProducts.length > 0) {
        const indexOfTheProduct = selectedProducts.findIndex((obj) => {
            if (obj.id === product.id && product.condiment === obj.condiment) {
                obj.quantity = product.quantity;
                return true;
            }
            return false;
        });
        return indexOfTheProduct;
    }
}

function updateCartPreview() {
    let nrOfProducts = 0;
    let totalPrice = 0;
    if (selectedProducts !== null && selectedProducts.length > 0) {
        for (let x = 0; x < selectedProducts.length; x++) {
            nrOfProducts = nrOfProducts + Number(selectedProducts[x].quantity);
            totalPrice = totalPrice + (Number(selectedProducts[x].price));
        }
    }
    document.getElementById('cartQuantity').innerText = nrOfProducts.toString();
    document.getElementById('cartTotalPrice').innerText = Number(totalPrice).toFixed(2).toString();

}

function plus(id, price) {
    let current = document.getElementById(id).value;
    if (Number(current) < 100) {
        document.getElementById(id).value = Number(current) + 1;
        newQuantity = Number(current) + 1;
        saveProduct(id, newQuantity, price);
    }
}

function min(id, price) {
    let current = document.getElementById(id).value;
    if (Number(current) > 0) {
        document.getElementById(id).value = Number(current) - 1;
        newQuantity = Number(current) - 1;
        saveProduct(id, newQuantity, price);
    }
}

function saveInLocaleStorage(value) {
    // Timeout en reload nodig om het dom manipulatie niet te blokkeren ...
    // Zonder gebruik, bestaat de kans dat de locale storage niet up-to-date is ten opzichte van de verwachting.
    setTimeout(() => {
        localStorage.setItem("array", JSON.stringify(value));
        location.reload();
    }, 150);
}

fillInput();
updateCartPreview();