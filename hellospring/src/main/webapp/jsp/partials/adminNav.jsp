<%
    String logo = "/images/u101.png";
    String name = "Frituur t'half kieke";
%>
<div class="d-flex flex-column flex-shrink-0 bg-light"
     style="width: 4.5rem; top: 50%; margin-top: -15%; position: fixed;">
    <a href="/Admin/Dashboard" class="d-block p-3 link-dark text-decoration-none" data-bs-toggle="tooltip"
       data-bs-placement="right">
        <img src="<%=logo%>" alt="logo <%=name%>" class="img-fluid"/>
    </a>
    <ul class="nav nav-pills nav-flush flex-column mb-auto text-center">
        <li class="nav-item">
            <a href="/Admin/Dashboard" class="nav-link py-3 border-bottom" title="Dashboard" data-bs-toggle="tooltip"
               data-bs-placement="right" id="dashboard">
                <i class="bi bi-house-fill" style="font-size: x-large"></i>
            </a>
        </li>
        <li>
            <a href="/Admin/Orders" class="nav-link py-3 border-bottom" title="Orders" data-bs-toggle="tooltip"
               data-bs-placement="right" id="orders">
                <i class="bi bi-cart-fill" style="font-size: x-large"></i>
            </a>
        </li>
        <li>
            <a href="/Admin/Products" class="nav-link py-3 border-bottom" data-bs-toggle="tooltip"
               data-bs-placement="right" title="Products" id="products">
                <i class="bi bi-cup-straw" style="font-size: x-large"></i>
            </a>
        </li>
        <li>
            <a href="/Admin/TimeSlots" class="nav-link py-3 border-bottom" data-bs-toggle="tooltip"
               data-bs-placement="right" title="Timeslots" id="timeslots">
                <i class="bi bi-alarm-fill" style="font-size: x-large"></i>
            </a>
        </li>
        <li>
            <a href="/Admin/Settings" class="nav-link py-3 border-bottom" data-bs-toggle="tooltip"
               data-bs-placement="right" title="Settings" id="settings">
                <i class="bi bi-sliders" style="font-size: x-large"></i>
            </a>
        </li>
    </ul>
</div>
<script>
    const url = window.location.href;
    let nav = document.getElementById(url.substring(url.lastIndexOf("/") + 1).toLowerCase().replace('#', ''));
    if (nav !== null && nav !== undefined) {
        nav.classList.add('active');
    }
</script>