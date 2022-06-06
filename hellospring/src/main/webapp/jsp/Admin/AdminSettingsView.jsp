<%@ page import="be.thomasmore.graduaten.hellospring.entities.Vacation" %>
<%@ page import="java.util.List" %>
<%@ page import="be.thomasmore.graduaten.hellospring.entities.OpeningHours" %>
<%
    List<Vacation> planned = (List<Vacation>) request.getAttribute("plannedVacation");
    List<OpeningHours> openingHoursList = (List<OpeningHours>) request.getAttribute("openingHoursList");

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
                <div class="row">
                    <div class="col">
                        <form id="openingHours" method="post" action="/Admin/Settings/Openinghours">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                            <div class="row mb-3">
                                <div class="col-4">Dag van de week</div>
                                <div class="col-7">
                                    <select name="dayOfTheWeek" onchange="changeDay()" id="dayOfTheWeek" class="form-control">
                                    <option id="dayOfTheWeek_0" value="0">Maandag</option>
                                    <option id="dayOfTheWeek_1" value="1">Dinsdag</option>
                                    <option id="dayOfTheWeek_2" value="2">Woensdag</option>
                                    <option id="dayOfTheWeek_3" value="3">Donderdag</option>
                                    <option id="dayOfTheWeek_4" value="4">Vrijdag</option>
                                    <option id="dayOfTheWeek_5" value="5">Zaterdag</option>
                                    <option id="dayOfTheWeek_6" value="6">Zondag</option>
                                </select>
                                </div>
                                <div class="col-1">
                                    <div class="form-check">
                                        <input class="form-check-input" name="closed" type="checkbox" value="1" id="flexCheckDefault" onchange="isClosed()">
                                        <label class="form-check-label" for="flexCheckDefault">
                                            sluitingsdag
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <div class="col border border-1 m-2 p-2 text-center">
                                    <div class="row mb-3"><b>1ste openingsmoment</b></div>
                                    <div class="row mb-3">
                                        <div class="col text-start"><b>van</b></div>
                                        <div class="col text-start"><b>tot</b></div>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col">
                                            <select name="fromHours" onchange="changeHours(this)" id="fromHours" class="form-control">
                                                <%
                                                    for (int x = 10; x <= 23; x++) {
                                                        out.print(
                                                                "<option id=\"" + x + "\" value=\"" + x + "\">" + x + "</option>"
                                                        );
                                                    }
                                                %>
                                            </select>
                                        </div>
                                        <div class="col-1"><b>:</b></div>
                                        <div class="col">
                                            <select name="fromMinutes" onchange="changeMinutes(this)" id="fromMinutes" class="form-control">
                                                <option id="minute_0" value="00">00</option>
                                                <option id="minute_15" value="15">15</option>
                                                <option id="minute_30" value="30">30</option>
                                                <option id="minute_45" value="45">45</option>
                                            </select>
                                        </div>
                                        <div class="col">
                                            <select name="untilHours" onchange="changeHours(this)" id="untilHours" class="form-control" disabled>
                                                <%
                                                    for (int x = 10; x <= 23; x++) {
                                                        out.print(
                                                                "<option id=\"" + x + "\" value=\"" + x + "\">" + x + "</option>"
                                                        );
                                                    }
                                                %>

                                            </select>
                                        </div>
                                        <div class="col-1"><b>:</b></div>
                                        <div class="col">
                                            <select name="untilMinutes" onchange="changeMinutes(this)" id="untilMinutes" class="form-control" disabled>
                                                <option id="untilminute_0" value="00">00</option>
                                                <option id="untilminute_15" value="15">15</option>
                                                <option id="untilminute_30" value="30">30</option>
                                                <option id="untilminute_45" value="45">45</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="col border border-1 m-2 p-2 text-center">
                                    <div class="row mb-3"><b>2de openingsmoment</b></div>
                                    <div class="row mb-3">
                                        <div class="col text-start"><b>van</b></div>
                                        <div class="col text-start"><b>tot</b></div>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col">
                                            <select name="fromHoursSecond" onchange="changeHours(this)" id="fromHoursSecond" class="form-control" disabled>
                                                <%
                                                    for (int x = 10; x <= 23; x++) {
                                                        out.print(
                                                                "<option id=\"" + x + "_Second\" value=\"" + x + "\">" + x + "</option>"
                                                        );
                                                    }
                                                %>
                                            </select>
                                        </div>
                                        <div class="col-1"><b>:</b></div>
                                        <div class="col">
                                            <select name="fromMinutesSecond" onchange="changeMinutes(this)" id="fromMinutesSecond"
                                                    class="form-control" disabled>
                                                <option id="minute_0_Second" value="00">00</option>
                                                <option id="minute_15_Second" value="15">15</option>
                                                <option id="minute_30_Second" value="30">30</option>
                                                <option id="minute_45_Second" value="45">45</option>
                                            </select>
                                        </div>
                                        <div class="col">
                                            <select name="untilHoursSecond" onchange="changeHours(this)" id="untilHoursSecond" class="form-control" disabled>
                                                <%
                                                    for (int x = 10; x <= 23; x++) {
                                                        out.print(
                                                                "<option id=\"" + x + "_Second\" value=\"" + x + "\">" + x + "</option>"
                                                        );
                                                    }
                                                %>

                                            </select>
                                        </div>
                                        <div class="col-1"><b>:</b></div>
                                        <div class="col">
                                            <select name="untilMinutesSecond" onchange="changeMinutes(this)" id="untilMinutesSecond"
                                                    class="form-control" disabled>
                                                <option id="untilminute_0_Second" value="00">00</option>
                                                <option id="untilminute_15_Second" value="15">15</option>
                                                <option id="untilminute_30_Second" value="30">30</option>
                                                <option id="untilminute_45_Second" value="45">45</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <%
                                    if (openingHoursList != null) {
                                        for (OpeningHours openingHours : openingHoursList) {
                                            String weekday;
                                            switch (openingHours.getDayOfTheWeek()) {
                                                case 0:
                                                    weekday = "Maandag";
                                                    break;
                                                case 1:
                                                    weekday = "Dinsdag";
                                                    break;
                                                case 2:
                                                    weekday = "Woensdag";
                                                    break;
                                                case 3:
                                                    weekday = "Donderdag";
                                                    break;
                                                case 4:
                                                    weekday = "Vrijdag";
                                                    break;
                                                case 5:
                                                    weekday = "Zaterdag";
                                                    break;
                                                case 6:
                                                    weekday = "Zondag";
                                                    break;
                                                default:
                                                    return;
                                            }
                                            out.print(
                                                    "<div class=\"row\">\n" +
                                                            "<div class=\"col-3\">" + weekday + "</div>\n" +
                                                            "<div class=\"col-3\">" + openingHours.getFrom() + "</div>\n" +
                                                            "<div class=\"col-3\">" + openingHours.getUntil() + "</div>\n" +
                                                            "<div class=\"col-3\"><a title=\"delete\" href=\"/Admin/Settings/Openinghours/Delete?id=" + openingHours.getId() + "\" class=\"text-danger\">" +
                                                            "<i class=\"bi bi-trash3 \"></i>" +
                                                            "</a></div>\n" +
                                                            "</div>"
                                            );
                                        }
                                    }
                                %>

                            </div>
                            <div class="row mb-3 d-flex justify-conten-end">
                                <button type="button" class="btn btn-primary fs-small" onclick="updateOpeningHours()"><i
                                        class="bi bi-plus"></i> TOEVOEGEN
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <jsp:include page="../partials/footer.jsp"/>
            <script src="/js/adminSettings.js" type="text/JavaScript"></script>

</body>
</html>