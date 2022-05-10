<nav class="navbar navbar-expand-lg navbar-light">
    <a class="navbar-brand" href="/orderFries">
        <img src="/images/u101.png" alt="logo" class="float-start m-1" style="width: 85px;"/>
    </a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="/orderFries">Frieten</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/orderSnacks">Snacks</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/orderSauces">Sauzen</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/orderSoftDrinks">Frisdranken</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/orderBeers">Bieren</a>
            </li>
        </ul>
        <div class="mr-sm-2">
            <jsp:include page="shoppingCart.jsp"/>
        </div>
    </div>
</nav>