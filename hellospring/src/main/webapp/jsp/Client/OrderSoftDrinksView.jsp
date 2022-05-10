<%@ page import="be.thomasmore.graduaten.hellospring.entities.Product" %>
<%@ page import="java.util.List" %>
<%
    List<Product> products = (List<Product>) request.getAttribute("products");
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
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
            <a class="flex-sm-fill text-sm-center nav-link active" aria-current="page" href="orderSoftDrinks">Frisdranken</a>
            <a class="flex-sm-fill text-sm-center nav-link" href="orderBeers">Bieren</a>
        </nav>
    </div>
</div>
<div class="container-fluid">
    <img id="fris" src="/images/fris.jpg" alt="frisdranken" class="img-fluid mx-auto d-block"
         style="opacity: 0.59; max-height: 300px; box-sizing: border-box;"/>
</div>
<div class="container">
    <div class="row p-3 mt-4">
        <div class="d-none d-md-block col-md-1">
        </div>
        <div class="col-sm-12 col-md-10">
            <div class="" id="productList">
                <form name="<%=request.getAttribute("category")%>" action="/Client/cart" method="post" id="orderForm">
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
                                                        "<div class=\"col-6\">" + product.getDescription() + "</div>" +
                                                        "<div class=\"col-3\">&euro; " + String.format("%.2f", product.getPrice()) + "</div>" +
                                                        "<div class=\"col-3\">" +
                                                        "<button type=\"button\" class=\"btnMinus\" onclick=\"return min(" + product.getId() + ")\" style=\"color: red; background-color: pink; border: 2px solid red;\"><i class=\"bi bi-dash-lg\"></i></button>" +
                                                        "<input type=\"text\" id=\"" + product.getId() + "\" min=\"0\" max=\"25\" value=\"0\" class=\"quantityInput\" style=\"width: 40px; text-align: center;\"/>" +
                                                        "<button type=\"button\" class=\"btnPlus\" onclick=\"return plus(" + product.getId() + ")\" style=\"color: darkgreen; background-color: palegreen; border: 2px solid darkgreen;\"><i class=\"bi bi-plus-lg\"></i></button>" +
                                                        "</div>" +
                                                        "</div>"
                                        );
                                    }
                                }
                            %>
                            <button type="button" class="btn btn-primary btn-block w-100 my-5" onclick="submitForm()">
                                BESTELLEN
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <div class="d-none d-md-block col-md-1">
        </div>
    </div>
</div>
<script type="text/JavaScript">

    function plus(id) {
        let current = document.getElementById(id).value;
        if (Number(current) < 100) {
            document.getElementById(id).value = Number(current) + 1;
        }
    }

    function min(id) {
        let current = document.getElementById(id).value;
        if (Number(current) > 0) {
            document.getElementById(id).value = Number(current) - 1;
        }
    }

    function submitForm() {
        let form = document.getElementById('orderForm');
        form.submit();
    }
</script>
<jsp:include page="../partials/footer.jsp"/>
</body>
</html>
