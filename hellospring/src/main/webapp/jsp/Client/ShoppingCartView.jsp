<%@ page import="be.thomasmore.graduaten.hellospring.entities.TimeSlot" %>
<%@ page import="java.util.List" %>
<%@ page import="be.thomasmore.graduaten.hellospring.entities.ProductCondiment" %>
<%
    List<TimeSlot> slots = (List<TimeSlot>) request.getAttribute("timeSlots");
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
            <a class="flex-sm-fill text-sm-center nav-link" href="orderSauces">Sauzen</a>
            <a class="flex-sm-fill text-sm-center nav-link" href="orderSoftDrinks">Frisdranken</a>
            <a class="flex-sm-fill text-sm-center nav-link" href="orderBeers">Bieren</a>
        </nav>
    </div>
</div>

<div class="container">
    <form action="/Client/clientOrder" method="post" id="final">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <input type="hidden" name="timeSlot" id="inTimeSlot" value="">
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

                <div class="row border border-1 rounded mb-4">
                    <div class="row mb-3">
                        <div class="col bg-danger text-light p-2">
                            <h6>Wanneer wenst u de bestelling op te halen?</h6>
                        </div>
                    </div>
                    <div class="row mb-3 d-flex justify-content-center text-center" id="timeSlots">
                        <%
                            for (TimeSlot slot : slots) {
                                if (slot.getSpotAvailable()) {
                                    out.print(
                                            "<div class=\"timeslot border border-dark border-1 p-2 w-25 m-1\" id=\"" + slot.getId() + "\" onclick=\"selectedTimeSlot(" + slot.getId() + ")\">" +
                                                    "<span>" + slot.getFrom().substring(0, 5) + " - " + slot.getUntil().substring(0, 5) + "</span>" +
                                                    "</div>"
                                    );
                                } else {
                                    out.print(
                                            "<div class=\"timeslot border border-dark border-1 p-2 w-25 m-1 bg-light\" disabled>" +
                                                    "<span class=\"text-muted\">" + slot.getFrom().substring(0, 5) + " - " + slot.getUntil().substring(0, 5) + "</span>" +
                                                    "</div>"
                                    );
                                }
                            }
                        %>
                    </div>
                </div>


                <div class="row border border-1 rounded mb-4">
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
    const condimenten = [<%
    if (condiments != null){
        for(ProductCondiment productCondiment: condiments) { out.print(
            "{ \"productId\" : \"" + productCondiment.getProduct().getId() + "\", \"condimentId\" : \"" + productCondiment.getCondiment().getId() + "\", \"condiment\" : \"" + productCondiment.getCondiment().getDescription()  +"\", \"condimentPrice\" : \""+ productCondiment.getCondiment().getPrice() +"\", \"productPrice\": \""+ productCondiment.getProduct().getPrice() + "\" },"
            );
        }
    }
    %>];

</script>
<script src="/js/shoppingcartScript.js" type="text/JavaScript"></script>
</body>
</html>