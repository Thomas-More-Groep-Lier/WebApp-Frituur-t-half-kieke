<%@ page import="be.thomasmore.graduaten.hellospring.entities.TimeSlot" %>
<%
    TimeSlot slot = (TimeSlot) request.getAttribute("timeBlock");
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
                        Gekozen afhaaltijd: <%out.print(slot.getUntil().substring(0,5));%><br/>
                        Totaal te betalen: &euro; <span id="price"></span>
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
<script>
    var str = localStorage.getItem("array");
    var parsedArr = JSON.parse(str);
    var totalprice = 0;
    fillInput();

    function fillInput() {
        parsedArr = parsedArr.filter(p => p.quantity !== 0);
        if (parsedArr.length > 0) {
            for (let i = 0; i < parsedArr.length; i++) {
                totalprice = totalprice + Number(parsedArr[i].price);
            }
        }
        document.getElementById('price').innerText = Number(totalprice).toFixed(2);
        document.getElementById('cartQuantity').innerText = 0;
        document.getElementById('cartTotalPrice').innerText = Number(0).toFixed(2);
        localStorage.clear();
    }
</script>
</body>
</html>
