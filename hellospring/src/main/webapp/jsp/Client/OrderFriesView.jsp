<%@ page import="be.thomasmore.graduaten.hellospring.entities.Product" %>
<%@ page import="java.util.List" %>
<%
    List<Product> products = (List<Product>) request.getAttribute("products");
%>

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
            <a class="flex-sm-fill text-sm-center nav-link active" aria-current="page" href="orderFries">Frieten</a>
            <a class="flex-sm-fill text-sm-center nav-link" href="orderSnacks">Snacks</a>
            <a class="flex-sm-fill text-sm-center nav-link" href="orderSauces">Sauzen</a>
            <a class="flex-sm-fill text-sm-center nav-link" href="orderSoftDrinks">Frisdranken</a>
            <a class="flex-sm-fill text-sm-center nav-link" href="orderBeers">Bieren</a>
        </nav>
    </div>
</div>
<div class="d-block d-md-none col-md-1">
    <img class="img-fluid frieten" src="/images/frieten.jpg" alt="frieten"/>
</div>
<div class="container">
    <div class="row p-3 mt-4">
        <div class="d-none d-md-block col-md-1">
        </div>
        <div class="col-sm-12 col-md-10">
            <div class="" id="productList">
                    <div class="row d-flex justify-content-center">
                        <div class="col-sm-12 col-md-8 col-lg-6">
                            <h1 class="text-danger display-5 fw-bolder"><%=request.getAttribute("category")%>
                            </h1>
                        </div>
                    </div>
                    <div class="row d-flex justify-content-center">
                        <div class="col-sm-12 col-md-8 col-lg-6">
                            <%
                            if (products != null) {
                                for (Product product : products) {
                                    out.print(
                                            "<div class=\"row mt-3\">" +
                                                    "<div class=\"col-6\" id=\"name_" +  product.getId() + "\">" + product.getDescription() + "</div>" +
                                                    "<div class=\"col-3\" id=\"price_" +  product.getId() + "\">&euro; " + String.format("%.2f", product.getPrice()) + "</div>" +
                                                    "<div class=\"col-3\">" +
                                                    "<button type=\"button\" class=\"btnMinus\" onclick=\"return min(" + product.getId() + ")\" style=\"color: red; background-color: pink; border: 2px solid red;\"><i class=\"bi bi-dash-lg\"></i></button>" +
                                                    "<input type=\"text\" id=\"" + product.getId() + "\" min=\"0\" max=\"25\" value=\"0\" class=\"quantityInput\" style=\"width: 40px; text-align: center;\"/>" +
                                                    "<button type=\"button\" class=\"btnPlus\" onclick=\"return plus(" + product.getId() + ")\" style=\"color: darkgreen; background-color: palegreen; border: 2px solid darkgreen;\"><i class=\"bi bi-plus-lg\"></i></button>" +
                                                    "</div>" +
                                                    "</div>"
                                    );
                                }}
                            %>
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                            <input type="submit" class="btn btn-primary btn-block w-100 mt-3 p-2" value="Bestellen"/>
                        </div>
                    </div>
            </div>
        </div>
        <div class="d-none d-md-block col-md-1">
            <img class="frieten" src="/images/frieten.jpg" alt="frieten" class=""
                 style="z-index: -999; opacity: 0.39; width: 400px; margin-left: -300px;  box-sizing: border-box;"/>
        </div>
    </div>
</div>
<script type="text/JavaScript">
    var selectedProducts = [];
    var product = { };
    var newQuantity = 0;
    var str = localStorage.getItem("array");
    var parsedArr = JSON.parse(str);

    fillInput();

    function fillInput(){
        if (parsedArr !== null && parsedArr.length > 0){
            for(let i = 0; i < parsedArr.length; i++ ){
                let input = document.getElementById(parsedArr[i].id);
                if (input !== null){
                    input.value = parsedArr[i].quantity;
                }
            }
            if (selectedProducts.length == 0){
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
    function keepProductListUpdate(product){
        console.log(product)
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
    function buildProduct(id, x){
        product = {
            "id": id,
            "name": document.getElementById('name_' + id).innerText,
            "price": document.getElementById('price_' + id).innerText,
            "quantity": x,
        };
        let index = keepProductListUpdate(product);
        console.log(index);
        if (index == -1 || index == undefined){
            selectedProducts.push(product);
        }
        else {
            selectedProducts[index].quantity = product.quantity;
        }
        const jsonArrOfProducts = JSON.stringify(selectedProducts);
        console.log(jsonArrOfProducts);
        localStorage.setItem("array", jsonArrOfProducts);
        console.log(selectedProducts);
        updateCartPreview();
    }
    function updateCartPreview(){
        let nrOfProducts = 0;
        let totalPrice = 0;
        if (selectedProducts !== null && selectedProducts.length > 0){
            for (let x = 0; x < selectedProducts.length ; x++) {
                let temp = selectedProducts[x].price.replace("€", "").trim();
                let price = Number(temp.replace(/,/g, '.'));
                nrOfProducts = nrOfProducts + selectedProducts[x].quantity;
                totalPrice = totalPrice + (selectedProducts[x].quantity * price);
            }
        }
        document.getElementById('cartQuantity').innerHTML = nrOfProducts.toString();
        document.getElementById('cartTotalPrice').innerHTML  = Number(totalPrice).toFixed(2);
    }
</script>
<jsp:include page="../partials/footer.jsp"/>
</body>
</html>
