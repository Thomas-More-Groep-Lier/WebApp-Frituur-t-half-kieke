<%@ page import="be.thomasmore.graduaten.hellospring.entities.Product" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: maart
  Date: 23/03/2022
  Time: 20:30
  To change this template use File | Settings | File Templates.
--%>
<%
  List<Product> products = (List<Product>) request.getAttribute("allProducts");

%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<jsp:include page="../partials/head.jsp" />
<body>
<div class="container-fluid">
  <jsp:include page="../partials/adminNav.jsp" />
  <jsp:include page="../partials/dateAndTime.jsp" />
</div>
<div class="container">
  <div class="row">
    <div class="col">
      <h2 class="display-2 text-center"><%=request.getAttribute("pageTitle")%></h2>
      <div class="row mt-5">
        <div class="col">
          <select class="form-select" onchange="changeDisplay(this)" id="category">
            <option selected>Categorie selecteren ... </option>
            <option value="1">Frieten</option>
            <option value="2">Snack</option>
            <option value="3">Vegetarische Snack</option>
            <option value="4">Koude Saus</option>
            <option value="5">Warme Saus</option>
            <option value="6">Frisdrank</option>
            <option value="7">Bier</option>
          </select>
        </div>
      </div>
      <div class="row mt-5">
        <div class="col">
          <table class="table">
            <tr>
              <th scope="col">
                Name
              </th>
              <th scope="col">
                Price
              </th>
              <th scope="col">
                Actions
              </th>
            </tr>
            <%
                for (Product product : products) {
                  out.print(
                          "<tr class=" + product.getCategory().replace(" ", "") + ">" +
                               "<td>"   + product.getDescription() + "</td>" +
                               "<td>"   + product.getPrice() + "</td>" +
                               "<td class=\"text-center\">" +
                                  "<a href=\"/Admin/Product/Pause?id=" +product.getId() +"\" class=\"text-warning\"><i class=\"bi bi-pause-fill\"></i></a>" +
                                  "<a href=\"/Admin/Product/Restart?id=" +product.getId() +"\" class=\"text-success\"><i class=\"bi bi-arrow-clockwise mx-4\"></i></a>" +
                                  "<a href=\"/Admin/Product/Delete?id=" +product.getId() +"\" class=\"text-danger\"><i class=\"bi bi-trash3 mr-3\"></i></a>" +
                          "</td>" +
                          "</tr>"
                  );
                }
            %>
          </table>
        </div>
      </div>
      <div class="row mt-3">
        <div class="col">
          <a href="/Admin/Nieuw" class="btn btn-primary float-end">Nieuw product Toevoegen</a>
        </div>
      </div>
    </div>
  </div>
</div>
<jsp:include page="../partials/footer.jsp" />
</body>
<script>
  function changeDisplay(x) {
    let select = document.getElementById('category');
    let value = select.options[select.selectedIndex].value;

    console.log(value)


    let Frieten = Array.from(document.getElementsByClassName("Frieten"));
    for (const row of Frieten){
      row.style.cssText = "display: none;";
    }
    let Snack = Array.from(document.getElementsByClassName("Snack"));
    for (const row of Snack){
      row.style.cssText = "display: none;";
    }
    let VegetarischeSnacks = Array.from(document.getElementsByClassName("VegetarischeSnack"));
    for (const row of VegetarischeSnacks){
      row.style.cssText = "display: none;";
    }
    let KoudeSauzen = Array.from(document.getElementsByClassName("KoudeSaus"));
    for (const row of KoudeSauzen){
      row.style.cssText = "display: none;";
    }
    let WarmeSauzen = Array.from(document.getElementsByClassName("WarmeSaus"));
    for (const row of WarmeSauzen){
      row.style.cssText = "display: none;";
    }
    let Frisdrank = Array.from(document.getElementsByClassName("Frisdrank"));
    for (const row of Frisdrank){
      row.style.cssText = "display: none;";
    }
    let Bier = Array.from(document.getElementsByClassName("Bier"));
    for (const row of Bier){
      row.style.cssText = "display: none;";
    }




    switch (value)
    {
      //         <option value="1">Frieten</option>
      case "1":
        for (const row of Frieten){
          row.style.cssText = "";
        }
        break;
      //         <option value="2">Snack</option>
      case "2":
        for (const row of Snack){
        row.style.cssText = "";
      }
        break;
      //         <option value="3">Vegetarische Snack</option>
      case "3":
        for (const row of VegetarischeSnacks){
          row.style.cssText = "";
        }
        break;
      //         <option value="4">Koude Saus</option>
      case "4":
        for (const row of KoudeSauzen){
          row.style.cssText = "";
        }
        break;
      //         <option value="5">Warme Saus</option>
      case "5":
        for (const row of WarmeSauzen){
          row.style.cssText = "";
        }
        break;
      //         <option value="6">Frisdrank</option>
      case "6":
        for (const row of Frisdrank){
          row.style.cssText = "";
        }
        break;
      //         <option value="7">Bier</option>
      case "7":
        for (const row of Bier){
          row.style.cssText = "";
        }
        break;
      default:
        for (const row of Frieten){
          row.style.cssText = "";
        }
        for (const row of Snack){
          row.style.cssText = "";
        }
        for (const row of VegetarischeSnacks){
          row.style.cssText = "";
        }
        for (const row of KoudeSauzen){
          row.style.cssText = "";
        }
        for (const row of WarmeSauzen){
          row.style.cssText = "";
        }
        for (const row of Frisdrank){
          row.style.cssText = "";
        }
        for (const row of Bier){
          row.style.cssText = "";
        }
      break;

    }

  }
</script>
</html>