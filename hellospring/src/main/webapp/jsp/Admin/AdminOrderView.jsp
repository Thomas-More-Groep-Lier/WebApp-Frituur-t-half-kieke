<%@ page import="be.thomasmore.graduaten.hellospring.entities.Order" %>
<%@ page import="java.util.List" %>
<%@ page import="be.thomasmore.graduaten.hellospring.entities.OrderDetail" %>
<%@ page import="java.text.DecimalFormat" %>
<%
    List<OrderDetail> orderDetailList = (List<OrderDetail>) request.getAttribute("orderDetailList");
    List<Order> orderList = (List<Order>) request.getAttribute("orderList");
    DecimalFormat df = new DecimalFormat("0.00");
%>

<jsp:include page="../partials/head.jsp"/>
<body>
<div class="container-fluid">
    <jsp:include page="../partials/adminNav.jsp"/>
    <jsp:include page="../partials/dateAndTime.jsp"/>
    <jsp:include page="../partials/orderButton.jsp"/>
</div>
<div class="container">
    <div class="row mt-4">
        <%
            for (Order o : orderList) {
                float totalPrice = 0;
                out.print(
                        "<div class=\"col-sm-12 col-md-4 col-lg-3\">" +
                            "<div class=\"card\" id=\"" + o.getId() + "\">" +
                                "<div class=\"card-body\">" +
                                    "<div class=\"row\">" +
                                        "<div class=\"col-9\"><h6 class=\"card-title text-start\">" + o.getClient().getFirstName() + "</h6><span class=\"fw-light\">" + o.getClient().getPhoneNumber() + "</span></div>" +
                                        "<div class=\"col-3\"><h6 class=\"card-title text-end\">" + o.getWantedRetrievalTime().substring(0, 5) + "</h6></div>" +
                                    "</div>" +
                                    "<div class=\"row my-2\">");
                for (OrderDetail od : orderDetailList) {
                    if (od.getOrder().getId() == o.getId()) {
                        totalPrice += (od.getProduct().getPrice() * od.getNumberOfProducts());
                        out.print(
                                        "<div class=\"row\">" +
                                            "<div class=\"col-10 text-start\"><p class=\"card-text\">" + od.getProduct().getDescription() + "</p></div>" +
                                            "<div class=\"col-2 text-end\"><p class=\"card-text\">" + od.getNumberOfProducts() + "</p></div>" +
                                        "</div>"
                        );
                        if (od.getCondiment() != null){
                            out.print(
                                "<div class=\"row\">" +
                                    "<div class=\"col-12 text-start\"><p class=\"card-text text-danger ms-2\">" + od.getCondiment().getDescription() + "</p></div>" +
                                "</div>"
                            );
                        }
                    }
                }
                if (!o.getStatus().equalsIgnoreCase("picked")) {
                    out.print(
                                    "</div>" +
                                    "<div class=\"row my-3\">" +
                                       "<div class=\"col text-center fw-bold\">Te ontvangen: &euro; " + df.format(totalPrice) + "</div>" +
                                    "</div>" +
                                    "<div class=\"d-grid mt-2\">" +
                                       "<button class=\"btn btn-primary\" onclick=changeStatus(" + o.getId() + "," + "\"" + o.getStatus() + "\")>"
                    );
                    if (o.getStatus().equalsIgnoreCase("open")) {
                        out.print("Klaar voor ophalen");
                    }
                    if (o.getStatus().equalsIgnoreCase("ready")) {
                        out.print("Opgehaald");
                    }
                    out.print(
                                       "</button>" +
                                   "</div>" +
                              "</div>" +
                         "</div>" +
                      "</div>"
                    );
                }
                else {
                    out.print(
                                "</div>" +
                            "</div>" +
                       "</div>" +
                                        "</div>"
                    );
                }
            }
        %>
    </div>
</div>
<audio id="myAudio">
    <source src="/sound/magic-mallet.mp3" type="audio/mp3">
</audio>
<form id="changeStatusForm" class="d-none" method="post" action="/Admin/Orders">
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    <input type="hidden" value="" name="orderId" id="orderId">
    <input type="hidden" value="" name="orderStatus" id="orderStatus">
    <input type="hidden" value="" name="category" id="category">
</form>
<jsp:include page="../partials/footer.jsp"/>
<script>
    function changeStatus(id, status) {
        document.getElementById('orderId').value = id;
        document.getElementById('category').value = status;
        switch (status) {
            case "open":
                document.getElementById('orderStatus').value = "ready";
                break;
            case "ready":
                document.getElementById('orderStatus').value = "picked";
                break;
            default:
                break;
        }
        document.getElementById('changeStatusForm').submit();
    }
</script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
    let currentNumber = document.getElementById('nrOpen').innerText;
    let interval = 5000; // 1000 = 1 second, 5000 = 5 seconds
    function doAjax() {
        $.ajax({
            url: "/Admin/Check",
            success: function(result) {
                let html = jQuery('<div>').html(result);
                let x = (html.find("div#openOrders").text());
                if (currentNumber < x.trim(x)) {
                        let sound = document.getElementById("myAudio");
                        Play(sound);
                    }
            }
        });
    }
    setInterval(doAjax, interval);

    function delay(n) {
        return new Promise(function(resolve) {
            setTimeout(resolve, n * 1000);
        });
    }

    function Reload() {
        window.location.reload();
    }

    async function Play(sound) {
        sound.play();
        await delay(3);
        Reload(); // "Success"
    }
</script>
</body>
</html>