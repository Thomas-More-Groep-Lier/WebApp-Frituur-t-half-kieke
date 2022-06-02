<%@ page import="be.thomasmore.graduaten.hellospring.entities.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="be.thomasmore.graduaten.hellospring.entities.ProductCondiment" %>
<%
    List<Product> products = (List<Product>) request.getAttribute("products");
    List<Product> productsCategory2 = (List<Product>) request.getAttribute("productsCategory2");
    List<ProductCondiment> condiments = (List<ProductCondiment>) request.getAttribute("condiments");

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
            <a class="flex-sm-fill text-sm-center nav-link" href="orderFries">Frieten</a>
            <a class="flex-sm-fill text-sm-center nav-link" href="orderSnacks">Snacks</a>
            <a class="flex-sm-fill text-sm-center nav-link active" aria-current="page" href="orderSauces">Sauzen</a>
            <a class="flex-sm-fill text-sm-center nav-link" href="orderSoftDrinks">Frisdranken</a>
            <a class="flex-sm-fill text-sm-center nav-link" href="orderBeers">Bieren</a>
        </nav>
    </div>
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
                                                    "<div class=\"col-6\" id=\"name_" + product.getId() + "\">" + product.getDescription() + "</div>" +
                                                    "<div class=\"col-3\" id=\"price_" + product.getId() + "\">&euro; " + String.format("%.2f", product.getPrice()) + "</div>" +
                                                    "<div class=\"col-3\">");

                                    if (condiments.stream().anyMatch(x -> x.getProduct() == product)) {
                                        out.print(
                                                "<button onclick=\"prepareModal('" + product.getId() + "','" + product.getDescription() + "','" + product.getPrice() + "')\"  type=\"button\" class=\"btnMinus\" role=\"button\" data-bs-toggle=\"modal\" data-bs-target=\"#exampleModal\" aria-pressed=\"true\" style=\"color: red; background-color: pink; border: 2px solid red;\"><i class=\"bi bi-dash-lg\"></i></button>" +
                                                        "<input type=\"text\" id=\"" + product.getId() + "\" min=\"0\" max=\"25\" value=\"0\" class=\"quantityInput\" style=\"width: 40px; text-align: center;\" disabled/>" +
                                                        "<button onclick=\"prepareModal('" + product.getId() + "','" + product.getDescription() + "','" + product.getPrice() + "')\" type=\"button\" class=\"btnPlus\" role=\"button\" data-bs-toggle=\"modal\" data-bs-target=\"#exampleModal\" aria-pressed=\"true\" style=\"color: darkgreen; background-color: palegreen; border: 2px solid darkgreen;\"><i class=\"bi bi-plus-lg\"></i></button>"
                                                //   "<div class=\"d-none\" id=\"info_"+ product.getId() +"\"></div>"
                                        );
                                    } else {
                                        out.print(
                                                "<button type=\"button\" class=\"btnMinus\" onclick=\"return min(" + product.getId() + "," + product.getPrice() + ")\" style=\"color: red; background-color: pink; border: 2px solid red;\"><i class=\"bi bi-dash-lg\"></i></button>" +
                                                        "<input type=\"text\" id=\"" + product.getId() + "\" min=\"0\" max=\"25\" value=\"0\" class=\"quantityInput\" style=\"width: 40px; text-align: center;\" disabled/>" +
                                                        "<button type=\"button\" class=\"btnPlus\" onclick=\"return plus(" + product.getId() + "," + product.getPrice() + ")\" style=\"color: darkgreen; background-color: palegreen; border: 2px solid darkgreen;\"><i class=\"bi bi-plus-lg\"></i></button>"
                                        );
                                    }
                                    out.print(
                                            "</div>" +
                                                    "</div>"
                                    );
                                }
                            }
                        %>
                        </div>
                    </div>
                    <div class="d-flex justify-content-end" style="margin-top: -100px;">
                        <img id="sauzen" src="/images/sauzen.png" alt="sauzen" class=""
                             style="z-index: -1; opacity: 0.59; width: 400px; box-sizing: border-box;"/>
                    </div>
                    <div class="row d-flex justify-content-center">
                        <div class="col-sm-12 col-md-8 col-lg-6">
                            <h1 class="text-danger display-5 fw-bolder"><%=request.getAttribute("category2")%>
                            </h1>
                        </div>
                    </div>
                    <div class="row d-flex justify-content-center">
                        <div class="col-sm-12 col-md-8 col-lg-6">
                            <%
                            if (products != null) {
                                for (Product product : productsCategory2) {
                                    out.print(
                                            "<div class=\"row mt-3\">" +
                                                    "<div class=\"col-6\" id=\"name_" + product.getId() + "\">" + product.getDescription() + "</div>" +
                                                    "<div class=\"col-3\" id=\"price_" + product.getId() + "\">&euro; " + String.format("%.2f", product.getPrice()) + "</div>" +
                                                    "<div class=\"col-3\">");

                                    if (condiments.stream().anyMatch(x -> x.getProduct() == product)) {
                                        out.print(
                                                "<button onclick=\"prepareModal('" + product.getId() + "','" + product.getDescription() + "','" + product.getPrice() + "')\"  type=\"button\" class=\"btnMinus\" role=\"button\" data-bs-toggle=\"modal\" data-bs-target=\"#exampleModal\" aria-pressed=\"true\" style=\"color: red; background-color: pink; border: 2px solid red;\"><i class=\"bi bi-dash-lg\"></i></button>" +
                                                        "<input type=\"text\" id=\"" + product.getId() + "\" min=\"0\" max=\"25\" value=\"0\" class=\"quantityInput\" style=\"width: 40px; text-align: center;\" disabled/>" +
                                                        "<button onclick=\"prepareModal('" + product.getId() + "','" + product.getDescription() + "','" + product.getPrice() + "')\" type=\"button\" class=\"btnPlus\" role=\"button\" data-bs-toggle=\"modal\" data-bs-target=\"#exampleModal\" aria-pressed=\"true\" style=\"color: darkgreen; background-color: palegreen; border: 2px solid darkgreen;\"><i class=\"bi bi-plus-lg\"></i></button>"
                                                //   "<div class=\"d-none\" id=\"info_"+ product.getId() +"\"></div>"
                                        );
                                    } else {
                                        out.print(
                                                "<button type=\"button\" class=\"btnMinus\" onclick=\"return min(" + product.getId() + "," + product.getPrice() + ")\" style=\"color: red; background-color: pink; border: 2px solid red;\"><i class=\"bi bi-dash-lg\"></i></button>" +
                                                        "<input type=\"text\" id=\"" + product.getId() + "\" min=\"0\" max=\"25\" value=\"0\" class=\"quantityInput\" style=\"width: 40px; text-align: center;\" disabled/>" +
                                                        "<button type=\"button\" class=\"btnPlus\" onclick=\"return plus(" + product.getId() + "," + product.getPrice() + ")\" style=\"color: darkgreen; background-color: palegreen; border: 2px solid darkgreen;\"><i class=\"bi bi-plus-lg\"></i></button>"
                                        );
                                    }
                                    out.print(
                                            "</div>" +
                                                    "</div>"
                                    );
                                }
                            }
                            %>
                            <a href="/Client/orderSoftDrinks" class="btn btn-primary btn-block w-100 mt-3 p-2">Volgende</a>

                        </div>
                    </div>
            </div>
        </div>
        <div class="d-none d-md-block col-md-1">
        </div>
    </div>
</div>

<%
    if (condiments != null) {
%>
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <div class="row w-100">
                    <div class="col"><h5 class="modal-title" id="productTitle">Product toevoegen</h5></div>
                    <div class="col text-end"><span class="text-end">&euro; </span><span class="text-end"
                                                                                         id="productPrice"></span>
                    </div>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col px-5 py-2">
                        <input type="hidden" value="" id="productId"/>
                        <div class="row mb-3" id="condimenten">
                        </div>
                        <div class="row mb-3" id="quantity">
                            <label for="nrOfProducts" class="col-sm-4 col-form-label">Hoeveelheid: </label>
                            <div class="col-sm-8">
                                <select class="form-control" id="nrOfProducts">
                                    <%
                                        for (int x = 0; x <= 20; x++) {
                                            out.print(
                                                    "<option value=\"" + x + "\">" + x + "</option>"
                                            );
                                        }

                                    %>
                                </select>
                            </div>
                        </div>
                        <button type="button" class="btn btn-primary mt-4 float-end" onclick="saveProduct()"
                                data-bs-dismiss="modal">
                            Save changes
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%
    }
%>

<script>
    const condimenten = [<%
    if (condiments != null){
        for(ProductCondiment productCondiment: condiments) { out.print(
            "{ \"productId\" : \"" + productCondiment.getProduct().getId() + "\", \"condimentId\" : \"" + productCondiment.getCondiment().getId() + "\", \"condiment\" : \"" + productCondiment.getCondiment().getDescription()  +"\", \"condimentPrice\" : \""+ productCondiment.getCondiment().getPrice() +"\", \"productPrice\": \""+ productCondiment.getProduct().getPrice() + "\" },"
            );
        }
    }
    %>];
</script>
<jsp:include page="../partials/footer.jsp"/>
<script src="/js/clientPagesWithCondiments.js" type="text/JavaScript"></script>

</body>
</html>
