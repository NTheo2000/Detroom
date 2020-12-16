<%@ page import="detroom_java.*"%>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
String name = (String)request.getParameter("name");
String surname = (String)request.getParameter("surname");
String auebmail = request.getParameter("auebmail");
String password = (String)request.getParameter("password");
String confirm_password = (String)request.getParameter("confirm_password");
String type = (String)request.getParameter("usertype");
String userid = auebmail;
int index = userid.indexOf("@");
userid = userid.substring(0,index);
%>
<%
try{
    if(name.length()<=2){
        throw new Exception("Name is not valid. You must have 3 or more characters");
    }
    if(surname.length()<=2){
        throw new Exception("Surame is not valid. You must have 3 or more characters");
    }
    if (auebmail.length() == 0 ) {
        throw new Exception("No email inserted");
    }
    
    if(!password.equals(confirm_password)){
        throw new Exception("Password and confirm password do not match");
    }
    if(type.equals("Student")){
        Student student = new Student (name,surname,auebmail,password,userid);
        StudentDAO studentdao = new StudentDAO();
        studentdao.registerStudent(student);
        request.setAttribute( "message", "Success" );
        
    }else if(type.equals("Professor")){
        Professor professor = new Professor(name,surname,auebmail,password,userid);
        ProfessorDAO professordao = new ProfessorDAO();
        professordao.registerProfessor(professor);
        request.setAttribute( "message", "Success" );

    }else{
        throw new Exception("Registration not completed try again");
    }
%> 
    <jsp:forward page="login.jsp"/><%


}catch(Exception e){
    request.setAttribute( "message", e.getMessage() );
    %>
    <jsp:forward page="login.jsp"/><%

}%>
