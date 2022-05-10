<%
    String name = "Frituur t'half kieke";
    String shoppingCart = "/images/winkelwagentje.png";
    double totalPrice = 0.00;
    Number quantity = 0;
%>

<div class="col-sm-12 col-md-4">
    <div class="m-5">
        <a href="/Client/cart" target="_self" class="text-decoration-none">
            <img src="<%=shoppingCart%>" alt="shoppingcart from <%=name%>" class="float-start m-3"
                 style="width: 30px;"/>
            <p class="form-text"><%=quantity%> items in your shoppingcart. <br/>
                &euro; <%=String.format("%.2f", totalPrice) %>
            </p>
        </a>
    </div>
</div>