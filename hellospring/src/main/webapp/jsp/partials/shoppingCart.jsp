<%
    String name = "Frituur t'half kieke";
    String shoppingCart = "/images/winkelwagentje.png";
%>

<div class="col-sm-12 col-md-4">
    <div class="m-5">
        <a href="/Client/cart" target="_self" class="text-decoration-none">
            <img src="<%=shoppingCart%>" alt="shoppingcart from <%=name%>" class="float-start m-3"
                 style="width: 30px;"/>
                 <p class="form-text" id="cartDetails"><span id="cartQuantity">0</span> items in je winkelmandje. <br/>
                    &euro; <span id="cartTotalPrice">0.00</span>
                </p>
        </a>
    </div>
    <div id="text"></div>
</div>