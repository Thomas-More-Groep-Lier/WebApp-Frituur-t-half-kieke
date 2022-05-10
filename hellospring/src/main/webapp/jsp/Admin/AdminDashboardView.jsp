<%
    // int nrOfOpenOrders = (int) request.getAttribute("nrOfOpenOrders");
//  int nrOfOrdersReadyToPickUp = (int) request.getAttribute("nrOfOrdersReadyToPickUp");
//  int totalNrOfOrdersReady = (int)  request.getAttribute("totalNrOfOrdersReady");
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<jsp:include page="../partials/head.jsp"/>
<body>
<div class="container-fluid">
    <jsp:include page="../partials/adminNav.jsp"/>
    <jsp:include page="../partials/dateAndTime.jsp"/>
    <%--    <jsp:include page="../partials/orderButton.jsp" />--%>

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

                <tr>
                    <th scope="row">1</th>
                    <td>Item 1</td>
                    <td>24</td>
                    <td>365</td>
                </tr>
                <tr>
                    <th scope="row">2</th>
                    <td>Item 2</td>
                    <td>21</td>
                    <td>247</td>
                </tr>
            </table>

        </div>
    </div>
</div>
<jsp:include page="../partials/footer.jsp"/>
</body>
</html>