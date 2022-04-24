<%--
  Created by IntelliJ IDEA.
  User: Mitch VV
  Date: 1/03/2022
  Time: 9:22
  To change this template use File | Settings | File Templates.
--%>
<%
    int aantal = 3;
    String naam = "Joerie";
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Voorbeeld scriptlet</title>
</head>
<body>
<h1>Voorbeeld scriptlet</h1>
<%
    for(int i = 0; i < aantal; i++){
        out.print("<p>" + naam + "</p>");
    }
%>
</body>
</html>
