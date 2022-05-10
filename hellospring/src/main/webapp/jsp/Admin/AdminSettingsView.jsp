<%--
  Created by IntelliJ IDEA.
  User: maart
  Date: 23/03/2022
  Time: 20:30
  To change this template use File | Settings | File Templates.
--%>
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
    <div class="row mb-3">
        <div class="col-7" id="toggleOpenCloseStatus" onclick="changeStatus()">
            <div class="row bg-primary p-1">
                <div class="col">
                    <span class="text-light text-center">WINKEL STATUS</span>
                </div>
            </div>
            <div class="row border border-1 rounded p-3">
                <%
                    if ((boolean) request.getAttribute("shopStatus")) {
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
                <form id="vakantiePlanning">
                    <div class="row mb-5">
                        <div class="col-4">
                            <label for="from" class="form-label">Van</label>
                            <input type="date" class="form-control" id="from"/>
                        </div>
                        <div class="col-4">
                            <label for="untill" class="form-label">Tot</label>
                            <input type="date" class="form-control" id="untill"/>
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
                                <tr>
                                    <%
                                        /*for (Vacation record : plannedVacation) {
                                            out.print(
                                                    "<td>"+ record.getFrom() +"</td>" +
                                                    "<td>"+ record.getUntill() +"</td>"
                                                    "<td>" +
                                                            "<a title=\"delete\" href=\"/Admin/Product/Delete?id=" + record.getId() +"\" class=\"text-danger\">" +
                                                            "<i class=\"bi bi-trash3 \"></i>" +
                                                            "</a></td>"
                                            );
                                        }*/
                                    %>
                                </tr>
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
                    <form id="openingHours" method="post" action="">
                        <div class="row mb-3">
                            <div class="col-4"></div>
                            <div class="col-4"><h6>Van</h6></div>
                            <div class="col-4"><h6>Tot</h6></div>
                        </div>
                        <div class="row mb-3" id="monday">
                            <div class="col-4"><h6>Maandag</h6></div>
                            <div class="col-4">
                                <input type="time" name="mondayFrom" class="form-control">
                                <input type="time" name="mondayFrom2" class="form-control d-none">
                            </div>
                            <div class="col-4">
                                <input type="time" name="mondayUntil" class="form-control">
                                <input type="time" name="mondayUntil2" class="form-control d-none">
                            </div>
                        </div>
                        <div class="row mb-3" id="tuesday">
                            <div class="col-4"><h6>Dinsdag</h6></div>
                            <div class="col-4">
                                <input type="time" name="tuesdayFrom" class="form-control">
                                <input type="time" name="tuesdayFrom2" class="form-control d-none">
                            </div>
                            <div class="col-4">
                                <input type="time" name="tuesdayUntil" class="form-control">
                                <input type="time" name="tuesdayUntil2" class="form-control d-none">
                            </div>
                        </div>
                        <div class="row mb-3" id="wednesday">
                            <div class="col-4"><h6>Woensdag</h6></div>
                            <div class="col-4">
                                <input type="time" name="wednesdayFrom" class="form-control">
                                <input type="time" name="wednesdayFrom2" class="form-control d-none">
                            </div>
                            <div class="col-4">
                                <input type="time" name="wednesdayUntil" class="form-control">
                                <input type="time" name="wednesdayUntil2" class="form-control d-none">
                            </div>
                        </div>
                        <div class="row mb-3" id="thursday">
                            <div class="col-4"><h6>Donderdag</h6></div>
                            <div class="col-4">
                                <input type="time" name="thursdayFrom" class="form-control">
                                <input type="time" name="thursdayFrom2" class="form-control d-none">
                            </div>
                            <div class="col-4">
                                <input type="time" name="thursdayUntil" class="form-control">
                                <input type="time" name="thursdayUntil2" class="form-control d-none">
                            </div>
                        </div>
                        <div class="row mb-3" id="friday">
                            <div class="col-4"><h6>Vrijdag</h6></div>
                            <div class="col-4">
                                <input type="time" name="fridayFrom" class="form-control">
                                <input type="time" name="fridayFrom2" class="form-control d-none">
                            </div>
                            <div class="col-4">
                                <input type="time" name="fridayUntil" class="form-control">
                                <input type="time" name="fridayUntil2" class="form-control d-none">
                            </div>
                        </div>
                        <div class="row mb-3" id="saturday">
                            <div class="col-4"><h6>Zaterdag</h6></div>
                            <div class="col-4">
                                <input type="time" name="saturdayFrom" class="form-control">
                                <input type="time" name="saturdayFrom2" class="form-control d-none">
                            </div>
                            <div class="col-4">
                                <input type="time" name="saturdayUntil" class="form-control">
                                <input type="time" name="saturdayUntil2" class="form-control d-none">
                            </div>
                        </div>
                        <div class="row mb-3" id="sunday">
                            <div class="col-4"><h6>Zondag</h6></div>
                            <div class="col-4">
                                <input type="time" name="sundayFrom" class="form-control">
                                <input type="time" name="sundayFrom2" class="form-control d-none">
                            </div>
                            <div class="col-4">
                                <input type="time" name="sundayUntil" class="form-control">
                                <input type="time" name="sundayUntil2" class="form-control d-none">
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
<form id="statusForm" class="d-none" method="post">
    <input type="hidden" name="status" value="<%out.print(!(boolean) request.getAttribute("shopStatus"));%>"/>
</form>
<jsp:include page="../partials/footer.jsp"/>
<script>
    function changeStatus() {
        document.getElementById('statusForm').submit();
    }

    function submitTimeOff() {
        document.getElementById('vakantiePlanning').submit();
    }

    function changeStatus() {
        document.getElementById('openingHours').submit();
    }
</script>
</body>
</html>