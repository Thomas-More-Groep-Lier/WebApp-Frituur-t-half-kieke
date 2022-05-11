<%
    // int nrOfOpenOrders = (int) request.getAttribute("nrOfOpenOrders");
//  int nrOfOrdersReadyToPickUp = (int) request.getAttribute("nrOfOrdersReadyToPickUp");
//  int totalNrOfOrdersReady = (int)  request.getAttribute("totalNrOfOrdersReady");
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml" xmlns:th="https://www.thymeleaf.org">
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