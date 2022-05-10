<%
    String logo = "/images/u101.png";
    String name = "Frituur t'half kieke";
    String subtitle = "Alle dagen open soms gesloten ... ";
%>
<div class="col-sm-12 col-md-8">
    <a href="/" target="_self" class="text-decoration-none">
        <img src="<%=logo%>" alt="logo <%=name%>" class="float-start m-3" style="width: 100px;"/>
        <h1 class="display-4 text-danger fw-bold mt-4"><%=name%>
        </h1>
        <p class="text-danger" style="margin-top: -10px;"><%=subtitle%>
        </p>
    </a>
</div>