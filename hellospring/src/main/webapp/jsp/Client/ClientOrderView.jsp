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
            <a class="flex-sm-fill text-sm-center nav-link" href="orderSoftDrinks">Frisdranken</a>
            <a class="flex-sm-fill text-sm-center nav-link" href="orderBeers">Bieren</a>
        </nav>
    </div>
</div>
<div class="container">
    <div class="row d-flex justify-content-center">
        <div class="col-sm-12 col-md-10 col-lg-8 border border-danger border-4 text-center p-5">
            <div class="row">
                <div class="col-sm-12 col-lg-8">
                    <h1 class="fw-bold">Bedankt voor je bestelling, <%=request.getAttribute("name")%>
                    </h1>
                    <p class="fw-bold mt-5">
                        Gekozen afhaaltijd: <%=request.getAttribute("timeBlock")%><br/>
                        Totaal te betalen: &euro; <%=String.format("%.2f", request.getAttribute("totalPrice"))%>
                    </p>
                    <p class="mt-3">
                        Vermijd koude frietjes, kom op tijd
                    </p>
                </div>
                <div class="col-sm-12 col-lg-4">
                    <img src="/images/thanks.jpg" alt="bedankt" class="img-fluid"
                         style="opacity: 0.59;  box-sizing: border-box;"/>

                </div>
            </div>

        </div>
    </div>
</div>
<jsp:include page="../partials/footer.jsp"/>
</body>
</html>
