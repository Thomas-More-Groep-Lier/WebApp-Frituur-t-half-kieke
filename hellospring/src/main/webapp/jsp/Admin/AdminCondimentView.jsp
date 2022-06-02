<%@ page import="java.util.List" %>
<%@ page import="be.thomasmore.graduaten.hellospring.entities.Condiment" %>
<%
  List<Condiment> allcondiments = (List<Condiment>) request.getAttribute("allcondiments");
%>

<jsp:include page="../partials/head.jsp"/>
<body>
<div class="container-fluid">
  <jsp:include page="../partials/adminNav.jsp"/>
  <jsp:include page="../partials/dateAndTime.jsp"/>
</div>
<div class="container">
  <div class="row">
    <div class="col">
      <h2 class="display-2 text-center"><%=request.getAttribute("pageTitle")%></h2>
      <a href="/Admin/Products"><i class="bi bi-box-arrow-up-left"> Producten beheer</i></a>
      <div class="row mt-5">
        <div class="col">
          <form action="/Admin/Products/Condiments" method="post" id="new_edit_form">
            <input type="hidden" name="condimentId" id="condimentId" value=""/>
            <div class="row mb-3">
              <div class="col-5">
                <label for="condimentName" class="form-label">Condiment naam</label>
                <input type="text" id="condimentName" name="condimentName" class="form-control"
                       aria-describedby="condimentNameHelpBlock">
                <div id="condimentNameHelpBlock" class="form-text d-none">
                  Een goede condimentnaam bevat alleen letters en cijfers, geen speciale karakters...
                </div>
              </div>
              <div class="col-1 d-flex align-items-end justify-content-end">
                <span class="text-end fs-3">&euro; </span>
              </div>
              <div class="col-2">
                <label for="condimentPrice" class="form-label">Condiment prijs</label>
                <input type="number" id="condimentPrice" name="condimentPrice" class="form-control" value="0" step="0.01" min="0"
                       max="1000">
              </div>
              <div class="col-2 d-flex align-items-end justify-content-end">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                <button type="submit" class="btn btn-success" id="btnAdd"><i class="bi bi-plus"></i>
                  Nieuw toevoegen
                </button>
                <button type="button" class="btn btn-secondary d-none me-2" title="velden leegmaken"
                        id="btnClear" onclick="clearId()"><i class="bi bi-x-lg"></i></button>
                <button type="submit" class="btn btn-primary d-none" id="btnEdit"><i
                        class="bi bi-pencil-fill"></i> Aanpassen
                </button>
              </div>
            </div>
          </form>
          <table class="table mt-5">
            <tr>
              <th scope="col">
                Naam
              </th>
              <th scope="col">
                Prijs
              </th>
              <th scope="col" class="text-center">
                Acties
              </th>
            </tr>
            <%
              for (Condiment condiment : allcondiments) {
                out.print(
                        "<tr class=\"\">" +
                                "<td id=\"condimentName_" + condiment.getId() + "\">" + condiment.getDescription() + "</td>" +
                                "<td id=\"condimentPrice_" + condiment.getId() + "\"> &euro;" + String.format("%.2f", condiment.getPrice()) + "</td>" +
                                "<td class=\"text-center\">" +
                                "<a title=\"edit\" onclick=\"addNew(" + condiment.getId() + ")\" class=\"text-dark\"><i class=\"bi bi-pencil-fill \"></i></a>"
                );
                out.print(
                        "<a title=\"delete\" onclick=\"confirmDelete(" + condiment.getId() +")\" class=\"text-danger\"><i class=\"bi bi-trash3 \"></i></a>" +
                                "</td>" +
                                "</tr>"
                );
              }
            %>
          </table>
        </div>
      </div>
    </div>
  </div>
</div>
<jsp:include page="../partials/footer.jsp"/>
<script src="/js/adminCondiments.js" type="text/JavaScript"></script>
</body>
</html>