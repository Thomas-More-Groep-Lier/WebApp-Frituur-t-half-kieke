
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="be.thomasmore.graduaten.hellospring.entities.Product" %>
<%@ page import="java.util.Map" %>

<%@ page import="java.util.ArrayList" %>
<%
    ArrayList<Map.Entry<Product, Long>> g = (ArrayList) request.getAttribute("list");
    DecimalFormat df = new DecimalFormat("0.00");
%>


<jsp:include page="../partials/head.jsp"/>

<body>
<div class="container-fluid">
    <jsp:include page="../partials/adminNav.jsp"/>
    <jsp:include page="../partials/dateAndTime.jsp"/>
    <jsp:include page="../partials/orderButton.jsp"/>

    <div class="row d-flex justify-content-center mt-4">
        <div class="col-8 p-3 border border-1">
            <h2 class="fw-bold display-2 text-center">BEST VERKOCHT</h2>
            <table class="table w-100 mt-4">
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Item</th>
                    <th scope="col">Aantal</th>
                    <th scope="col">Omzet</th>
                </tr>
                <%
                    if (g != null) {

                        int nr = 1;
                        for (Map.Entry<Product,Long> x : g) {
                            Product p = x.getKey();
                            Long s = x.getValue();
                            out.print(
                                    "<tr><td scope=\"row\">"+ nr +"</td>" +
                                            "<td>" + p.getDescription() + "</td>" +
                                            "<td>" + s + "</td>" +
                                            "<td>&euro; " + String.format("%.2f", p.getPrice() * s) + "</td></tr>"
                            );
                            nr++;
                        }
                    }
                %>
            </table>
        </div>
    </div>
</div>
<jsp:include page="../partials/footer.jsp"/>
</body>
</html>