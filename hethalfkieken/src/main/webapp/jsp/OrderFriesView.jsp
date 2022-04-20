<%@ page import="java.text.DecimalFormat" %><%--
  Created by IntelliJ IDEA.
  User: maart
  Date: 23/03/2022
  Time: 20:34
  To change this template use File | Settings | File Templates.
--%>
<%
  String pageTitle = "Frieten bestellen";
  String logo = "/resources/images/u101.png";
  String name = "Frituur t'half kieke";
  String subtitle = "Alle dagen open soms gesloten ... ";
  String winkelwagentje = "/resources/images/winkelwagentje.png";
  Double totalPrice = 0.00;
  Number quantity = 0;
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

  <title><%=pageTitle%></title>
</head>
<body>
<div class="container-fluid">
  <div class="row p-3">
    <div class="col-sm-12 col-md-8">
      <img src="<%=logo%>" alt="logo <%=name%>" class="float-start" />
      <h1 class="display-4 text-danger"><%=name%></h1>
      <p class="text-danger"><%=subtitle%></p>
    </div>
    <div class="col-sm-12 col-md-4">
      <img src="<%=winkelwagentje%>" alt="winkelwagen van <%=name%>" class="float-start" />
      <p class="form-text"><%=quantity%> items in je winkelwagen <br/>
        &euro; <%=totalPrice%>
      </p>
    </div>
  </div>
  <div class="row my-3">
    <nav class="nav nav-pills flex-column flex-sm-row">
      <a class="flex-sm-fill text-sm-center nav-link active" aria-current="page" href="OrderFriesView.jsp">Frieten</a>
      <a class="flex-sm-fill text-sm-center nav-link" href="OrderSnacksView.jsp">Snacks</a>
      <a class="flex-sm-fill text-sm-center nav-link" href="OrderSaucesView.jsp">Sauzen</a>
      <a class="flex-sm-fill text-sm-center nav-link" href="OrderSoftDrinksView.jsp">Frisdranken</a>
      <a class="flex-sm-fill text-sm-center nav-link" href="OrderBeersView.jsp">Bieren</a>
    </nav>

  </div>
</div>

<div class="container">
  <h1>Hello, world!</h1>

</div>
<!-- Option 1: Bootstrap Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

</body>
</html>
