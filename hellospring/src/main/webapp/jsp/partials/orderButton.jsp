<%--
  Created by IntelliJ IDEA.
  User: Mitch VV
  Date: 8/05/2022
  Time: 19:45
  To change this template use File | Settings | File Templates.
--%>
<%
    long nrOfOpenOrders = (long) request.getAttribute("nrOfOpenOrders");
    long nrOfOrdersReadyToPickUp = (long) request.getAttribute("nrOfOrdersReadyToPickUp");
    long totalNrOfOrdersReady = (long) request.getAttribute("totalNrOfOrdersReady");
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="row d-flex justify-content-center">
    <div class="col-2 p-3">
        <div class="card w-100 bg-danger">
            <div class="card-body text-center text-light">
                <a href="/Admin/Orders" class="stretched-link text-decoration-none text-light" id="open">
                    <h2 class="fw-bold card-title display-3"><%=request.getAttribute("nrOfOpenOrders")%>
                    </h2>
                </a>
                <p>open bestellingen</p>
            </div>
        </div>
    </div>
    <div class="col-2 p-3">
        <div class="card w-100 bg-warning">
            <div class="card-body text-center text-light">
                <a href="/Admin/Orders" class="stretched-link text-decoration-none text-light" id="ready">
                    <h2 class="fw-bold card-title display-3"><%=request.getAttribute("nrOfOrdersReadyToPickUp")%>
                    </h2>
                </a>
                <p>klaar voor afhaling</p>
            </div>
        </div>
    </div>
    <div class="col-2 p-3">
        <div class="card w-100 bg-success">
            <div class="card-body text-center text-light">
                <a href="/Admin/Orders" class="stretched-link text-decoration-none text-light" id="totalReady">
                    <h2 class="fw-bold card-title display-3"><%=request.getAttribute("totalNrOfOrdersReady")%>
                    </h2>
                </a>
                <p>afgewerkte bestellingen</p>
            </div>
        </div>
    </div>
    <div class="col-2 p-3">
        <div class="card w-100 bg-info">
            <div class="card-body text-center text-light">
                <a href="/Admin/Orders" class="stretched-link text-decoration-none text-light" id="total">
                    <h2 class="fw-bold card-title display-3"><%=nrOfOpenOrders + nrOfOrdersReadyToPickUp + totalNrOfOrdersReady%>
                    </h2>
                </a>
                <p>open bestellingen</p>
            </div>
        </div>
    </div>
</div>
