<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
    Date date = new Date();
    SimpleDateFormat format = new SimpleDateFormat("EEEE, dd MMMM YYYY");
    SimpleDateFormat time = new SimpleDateFormat("hh:mm:ss");
%>
<div class="row">
    <div class="col text-end p-3" id="currentDate">
        <span>
            <%=format.format(date)%><br/>
            <%=time.format(date)%>
        </span>
    </div>
</div>