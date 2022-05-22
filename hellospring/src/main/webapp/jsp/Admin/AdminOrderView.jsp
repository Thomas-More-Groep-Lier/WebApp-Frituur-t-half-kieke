<%@ page import="be.thomasmore.graduaten.hellospring.entities.Order" %>
<%@ page import="java.util.List" %>
<%@ page import="be.thomasmore.graduaten.hellospring.entities.OrderDetail" %>
<%
  // List<OrderDetail> orderList = (List<OrderDetail>) request.getAttribute("orderList");
%>

<jsp:include page="../partials/head.jsp"/>
<body>
<div class="container-fluid">
    <jsp:include page="../partials/adminNav.jsp"/>
    <jsp:include page="../partials/dateAndTime.jsp"/>
    <jsp:include page="../partials/orderButton.jsp" />
</div>
<div class="container">
    <div class="row mt-4">
        <div class="col">
        </div>
    </div>
</div>
<jsp:include page="../partials/footer.jsp"/>
</body>
</html>