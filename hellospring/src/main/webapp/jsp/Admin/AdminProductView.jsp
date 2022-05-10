<%@ page import="be.thomasmore.graduaten.hellospring.entities.Product" %>
<%@ page import="java.util.List" %>
<%
    List<Product> products = (List<Product>) request.getAttribute("allProducts");
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<jsp:include page="../partials/head.jsp"/>
<body>
<div class="container-fluid">
    <jsp:include page="../partials/adminNav.jsp"/>
    <jsp:include page="../partials/dateAndTime.jsp"/>
</div>
<div class="container">
    <div class="row">
        <div class="col">
            <h2 class="display-2 text-center"><%=request.getAttribute("pageTitle")%>
            </h2>
            <div class="row mt-5">
                <div class="col">
                    <select class="form-select" onchange="changeDisplay(this)" id="category">
                        <option selected>Categorie selecteren ...</option>
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
                    <form action="/Admin/Products" method="post" id="new_edit_form">
                        <input type="hidden" name="productId" id="productId" value=""/>
                        <div class="row mb-3">
                            <div class="col-5">
                                <label for="productName" class="form-label">Product naam</label>
                                <input type="text" id="productName" class="form-control"
                                       aria-describedby="productNameHelpBlock">
                                <div id="productNameHelpBlock" class="form-text d-none">
                                    Een goede productnaam bevat alleen letters en cijfers, geen speciale karakters...
                                </div>
                            </div>
                            <div class="col-2">
                                <label for="productCategory" class="form-label">Product categorie</label>
                                <select class="form-select" id="productCategory">
                                    <option selected>Categorie selecteren ...</option>
                                    <option value="1">Frieten</option>
                                    <option value="2">Snack</option>
                                    <option value="3">Vegetarische Snack</option>
                                    <option value="4">Koude Saus</option>
                                    <option value="5">Warme Saus</option>
                                    <option value="6">Frisdrank</option>
                                    <option value="7">Bier</option>
                                </select>
                            </div>
                            <div class="col-1 d-flex align-items-end justify-content-end">
                                <span class="text-end fs-3">&euro; </span>
                            </div>
                            <div class="col-2">
                                <label for="productPrice" class="form-label">Product prijs</label>
                                <input type="number" id="productPrice" class="form-control" step="0.01" min="0"
                                       max="1000">
                            </div>
                            <div class="col-2 d-flex align-items-end justify-content-end">
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
                            for (Product product : products) {
                                out.print(
                                        "<tr class=" + product.getCategory().replace(" ", "") + ">" +
                                                "<td id=\"productName_" + product.getId() + "\">" + product.getDescription() + "</td>" +
                                                "<td id=\"productPrice_" + product.getId() + "\"> &euro;" + String.format("%.2f", product.getPrice()) + "</td>" +
                                                "<td class=\"text-center\">" +
                                                "<a title=\"edit\" onclick=\"addNew(" + product.getId() + ")\" class=\"text-dark\"><i class=\"bi bi-pencil-fill \"></i></a>" +
                                                "<a title=\"pause\" href=\"/Admin/Product/Pause?id=" + product.getId() + "\" class=\"text-warning\"><i class=\"bi bi-pause-fill ms-4\"></i></a>" +
                                                "<a title=\"restart\" href=\"/Admin/Product/Restart?id=" + product.getId() + "\" class=\"text-success\"><i class=\"bi bi-arrow-clockwise mx-4\"></i></a>" +
                                                "<a title=\"delete\" href=\"/Admin/Product/Delete?id=" + product.getId() + "\" class=\"text-danger\"><i class=\"bi bi-trash3 \"></i></a>" +
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
<script>
    function changeDisplay(x) {
        let select = document.getElementById('category');
        let value = select.options[select.selectedIndex].value;
        let Frieten = Array.from(document.getElementsByClassName("Frieten"));
        for (const row of Frieten) {
            row.style.cssText = "display: none;";
        }
        let Snack = Array.from(document.getElementsByClassName("Snack"));
        for (const row of Snack) {
            row.style.cssText = "display: none;";
        }
        let VegetarischeSnacks = Array.from(document.getElementsByClassName("VegetarischeSnack"));
        for (const row of VegetarischeSnacks) {
            row.style.cssText = "display: none;";
        }
        let KoudeSauzen = Array.from(document.getElementsByClassName("KoudeSaus"));
        for (const row of KoudeSauzen) {
            row.style.cssText = "display: none;";
        }
        let WarmeSauzen = Array.from(document.getElementsByClassName("WarmeSaus"));
        for (const row of WarmeSauzen) {
            row.style.cssText = "display: none;";
        }
        let Frisdrank = Array.from(document.getElementsByClassName("Frisdrank"));
        for (const row of Frisdrank) {
            row.style.cssText = "display: none;";
        }
        let Bier = Array.from(document.getElementsByClassName("Bier"));
        for (const row of Bier) {
            row.style.cssText = "display: none;";
        }

        switch (value) {
            //         <option value="1">Frieten</option>
            case "1":
                for (const row of Frieten) {
                    row.style.cssText = "";
                }
                break;
            //         <option value="2">Snack</option>
            case "2":
                for (const row of Snack) {
                    row.style.cssText = "";
                }
                break;
            //         <option value="3">Vegetarische Snack</option>
            case "3":
                for (const row of VegetarischeSnacks) {
                    row.style.cssText = "";
                }
                break;
            //         <option value="4">Koude Saus</option>
            case "4":
                for (const row of KoudeSauzen) {
                    row.style.cssText = "";
                }
                break;
            //         <option value="5">Warme Saus</option>
            case "5":
                for (const row of WarmeSauzen) {
                    row.style.cssText = "";
                }
                break;
            //         <option value="6">Frisdrank</option>
            case "6":
                for (const row of Frisdrank) {
                    row.style.cssText = "";
                }
                break;
            //         <option value="7">Bier</option>
            case "7":
                for (const row of Bier) {
                    row.style.cssText = "";
                }
                break;
            default:
                for (const row of Frieten) {
                    row.style.cssText = "";
                }
                for (const row of Snack) {
                    row.style.cssText = "";
                }
                for (const row of VegetarischeSnacks) {
                    row.style.cssText = "";
                }
                for (const row of KoudeSauzen) {
                    row.style.cssText = "";
                }
                for (const row of WarmeSauzen) {
                    row.style.cssText = "";
                }
                for (const row of Frisdrank) {
                    row.style.cssText = "";
                }
                for (const row of Bier) {
                    row.style.cssText = "";
                }
                break;

        }

    }

    function addNew(id) {
        if (id !== undefined && id !== null) {
            let price = document.getElementById(`productPrice_` + id).innerText.replace("€", "");
            let select = document.getElementById('category');
            document.getElementById('productId').value = id;
            document.getElementById('btnAdd').classList.add('d-none');
            document.getElementById('btnEdit').classList.remove('d-none');
            document.getElementById('btnClear').classList.remove('d-none');
            document.getElementById('productPrice').value = Number(price.replace(/,/g, '.'));
            document.getElementById('productName').value = document.getElementById(`productName_` + id).innerText;
            document.getElementById('productCategory').value = select.options[select.selectedIndex].value;
        } else {
            document.getElementById('productId').value = id;
            document.getElementById('btnAdd').classList.remove('d-none');
            document.getElementById('btnClear').classList.add('d-none');
            document.getElementById('btnEdit').classList.add('d-none');
            document.getElementById('productPrice').value = "";
            document.getElementById('productName').value = "";
            document.getElementById('productCategory').value = "";
        }

    }

    function clearId() {
        addNew();
    }
</script>
</body>
</html>