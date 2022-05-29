<%--
  Created by IntelliJ IDEA.
  User: Mitch VV
  Date: 26/05/2022
  Time: 8:14
  To change this template use File | Settings | File Templates.
--%>
<%
    long nrOfOpenOrders = (long) request.getAttribute("nrOfOpenOrders");
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Deze pagina word enkel gebruikt om het aantal open orders te checken op regelamatige basis ...</title>
</head>
<body>
<div id="openOrders">
    <%out.print(nrOfOpenOrders);%>
</div>
</body>
</html>
