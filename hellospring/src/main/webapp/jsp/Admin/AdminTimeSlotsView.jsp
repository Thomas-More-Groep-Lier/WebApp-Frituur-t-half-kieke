<%@ page import="be.thomasmore.graduaten.hellospring.entities.TimeSlot" %>
<%@ page import="java.util.List" %>
<%
    List<TimeSlot> timeSlotenMan = (List<TimeSlot>) request.getAttribute("timeSlotMan");
    List<TimeSlot> timeSlotenDin = (List<TimeSlot>) request.getAttribute("timeSlotDin");
    List<TimeSlot> timeSlotenWoe = (List<TimeSlot>) request.getAttribute("timeSlotWoe");
    List<TimeSlot> timeSlotenDon = (List<TimeSlot>) request.getAttribute("timeSlotDon");
    List<TimeSlot> timeSlotenVri = (List<TimeSlot>) request.getAttribute("timeSlotVri");
    List<TimeSlot> timeSlotenZat = (List<TimeSlot>) request.getAttribute("timeSlotZat");
    List<TimeSlot> timeSlotenZon = (List<TimeSlot>) request.getAttribute("timeSlotZon");
%>
<jsp:include page="../partials/head.jsp"/>

<body>
<div class="container-fluid">
    <jsp:include page="../partials/adminNav.jsp"/>
    <jsp:include page="../partials/dateAndTime.jsp"/>
</div>
<div class="container">
    <div class="row pt-5">
        <div class="col">
            <div class="row text-center border border-2 p-2 border-dark">
                <h6>Van-Tot</h6>
            </div>
            <% if (timeSlotenMan != null) {
                for (TimeSlot slot : timeSlotenMan) {
                        out.print(
                                "<div style=\"heigth: 50px;\" class=\"row border border-2 p-2 text-center border-dark\">" +
                                        "<span>" + slot.getFrom().substring(0, 5) + " - " + slot.getUntil().substring(0, 5) + "</span></div>"
                        );
                }
            } %>
        </div>
        <div class="col">
            <div class="row text-center border border-2 p-2 border-dark">
                <h6>Maandag</h6>
            </div>
            <% if (timeSlotenMan != null) {
                for (TimeSlot slot : timeSlotenMan) {
                    if (slot.getIsActive()) {
                        out.print(
                                "<div style=\"heigth: 50px;\" class=\"row border border-2 p-2 text-center border-dark d-flex justify-content-end\" onclick=\"selectedTimeSlot(" + slot.getId() + "," + slot.getDayOfTheWeek() + "," + slot.getIsActive() + "," + slot.getMaxNumberOfOrders() + ")\" id=\"" + slot.getId() + "\">" +
                                        "<span id=\"nrOfOrders_" + slot.getId() + "\">" + slot.getMaxNumberOfOrders() +
                                        "<a href=\"#\" class=\"ms-4\" role=\"button\" data-bs-toggle=\"modal\" data-bs-target=\"#exampleModal\" aria-pressed=\"true\"><i class=\"bi bi-pencil-fill\"></i></a></span></div>"

                        );
                    } else {
                        out.print(
                                "<div style=\"heigth: 50px;\" class=\"row bg-danger text-light border border-2 p-2 text-center border-dark d-flex justify-content-end\" onclick=\"selectedTimeSlot(" + slot.getId() + "," + slot.getDayOfTheWeek() + "," + slot.getIsActive() + "," + slot.getMaxNumberOfOrders() + ")\" id=\"" + slot.getId() + "\">" +
                                        "<span id=\"nrOfOrders_" + slot.getId() + "\">" + slot.getMaxNumberOfOrders() +
                                        "<a href=\"#\" class=\"ms-4\" role=\"button\" data-bs-toggle=\"modal\" data-bs-target=\"#exampleModal\" aria-pressed=\"true\"><i class=\"bi bi-pencil-fill\"></i></a></span></div>"
                        );
                    }

                }
            } %>
        </div>
        <div class="col">
            <div class="row text-center border border-2 p-2 border-dark">
                <h6>Dinsdag</h6>
            </div>
            <% if (timeSlotenDin != null) {
                for (TimeSlot slot : timeSlotenDin) {
                    if (slot.getIsActive()) {
                        out.print(
                                "<div style=\"heigth: 50px;\" class=\"row border border-2 p-2 text-center border-dark d-flex justify-content-end\" onclick=\"selectedTimeSlot(" + slot.getId() + "," + slot.getDayOfTheWeek() + "," + slot.getIsActive() + "," + slot.getMaxNumberOfOrders() + ")\" id=\"" + slot.getId() + "\">" +
                                        "<span id=\"nrOfOrders_" + slot.getId() + "\">" + slot.getMaxNumberOfOrders() +
                                        "<a href=\"#\" class=\"ms-4\" role=\"button\" data-bs-toggle=\"modal\" data-bs-target=\"#exampleModal\" aria-pressed=\"true\"><i class=\"bi bi-pencil-fill\"></i></a></span></div>"

                        );
                    } else {
                        out.print(
                                "<div style=\"heigth: 50px;\" class=\"row bg-danger text-light border border-2 p-2 text-center border-dark d-flex justify-content-end\" onclick=\"selectedTimeSlot(" + slot.getId() + "," + slot.getDayOfTheWeek() + "," + slot.getIsActive() + "," + slot.getMaxNumberOfOrders() + ")\" id=\"" + slot.getId() + "\">" +
                                        "<span id=\"nrOfOrders_" + slot.getId() + "\">" + slot.getMaxNumberOfOrders() +
                                        "<a href=\"#\" class=\"ms-4\" role=\"button\" data-bs-toggle=\"modal\" data-bs-target=\"#exampleModal\" aria-pressed=\"true\"><i class=\"bi bi-pencil-fill\"></i></a></span></div>"
                        );
                    }

                }
            } %>
        </div>
        <div class="col">
            <div class="row text-center border border-2 p-2 border-dark">
                <h6>Woensdag</h6>
            </div>
            <% if (timeSlotenWoe != null) {
                for (TimeSlot slot : timeSlotenWoe) {
                    if (slot.getIsActive()) {
                        out.print(
                                "<div style=\"heigth: 50px;\" class=\"row border border-2 p-2 text-center border-dark d-flex justify-content-end\" onclick=\"selectedTimeSlot(" + slot.getId() + "," + slot.getDayOfTheWeek() + "," + slot.getIsActive() + "," + slot.getMaxNumberOfOrders() + ")\" id=\"" + slot.getId() + "\">" +
                                        "<span id=\"nrOfOrders_" + slot.getId() + "\">" + slot.getMaxNumberOfOrders() +
                                        "<a href=\"#\" class=\"ms-4\" role=\"button\" data-bs-toggle=\"modal\" data-bs-target=\"#exampleModal\" aria-pressed=\"true\"><i class=\"bi bi-pencil-fill\"></i></a></span></div>"

                        );
                    } else {
                        out.print(
                                "<div style=\"heigth: 50px;\" class=\"row bg-danger text-light border border-2 p-2 text-center border-dark d-flex justify-content-end\" onclick=\"selectedTimeSlot(" + slot.getId() + "," + slot.getDayOfTheWeek() + "," + slot.getIsActive() + "," + slot.getMaxNumberOfOrders() + ")\" id=\"" + slot.getId() + "\">" +
                                        "<span id=\"nrOfOrders_" + slot.getId() + "\">" + slot.getMaxNumberOfOrders() +
                                        "<a href=\"#\" class=\"ms-4\" role=\"button\" data-bs-toggle=\"modal\" data-bs-target=\"#exampleModal\" aria-pressed=\"true\"><i class=\"bi bi-pencil-fill\"></i></a></span></div>"
                        );
                    }

                }
            } %>
        </div>
        <div class="col">
            <div class="row text-center border border-2 p-2 border-dark">
                <h6>Donderdag</h6>
            </div>
            <% if (timeSlotenDon != null) {
                for (TimeSlot slot : timeSlotenDon) {
                    if (slot.getIsActive()) {
                        out.print(
                                "<div style=\"heigth: 50px;\" class=\"row border border-2 p-2 text-center border-dark d-flex justify-content-end\" onclick=\"selectedTimeSlot(" + slot.getId() + "," + slot.getDayOfTheWeek() + "," + slot.getIsActive() + "," + slot.getMaxNumberOfOrders() + ")\" id=\"" + slot.getId() + "\">" +
                                        "<span id=\"nrOfOrders_" + slot.getId() + "\">" + slot.getMaxNumberOfOrders() +
                                        "<a href=\"#\" class=\"ms-4\" role=\"button\" data-bs-toggle=\"modal\" data-bs-target=\"#exampleModal\" aria-pressed=\"true\"><i class=\"bi bi-pencil-fill\"></i></a></span></div>"

                        );
                    } else {
                        out.print(
                                "<div style=\"heigth: 50px;\" class=\"row bg-danger text-light border border-2 p-2 text-center border-dark d-flex justify-content-end\" onclick=\"selectedTimeSlot(" + slot.getId() + "," + slot.getDayOfTheWeek() + "," + slot.getIsActive() + "," + slot.getMaxNumberOfOrders() + ")\" id=\"" + slot.getId() + "\">" +
                                        "<span id=\"nrOfOrders_" + slot.getId() + "\">" + slot.getMaxNumberOfOrders() +
                                        "<a href=\"#\" class=\"ms-4\" role=\"button\" data-bs-toggle=\"modal\" data-bs-target=\"#exampleModal\" aria-pressed=\"true\"><i class=\"bi bi-pencil-fill\"></i></a></span></div>"
                        );
                    }

                }
            } %>
        </div>
        <div class="col">
            <div class="row text-center border border-2 p-2 border-dark">
                <h6>Vrijdag</h6>
            </div>
            <% if (timeSlotenVri != null) {
                for (TimeSlot slot : timeSlotenVri) {
                    if (slot.getIsActive()) {
                        out.print(
                                "<div style=\"heigth: 50px;\" class=\"row border border-2 p-2 text-center border-dark d-flex justify-content-end\" onclick=\"selectedTimeSlot(" + slot.getId() + "," + slot.getDayOfTheWeek() + "," + slot.getIsActive() + "," + slot.getMaxNumberOfOrders() + ")\" id=\"" + slot.getId() + "\">" +
                                        "<span id=\"nrOfOrders_" + slot.getId() + "\">" + slot.getMaxNumberOfOrders() +
                                        "<a href=\"#\" class=\"ms-4\" role=\"button\" data-bs-toggle=\"modal\" data-bs-target=\"#exampleModal\" aria-pressed=\"true\"><i class=\"bi bi-pencil-fill\"></i></a></span></div>"

                        );
                    } else {
                        out.print(
                                "<div style=\"heigth: 50px;\" class=\"row bg-danger text-light border border-2 p-2 text-center border-dark d-flex justify-content-end\" onclick=\"selectedTimeSlot(" + slot.getId() + "," + slot.getDayOfTheWeek() + "," + slot.getIsActive() + "," + slot.getMaxNumberOfOrders() + ")\" id=\"" + slot.getId() + "\">" +
                                        "<span id=\"nrOfOrders_" + slot.getId() + "\">" + slot.getMaxNumberOfOrders() +
                                        "<a href=\"#\" class=\"ms-4\" role=\"button\" data-bs-toggle=\"modal\" data-bs-target=\"#exampleModal\" aria-pressed=\"true\"><i class=\"bi bi-pencil-fill\"></i></a></span></div>"
                        );
                    }

                }
            } %>
        </div>
        <div class="col">
            <div class="row text-center border border-2 p-2 border-dark">
                <h6>Zaterdag</h6>
            </div>
            <% if (timeSlotenZat != null) {
                for (TimeSlot slot : timeSlotenZat) {
                    if (slot.getIsActive()) {
                        out.print(
                                "<div style=\"heigth: 50px;\" class=\"row border border-2 p-2 text-center border-dark d-flex justify-content-end\" onclick=\"selectedTimeSlot(" + slot.getId() + "," + slot.getDayOfTheWeek() + "," + slot.getIsActive() + "," + slot.getMaxNumberOfOrders() + ")\" id=\"" + slot.getId() + "\">" +
                                        "<span id=\"nrOfOrders_" + slot.getId() + "\">" + slot.getMaxNumberOfOrders() +
                                        "<a href=\"#\" class=\"ms-4\" role=\"button\" data-bs-toggle=\"modal\" data-bs-target=\"#exampleModal\" aria-pressed=\"true\"><i class=\"bi bi-pencil-fill\"></i></a></span></div>"

                        );
                    } else {
                        out.print(
                                "<div style=\"heigth: 50px;\" class=\"row bg-danger text-light border border-2 p-2 text-center border-dark d-flex justify-content-end\" onclick=\"selectedTimeSlot(" + slot.getId() + "," + slot.getDayOfTheWeek() + "," + slot.getIsActive() + "," + slot.getMaxNumberOfOrders() + ")\" id=\"" + slot.getId() + "\">" +
                                        "<span id=\"nrOfOrders_" + slot.getId() + "\">" + slot.getMaxNumberOfOrders() +
                                        "<a href=\"#\" class=\"ms-4\" role=\"button\" data-bs-toggle=\"modal\" data-bs-target=\"#exampleModal\" aria-pressed=\"true\"><i class=\"bi bi-pencil-fill\"></i></a></span></div>"
                        );
                    }

                }
            } %>
        </div>
        <div class="col">
            <div class="row text-center border border-2 p-2 border-dark">
                <h6>Zondag</h6>
            </div>
            <% if (timeSlotenZon != null) {
                for (TimeSlot slot : timeSlotenZon) {
                    if (slot.getIsActive()) {
                        out.print(
                                "<div style=\"heigth: 50px;\" class=\"row border border-2 p-2 text-center border-dark d-flex justify-content-end\" onclick=\"selectedTimeSlot(" + slot.getId() + "," + slot.getDayOfTheWeek() + "," + slot.getIsActive() + "," + slot.getMaxNumberOfOrders() + ")\" id=\"" + slot.getId() + "\">" +
                                        "<span id=\"nrOfOrders_" + slot.getId() + "\">" + slot.getMaxNumberOfOrders() +
                                        "<a href=\"#\" class=\"ms-4\" role=\"button\" data-bs-toggle=\"modal\" data-bs-target=\"#exampleModal\" aria-pressed=\"true\"><i class=\"bi bi-pencil-fill\"></i></a></span></div>"

                        );
                    } else {
                        out.print(
                                "<div style=\"heigth: 50px;\" class=\"row bg-danger text-light border border-2 p-2 text-center border-dark d-flex justify-content-end\" onclick=\"selectedTimeSlot(" + slot.getId() + "," + slot.getDayOfTheWeek() + "," + slot.getIsActive() + "," + slot.getMaxNumberOfOrders() + ")\" id=\"" + slot.getId() + "\">" +
                                        "<span id=\"nrOfOrders_" + slot.getId() + "\">" + slot.getMaxNumberOfOrders() +
                                        "<a href=\"#\" class=\"ms-4\" role=\"button\" data-bs-toggle=\"modal\" data-bs-target=\"#exampleModal\" aria-pressed=\"true\"><i class=\"bi bi-pencil-fill\"></i></a></span></div>"
                        );
                    }

                }
            } %>
        </div>
    </div>
    <div class="row py-5">
        <div class="col">
            <form action="/Admin/TimeSlots/Default" method="post" id="default">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                <div class="row g-3 align-items-end">
                    <div class="col-auto">
                        <label for="defaultNrOfOrders" class="col-form-label">Standaard aantal bestellingen per
                            tijdslot: </label>
                    </div>
                    <div class="col-auto">
                        <input type="number" name="defaultNrOfOrders" id="defaultNrOfOrders" class="form-control"
                               value="10" min="0" max="100" step="1">
                    </div>
                    <div class="col-auto">
                        <button type="button" onclick="submitDefault()" class="btn btn-primary">Aanpassen</button>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Tijdslot wijzigen...</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col">
                            <form action="/Admin/TimeSlots/Change" method="post" id="timeSlotSpecsForm">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                <input type="hidden" id="timeSlotId" value="" name="timeSlotId">
                                <input type="hidden" id="isActive" value="" name="isActive">
                                <input type="hidden" id="nrOfOrders" value="" name="nrOfOrders">
                                <div class="form-check form-switch">
                                    <input class="form-check-input" type="checkbox" id="activeOrDeactivated" onclick="changeActive()" checked>
                                    <label class="form-check-label" for="activeOrDeactivated">Orders ontvangen voor dit tijdslot.</label>
                                </div>
                                <select class="form-select mt-4" aria-label="Default select example" id="maxNumberOfOrders" onchange="changeMax()">
                                    <option selected disabled>Maximaal aantal bestellingen dit tijdslot...</option>
                                    <%
                                        for (int t = 0; t < 51; t++)
                                        {
                                            out.print(
                                                    "<option value=\""+ t + "\">"+ t + " bestellingen</option>"
                                            );
                                        }
                                    %>
                                </select>
                                <button type="button" class="btn btn-primary mt-4 float-end" onclick="testSubmit()">Save changes</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
<jsp:include page="../partials/footer.jsp"/>
    <script src="/js/adminTimeSlots.js" type="text/JavaScript"></script>
</body>
</html>