<%@ page import="be.thomasmore.graduaten.hellospring.entities.Vacation" %>
<%@ page import="java.util.List" %>
<%
    List<Vacation> planned = (List<Vacation>) request.getAttribute("plannedVacation");

%>
<jsp:include page="../partials/head.jsp"/>
<body>
<div class="container-fluid">
    <jsp:include page="../partials/adminNav.jsp"/>
    <jsp:include page="../partials/dateAndTime.jsp"/>
</div>
<div class="container">
    <div class="row mb-3">
        <div class="col-7" id="toggleOpenCloseStatus">
            <div class="row bg-primary p-1">
                <div class="col">
                    <span class="text-light text-center">WINKEL STATUS</span>
                </div>
            </div>
            <div class="row border border-1 rounded p-3">
                <%
                    if (!(boolean) request.getAttribute("shopStatus")) {
                        out.print(
                                "<div class=\"d-flex\" id=\"open\">" +
                                        "<div class=\"col-3\">" +
                                        "<h2 class=\"display-3 fw-bold text-center text-success\"><i class=\"bi bi-check-lg\"></i></h2>" +
                                        "</div>" +
                                        "<div class=\"col-9\">" +
                                        "<h2 class=\"display-3 fw-bold text-center text-success\">OPEN</h2>" +
                                        "</div></div>"
                        );
                    } else {
                        out.print(
                                "<div class=\"d-flex\" id=\"gesloten\">" +
                                        "<div class=\"col-3\">" +
                                        "<h2 class=\"display-3 fw-bold text-center text-danger\"><i class=\"bi bi-x-lg\"></i></h2>" +
                                        "</div>" +
                                        "<div class=\"col-9\">" +
                                        "<h2 class=\"display-3 fw-bold text-center text-danger\">GESLOTEN</h2>" +
                                        "</div></div>"
                        );

                    }
                %>
            </div>
        </div>
    </div>
    <div class="row mb-3 gx-5">
        <div class="col-2">
            <div class="row bg-primary p-1">
                <div class="col">
                    <span class="text-light text-center">LOGO</span>
                </div>
            </div>
            <div class="row border border-1 rounded p-3">
                <img src="<%out.print(request.getAttribute("logo"));%>" alt="frituur t'half kieke logo"
                     class="img-fluid"/>
            </div>
        </div>
        <div class="col-10">
            <div class="row bg-primary p-1">
                <div class="col">
                    <span class="text-light text-center">VAKANTIE PLANNING</span>
                </div>
            </div>
            <div class="row border border-1 rounded p-3">
                <form id="vakantiePlanning" method="post" action="/Admin/Settings/AddVacation">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    <div class="row mb-5">
                        <div class="col-4">
                            <label for="from" class="form-label">Van</label>
                            <input type="date" name="from" class="form-control" id="from"/>
                        </div>
                        <div class="col-4">
                            <label for="untill" class="form-label">Tot</label>
                            <input type="date" name="untill" class="form-control" id="untill"/>
                        </div>
                        <div class="col-4 d-flex align-items-end justify-content-start">
                            <button type="button" class="btn btn-primary fs-small" onclick="submitTimeOff()"><i
                                    class="bi bi-plus"></i> TOEVOEGEN
                            </button>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <h6>Uw geplande vankantie ...</h6>
                             <table class="table">
                                <tr>
                                    <th scope="col">Van</th>
                                    <th scope="col">Tot</th>
                                    <th scope="col">Delete</th>
                                </tr>
                                <%

                                    if (planned != null) {
                                        for (Vacation record : planned) {
                                            out.print(
                                                    "<tr id=\"+ record.getId() +\"><td>" + record.getFromDate() + "</td>" +
                                                            "<td>" + record.getUntilDate() + "</td><td>" +
                                                            "<a title=\"delete\" href=\"/Admin/Settings/Vacation/Delete?id=" + record.getId() + "\" class=\"text-danger\">" +
                                                            "<i class=\"bi bi-trash3 \"></i>" +
                                                            "</a></td></tr>"
                                            );
                                        }
                                    }
                                %>
                            </table>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <div class="row mb-3">
        <div class="col">
            <div class="row bg-primary p-1">
                <div class="col">
                    <span class="text-light text-center">OPENINGSUREN</span>
                </div>
            </div>
            <div class="row border border-1 rounded p-3">
                <div class="col">
                    <form id="openingHours" method="post" action="/Admin/Settings/Openinghours">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                        <div class="row mb-3">
                            <div class="col-4"></div>
                            <div class="col-4"><h6>Van</h6></div>
                            <div class="col-4"><h6>Tot</h6></div>
                        </div>
                        <div class="row mb-3" id="monday">
                            <div class="col-4"><h6>Maandag</h6></div>
                            <div class="col-4">
                                <input type="time" name="mondayFrom" id="mondayFrom" class="form-control" step="900" min="10:00"
                                       max="24:00" value="" onchange="interactivOpeningHoursForm('mon')">
                                <input type="time" name="mondayFrom2" id="mondayFrom2" class="form-control d-none" step="900" min="10:00"
                                       max="24:00" value="">
                            </div>
                            <div class="col-4">
                                <input type="time" name="mondayUntil" id="mondayUntil" class="form-control" step="900" min="10:00"
                                       max="24:00" value="" onchange="interactivOpeningHoursForm('mon')">
                                <input type="time" name="mondayUntil2" id="mondayUntil2" class="form-control d-none" step="900"
                                       min="10:00" max="24:00" value="">
                            </div>
                        </div>
                        <div class="row mb-3" id="tuesday">
                            <div class="col-4"><h6>Dinsdag</h6></div>
                            <div class="col-4">
                                <input type="time" name="tuesdayFrom" id="tuesdayFrom" class="form-control" step="900" min="10:00"
                                       max="24:00" value="" onchange="interactivOpeningHoursForm('tue')">
                                <input type="time" name="tuesdayFrom2" id="tuesdayFrom2" class="form-control d-none" step="900"
                                       min="10:00" max="24:00" value="">
                            </div>
                            <div class="col-4">
                                <input type="time" name="tuesdayUntil" id="tuesdayUntil" class="form-control" step="900" min="10:00"
                                       max="24:00" value="" onchange="interactivOpeningHoursForm('tue')">
                                <input type="time" name="tuesdayUntil2" id="tuesdayUntil2" class="form-control d-none" step="900"
                                       min="10:00" max="24:00" value="">
                            </div>
                        </div>
                        <div class="row mb-3" id="wednesday">
                            <div class="col-4"><h6>Woensdag</h6></div>
                            <div class="col-4">
                                <input type="time" name="wednesdayFrom" id="wednesdayFrom" class="form-control" step="900" min="10:00"
                                       max="24:00" value="" onchange="interactivOpeningHoursForm('wed')">
                                <input type="time" name="wednesdayFrom2" id="wednesdayFrom2" class="form-control d-none" step="900"
                                       min="10:00" max="24:00" value="">
                            </div>
                            <div class="col-4">
                                <input type="time" name="wednesdayUntil" id="wednesdayUntil" class="form-control" step="900" min="10:00"
                                       max="24:00" value="" onchange="interactivOpeningHoursForm('wed')">
                                <input type="time" name="wednesdayUntil2" id="wednesdayUntil2" class="form-control d-none" step="900"
                                       min="10:00" max="24:00" value="">
                            </div>
                        </div>
                        <div class="row mb-3" id="thursday">
                            <div class="col-4"><h6>Donderdag</h6></div>
                            <div class="col-4">
                                <input type="time" name="thursdayFrom" id="thursdayFrom" class="form-control" step="900" min="10:00"
                                       max="24:00" value="" onchange="interactivOpeningHoursForm('thu')">
                                <input type="time" name="thursdayFrom2" id="thursdayFrom2" class="form-control d-none" step="900"
                                       min="10:00" max="24:00" value="">
                            </div>
                            <div class="col-4">
                                <input type="time" name="thursdayUntil" id="thursdayUntil" class="form-control" step="900" min="10:00"
                                       max="24:00" value="" onchange="interactivOpeningHoursForm('thu')">
                                <input type="time" name="thursdayUntil2" id="thursdayUntil2" class="form-control d-none" step="900"
                                       min="10:00" max="24:00" value="">
                            </div>
                        </div>
                        <div class="row mb-3" id="friday">
                            <div class="col-4"><h6>Vrijdag</h6></div>
                            <div class="col-4">
                                <input type="time" name="fridayFrom" id="fridayFrom" class="form-control" step="900" min="10:00"
                                       max="24:00" value="" onchange="interactivOpeningHoursForm('fri')">
                                <input type="time" name="fridayFrom2" id="fridayFrom2" class="form-control d-none" step="900" min="10:00"
                                       max="24:00" value="">
                            </div>
                            <div class="col-4">
                                <input type="time" name="fridayUntil" id="fridayUntil" class="form-control" step="900" min="10:00"
                                       max="24:00" value="" onchange="interactivOpeningHoursForm('fri')">
                                <input type="time" name="fridayUntil2"  id="fridayUntil2" class="form-control d-none" step="900"
                                       min="10:00" max="24:00" value="">
                            </div>
                        </div>
                        <div class="row mb-3" id="saturday">
                            <div class="col-4"><h6>Zaterdag</h6></div>
                            <div class="col-4">
                                <input type="time" name="saturdayFrom" id="saturdayFrom" class="form-control" step="900" min="10:00"
                                       max="24:00" value="" onchange="interactivOpeningHoursForm('sat')">
                                <input type="time" name="saturdayFrom2" id="saturdayFrom2" class="form-control d-none" step="900"
                                       min="10:00" max="24:00" value="">
                            </div>
                            <div class="col-4">
                                <input type="time" name="saturdayUntil" id="saturdayUntil" class="form-control" step="900" min="10:00"
                                       max="24:00" value="" onchange="interactivOpeningHoursForm('sat')">
                                <input type="time" name="saturdayUntil2" id="saturdayUntil2" class="form-control d-none" step="900"
                                       min="10:00" max="24:00" value="">
                            </div>
                        </div>
                        <div class="row mb-3" id="sunday">
                            <div class="col-4"><h6>Zondag</h6></div>
                            <div class="col-4">
                                <input type="time" name="sundayFrom" id="sundayFrom" class="form-control" step="900" min="10:00"
                                       max="24:00" value="" onchange="interactivOpeningHoursForm('sun')">
                                <input type="time" name="sundayFrom2" id="sundayFrom2" class="form-control d-none" step="900" min="10:00"
                                       max="24:00" value="">
                            </div>
                            <div class="col-4">
                                <input type="time" name="sundayUntil" id="sundayUntil" class="form-control" step="900" min="10:00"
                                       max="24:00" value="" onchange="interactivOpeningHoursForm('sun')">
                                <input type="time" name="sundayUntil2" id="sundayUntil2" class="form-control d-none" step="900"
                                       min="10:00" max="24:00" value="">
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col d-flex align-items-end justify-content-end">
                                <button type="button" class="btn btn-primary" onclick="updateOpeningHours()"><i
                                        class="bi bi-pencil-fill"></i> AANPASSEN
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="../partials/footer.jsp"/>
<script src="/js/adminSettings.js" type="text/JavaScript"></script>

</body>
</html>