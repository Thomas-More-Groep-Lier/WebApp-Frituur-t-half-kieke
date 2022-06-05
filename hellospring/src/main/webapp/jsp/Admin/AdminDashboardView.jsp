
<%@ page import="be.thomasmore.graduaten.hellospring.entities.Product" %>
<%@ page import="java.util.Map" %>

<%@ page import="java.util.ArrayList" %>
<%
    ArrayList<Map.Entry<Product, Long>> g = (ArrayList) request.getAttribute("list");
%>


<jsp:include page="../partials/head.jsp"/>

<body>
<div class="container-fluid">
    <jsp:include page="../partials/adminNav.jsp"/>
    <jsp:include page="../partials/dateAndTime.jsp"/>
    <jsp:include page="../partials/orderButton.jsp"/>

    <div class="row d-flex justify-content-center mt-4">
        <div class="col-8 p-3 border border-1">
            <h2 class="fw-bold display-2 text-center">BEST VERKOCHT</h2>
            <select class="form-select my-4" name="productCategory" id="productCategory" onchange="filterBestVerkocht()">
                <option selected value="">Categorie selecteren ...</option>
                <option value="Frieten">Frieten</option>
                <option value="Snack">Snack</option>
                <option value="Vegetarische Snack">Vegetarische Snack</option>
                <option value="Koude Saus">Koude Saus</option>
                <option value="Warme Saus">Warme Saus</option>
                <option value="Frisdrank">Frisdrank</option>
                <option value="Bier">Bier</option>
            </select>
            <table class="table w-100 mt-4">
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Item</th>
                    <th scope="col">Aantal</th>
                    <th scope="col">Omzet</th>
                </tr>
                <%
                    if (g != null) {

                        int nr = 1;
                        for (Map.Entry<Product,Long> x : g) {
                            Product p = x.getKey();
                            Long s = x.getValue();
                            out.print(
                                    "<tr class=\"tablerow "+ p.getCategory() +"\"><td scope=\"row\">"+ nr +"</td>" +
                                            "<td>" + p.getDescription() + "</td>" +
                                            "<td>" + s + "</td>" +
                                            "<td>&euro; " + String.format("%.2f", p.getPrice() * s) + "</td></tr>"
                            );
                            nr++;
                        }
                    }
                %>
            </table>
        </div>
    </div>
</div>
<script>
    function filterBestVerkocht(){
        const selected = document.getElementById("productCategory").value;
        const all = document.getElementsByClassName("tablerow");
        for (let i = 0; i < all.length; i++){
            if (!all[i].classList.contains("d-none")){
                all[i].classList.add("d-none");
            }
        }
        const selectedRows = document.getElementsByClassName(selected);
        for (let i = 0; i < selectedRows.length; i++){
            if (selectedRows[i].classList.contains("d-none")){
                selectedRows[i].classList.remove("d-none");
            }
        }
        if (selected == ""){
            for (let i = 0; i < all.length; i++){
                if (all[i].classList.contains("d-none")){
                    all[i].classList.remove("d-none");
                }
            }
        }
    }
</script>
<jsp:include page="../partials/footer.jsp"/>
</body>
</html>