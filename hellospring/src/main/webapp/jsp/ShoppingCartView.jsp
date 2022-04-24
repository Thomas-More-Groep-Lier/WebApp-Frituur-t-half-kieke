<%--
  Created by IntelliJ IDEA.
  User: maart
  Date: 23/03/2022
  Time: 20:34
  To change this template use File | Settings | File Templates.
--%>
<%
  String pageTitle = "Uw winkelwagentje";
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<jsp:include page="partails/head.jsp" />

  <body>
  <div class="d-sm-block d-md-none container-fluid">
    <jsp:include page="partails/MobileNav.jsp" />
  </div>
  <div class="d-none d-md-block container-fluid">
    <div class="row p-3">
      <jsp:include page="partails/logo.jsp" />
      <jsp:include page="partails/shoppingCart.jsp" />
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
      <h1>Hello, world!</h1>

    </div>
  <jsp:include page="partails/footer.jsp" />
  </body>
</html>
