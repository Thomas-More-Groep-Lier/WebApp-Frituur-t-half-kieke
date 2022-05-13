
<jsp:include page="../partials/head.jsp"/>

<body>
<div class="d-sm-block d-md-none container-fluid">
    <jsp:include page="../partials/MobileNav.jsp"/>
</div>
<div class="d-none d-md-block container-fluid">
    <div class="row p-3">
        <jsp:include page="../partials/logo.jsp"/>
        <jsp:include page="../partials/shoppingCart.jsp"/>
    </div>
    <div class="row my-3">
        <nav class="nav nav-pills flex-column flex-sm-row">
            <a class="flex-sm-fill text-sm-center nav-link" href="orderFries">Frieten</a>
            <a class="flex-sm-fill text-sm-center nav-link" href="orderSnacks">Snacks</a>
            <a class="flex-sm-fill text-sm-center nav-link" href="orderSauces">Sauzen</a>
            <a class="flex-sm-fill text-sm-center nav-link" href="orderSoftDrinks">Frisdranken</a>
            <a class="flex-sm-fill text-sm-center nav-link" href="orderBeers">Bieren</a>
        </nav>
    </div>
</div>

<div class="container">
    <form action="" method="post" id="final">
        <div class="row gx-5">
            <div class="col-sm-12 col-md-6 col-lg-7 " id="orderView">
                <div class="row border border-1 rounded">
                    <div class="row mb-3 bg-danger text-light p-2">
                        <div class="col">
                            <h6>Overzicht van uw bestelling</h6>
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col">
                            <div class="row mb-3" id="orderSummary">
                                <% /* hier komt overzicht van de bestelling doormiddel van javascript */ %>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-12 col-md-6 col-lg-5" id="customerDetails">
                <div class="row border border-1 rounded">
                    <div class="row mb-3">
                        <div class="col bg-danger text-light p-2">
                            <h6>Uw gegegevens</h6>
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col">
                            <label for="firstName">Voornaam: </label>
                            <input type="text" id="firstName" name="firstName" class="form-control"/>
                        </div>
                        <div class="col">
                            <label for="lastName">Achternaam: </label>
                            <input type="text" id="lastName" name="lastName" class="form-control"/>
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col">
                            <label for="email">Email: </label>
                            <input type="email" id="email" name="email" class="form-control"/>
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col">
                            <label for="tel">Telefoon/GSM nummer: </label>
                            <input type="text" id="tel" name="tel" class="form-control"/>
                        </div>
                    </div>
                    <div class="row mb-3 ">
                        <div class="col d-flex justify-content-end">
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="" id="voorwaarden">
                                <label class="form-check-label" for="voorwaarden">
                                    Ik ga akkoord met de algemene voorwaarden.
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col d-flex justify-content-end">
                            <button type="button" onclick="submitForm()" class="btn btn-danger"><i
                                    class="bi bi-bag-check-fill"></i>
                                Bestelling verzenden
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>
<jsp:include page="../partials/footer.jsp"/>

<script>
    var selectedProducts = [];
    var product = {};
    var newQuantity = 0;
    var str = localStorage.getItem("array");
    var parsedArr = JSON.parse(str);

    fillInput();

    function fillInput() {
        if (parsedArr.length > 0) {
            for (let i = 0; i < parsedArr.length; i++) {
                let temp = parsedArr[i].price.replace("€", "").trim();
                let price = Number(temp.replace(/,/g, '.'));
                document.getElementById('orderSummary').innerHTML +=
                    '<div class="row mb-3" id="product_' + parsedArr[i].id + '">' +
                    '<div class="col-6 text-start" id="name_' + parsedArr[i].id + '">' + parsedArr[i].name + '</div>' +
                    '<div class="col-4">' +
                    '<button type="button" class="btnMinus" onclick="return min(' + parsedArr[i].id + ')" style="color: red; background-color: pink; border: 2px solid red;"><i class="bi bi-dash-lg"></i></button>' +
                    '<input type="text" id="' + parsedArr[i].id + '" min="0" max="100" value="' + parsedArr[i].quantity + '" class="quantityInput" style="width: 40px; text-align: center;"/>' +
                    '<button type="button" class="btnPlus" onclick="return plus(' + parsedArr[i].id + ')" style="color: darkgreen; background-color: palegreen; border: 2px solid darkgreen;"><i class="bi bi-plus-lg"></i></button>' +
                    '</div>' +
                    '<div class="d-none" id="price_' + parsedArr[i].id + '">' + parsedArr[i].price + '</div>' +
                    '<div class="col-2 text-end" id="totalprice_' + parsedArr[i].id + '"> &euro;' + (price * Number(parsedArr[i].quantity)).toFixed(2) + '</div>' +
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
            console.log(selectedProducts)
            const jsonArrOfProducts = JSON.stringify(selectedProducts);
            localStorage.setItem("array", jsonArrOfProducts);
        }
    }

    function newPrice(newQuantity, id) {
        let priceText = document.getElementById('price_' + id).innerText;
        let temp = priceText.replace("€", "").trim();
        let price = Number(temp.replace(/,/g, '.'));
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
</script>
</body>
</html>