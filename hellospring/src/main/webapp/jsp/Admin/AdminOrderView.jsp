<%
    // int nrOfOpenOrders = (int) request.getAttribute("nrOfOpenOrders");
//  int nrOfOrdersReadyToPickUp = (int) request.getAttribute("nrOfOrdersReadyToPickUp");
//  int totalNrOfOrdersReady = (int)  request.getAttribute("totalNrOfOrdersReady");
%>

<jsp:include page="../partials/head.jsp"/>
<body>
<div class="container-fluid">
    <jsp:include page="../partials/adminNav.jsp"/>
    <jsp:include page="../partials/dateAndTime.jsp"/>
    <%--<jsp:include page="../partials/orderButton.jsp" />--%>

</div>
<jsp:include page="../partials/footer.jsp"/>
</body>
</html>