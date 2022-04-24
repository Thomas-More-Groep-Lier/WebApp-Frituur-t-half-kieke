<%--
  Created by IntelliJ IDEA.
  User: Mitch VV
  Date: 1/03/2022
  Time: 9:36
  To change this template use File | Settings | File Templates.
--%>
<%
    String kleur = "Oranje";
    String hexCode = "#f04c03";
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Voorbeeld Expressions</title>
</head>
<body>
<p>
    Dit is het <span style="color: <%=hexCode%>"><%=kleur%></span> van Thomas More!
</p>
</body>
</html>
