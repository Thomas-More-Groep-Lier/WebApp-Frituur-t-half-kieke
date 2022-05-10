<%--
  Created by IntelliJ IDEA.
  User: maart
  Date: 23/03/2022
  Time: 20:29
  To change this template use File | Settings | File Templates.
--%>
<%
    String title = "Welkom bij frituur t'half kieke!";
    String logo = "/images/u101.png";
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <title><%=title%>
    </title>
</head>
<body>
<div class="container">
    <div class="row d-flex justify-content-center">
        <div class="col-sm-12 col-md-11 col-lg-10">
            <div class="border border-danger border-4 p-5 text-center">
                <div class="row">
                    <div class="col">
                        <div class="mx-auto">
                            <img src="<%=logo%>" alt="logo" style="width: 150px;"/>
                        </div>
                    </div>
                </div>
                <div class="row mt-4">
                    <div class="col">
                        <p>Hier kan je naar hartelust je favoriete frietjes, snacks, sauzen en dranken bestellen... </p>
                    </div>
                </div>
                <div class="row mt-4">
                    <div class="col">
                        <h3>Bestellen doe je zo...</h3>
                    </div>
                </div>
                <div class="row mt-4">
                    <div class="col">
                        <p>
                            Stap 1. Voeg de gewenste items toe aan je winkelmandje<br/>
                            Stap 2. Kies je gewenste afhaal moment<br/>
                            Stap 3. Voeg enkele persoonlijke gegevens in zodat we je kunnen bereiken indien nodig<br/>
                            Stap 4. Kom enkele minuten voor het geselecteerde afhaalmoment naar het frituur</p>
                    </div>
                </div>
                <div class="row mt-4">
                    <div class="col">
                        <p>Er is geen betaling nodig om een bestelling te plaatsen.</p>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12 mt-2">
                    <div class="d-grid">
                        <a href="Client/orderFries" class="btn btn-primary btn-block w-100">START NU MET BESTELLEN</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Option 1: Bootstrap Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>

</body>
</html>