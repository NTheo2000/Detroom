<%@ page import="detroom_java.*"%>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<%
String auebmail = request.getParameter("auebmail");
String password = request.getParameter("password");
String userid = auebmail;
int index = userid.indexOf("@");
userid = userid.substring(0,index);

try{
    user1.authenticate(auebmail, password);
    session.setAttribute("activeUser",user.findUsermail(auebmail));
%>
    <jsp:forward page="homepage.jsp"/>
<%
}catch(Exception e){
    request.setAttribute("message", "Wrong username or password");
%>
    <jsp:forward page="login.jsp"/>
<% }
%>