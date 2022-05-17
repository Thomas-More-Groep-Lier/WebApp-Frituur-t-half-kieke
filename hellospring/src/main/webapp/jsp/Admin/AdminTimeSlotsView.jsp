
<%@ page import="be.thomasmore.graduaten.hellospring.entities.TimeSlot" %>
    <%@ page import="java.util.List" %>
        <%
         List<TimeSlot> timeSlotenMan = (List<TimeSlot>) request.getAttribute("timeSlotMan");
         List<TimeSlot> timeSlotenDin = (List<TimeSlot>) request.getAttribute("dinsdag");
         List<TimeSlot> timeSlotenWoe = (List<TimeSlot>) request.getAttribute("woensdag");
         List<TimeSlot> timeSlotenDon = (List<TimeSlot>) request.getAttribute("donderdag");
         List<TimeSlot> timeSlotenVri = (List<TimeSlot>) request.getAttribute("vrijdag");
         List<TimeSlot> timeSlotenZat = (List<TimeSlot>) request.getAttribute("zaterdag");
         List<TimeSlot> timeSlotenZon = (List<TimeSlot>) request.getAttribute("zondag");
                %>
                <jsp:include page="../partials/head.jsp" />

                <body>
                    <div class="container-fluid">
                        <jsp:include page="../partials/adminNav.jsp" />
                        <jsp:include page="../partials/dateAndTime.jsp" />
                    </div>
                    <div class="container">
                        <div class="row">
                            <div class="col">
                                    <% if (timeSlotenMan != null) {
                                        for (TimeSlot slot : timeSlotenMan) {
                                            out.print(
                                                    "<div class=\"row mt-3\">" +
                                                            "<div class=\"col\" id=\"" + slot.getId() +"\">" +
                                                            slot.getFrom()
                                                            +
                                                            "</div>" +
                                                            "</div>"
                                            );
                                        }} %>
                                </table>
                            </div>
                        </div>
                        <jsp:include page="../partials/footer.jsp" />

                </body>
                </html>
