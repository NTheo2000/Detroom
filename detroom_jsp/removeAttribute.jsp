<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
if (session.getAttribute("activeUser") == null) {
    response.sendRedirect("login.jsp");
    return;
}
String idteam = request.getParameter("idteam");
session.removeAttribute("studentObj");
session.removeAttribute("profObj");
%>
<jsp:forward page="teamprofile.jsp?idteam=<%=idteam%>"/>