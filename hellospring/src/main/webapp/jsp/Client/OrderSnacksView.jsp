<%--
  Created by IntelliJ IDEA.
  User: maart
  Date: 23/03/2022
  Time: 20:34
  To change this template use File | Settings | File Templates.
--%>
<%
  String[] names = (String[]) request.getAttribute("names");
  Double[] prices = (Double[]) request.getAttribute("prices");
  String[] names2 = (String[]) request.getAttribute("names2");
  Double[] prices2 = (Double[]) request.getAttribute("prices2");
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<jsp:include page="../partials/head.jsp" />

<body>
<div class="d-sm-block d-md-none container-fluid">
  <jsp:include page="../partials/MobileNav.jsp" />
</div>
<div class="d-none d-md-block container-fluid">
  <div class="row p-3">
    <jsp:include page="../partials/logo.jsp" />
    <jsp:include page="../partials/shoppingCart.jsp" />
  </div>
  <div class="row my-3">
    <nav class="nav nav-pills flex-column flex-sm-row">
      <a class="flex-sm-fill text-sm-center nav-link" href="orderFries">Frieten</a>
      <a class="flex-sm-fill text-sm-center nav-link active" aria-current="page"href="orderSnacks">Snacks</a>
      <a class="flex-sm-fill text-sm-center nav-link" href="orderSauces">Sauzen</a>
      <a class="flex-sm-fill text-sm-center nav-link" href="orderSoftDrinks">Frisdranken</a>
      <a class="flex-sm-fill text-sm-center nav-link" href="orderBeers">Bieren</a>
    </nav>
  </div>
</div>

<div class="container">
  <div class="row p-3 mt-4">
    <div class="d-sm-none d-md-block col-md-1">
    </div>
    <div class="col-sm-12 col-md-10">
      <div class="" id="productList">
        <form name="<%=request.getAttribute("category")%>" method="post">
          <div class="row d-flex justify-content-center">
            <div class="col-sm-12 col-md-8 col-lg-6">
              <h1 class="text-danger display-5 fw-bolder"><%=request.getAttribute("category")%></h1>
            </div>
          </div>
          <div class="row d-flex justify-content-center">
            <div class="col-sm-12 col-md-8 col-lg-6">
              <% for(int i = 0; i < names.length ; i++) { %>
              <div class="row mt-3">
                <div class="col-6"><%=names[i]%></div>
                <div class="col-3">&euro; <%=String.format("%.2f", prices[i])%></div>
                <div class="col-3">
                  <input type="number" id="<%=names[i].replace(" ", "")%>" min="0" max="25" value="0" />
                </div>
              </div>
              <% } %>
            </div>
          </div>
          <div class="d-flex justify-content-end" style="margin-top: -100px;">
            <img id="snacks" src="/images/snacks.jpg" alt="snacks" class="d-none d-md-block" style="z-index: -1; opacity: 0.59; width: 300px; box-sizing: border-box;" />
          </div>
          <div class="row d-flex justify-content-center">
            <div class="col-sm-12 col-md-8 col-lg-6">
              <h1 class="text-danger display-5 fw-bolder"><%=request.getAttribute("category2")%></h1>
            </div>
          </div>
          <div class="row d-flex justify-content-center">
            <div class="col-sm-12 col-md-8 col-lg-6">
              <% for(int i = 0; i < names2.length ; i++) { %>
              <div class="row mt-3">
                <div class="col-6"><%=names2[i]%></div>
                <div class="col-3">&euro; <%=String.format("%.2f", prices2[i])%></div>
                <div class="col-3">
                  <input type="number" id="<%=names[i].replace(" ", "")%>" min="0" max="25" value="0" />
                </div>
              </div>
              <% } %>
              <input type="submit" class="btn btn-primary btn-block w-100 my-5" />
            </div>
          </div>
        </form>
        <div class="d-flex justify-content-start" style="margin-top: -100px;">
          <img id="snacks-veggie" src="/images/snacks-veggie.jpg" alt="snacks-veggie" class="" style="z-index: -1; opacity: 0.59; width: 250px; box-sizing: border-box;" />
        </div>
      </div>
    </div>
    <div class="d-sm-none d-md-block col-md-1">
    </div>
  </div>
</div>
<jsp:include page="../partials/footer.jsp" />
</body>
</html>
