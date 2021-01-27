<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="detroom_java.*"%>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="org.apache.commons.io.output.*" %>
<%@ page import="java.io.*,java.util.*"%>

<% 
if (session.getAttribute("activeUser") == null) {
  response.sendRedirect("login.jsp");
  return;
}
String url = request.getParameter("url");

File file ;
int maxFileSize = 5000 * 1024;
int maxMemSize = 5000 * 1024;
String filePath = "C:/Program Files/Apache Software Foundation/Tomcat 6.0/webapps/ismgroup20/userImages";

String contentType = request.getContentType();
if ((contentType.indexOf("multipart/form-data") >= 0)) {

    DiskFileItemFactory factory = new DiskFileItemFactory();
    factory.setSizeThreshold(maxMemSize);
    factory.setRepository(new File("c:\\temp"));
    ServletFileUpload upload = new ServletFileUpload(factory);
    upload.setSizeMax( maxFileSize );
    String uploadFilePath = "";
    try{ 
        List fileItems = upload.parseRequest(request);
        Iterator i = fileItems.iterator();
        while ( i.hasNext () ) {
        FileItem fi = (FileItem)i.next();
            if (!fi.isFormField () )  {
                String fieldName = fi.getFieldName();
                String fileName = new String(fi.getName().getBytes("ISO-8859-1"), "UTF-8");
                boolean isInMemory = fi.isInMemory();
                long sizeInBytes = fi.getSize();
                file = new File( filePath + "/" + fileName);
                uploadFilePath = "userImages/" + fileName;
                fi.write( file ) ;
            }
        }
        if (url.equals("userprofile.jsp")) {
            User activeUser = (User)session.getAttribute("activeUser");
            String iduser = activeUser.getUserid();
            StudentDAO studentdao = new StudentDAO();
            ProfessorDAO professordao = new ProfessorDAO();
            Professor professor = professordao.findProfessorID(iduser);
            Student student = studentdao.findStudentID(iduser);
            if (professor == null) {
                student.setPhoto(uploadFilePath);
                studentdao.editStudent(student);
                session.setAttribute("activeUser", student);
            } else {
                professor.setPhoto(uploadFilePath);
                professordao.editProfessor(professor);
                session.setAttribute("activeUser", professor);
            }
%>
        <jsp:forward page="<%=url%>"/>    
<%             
        } else {    
            int idteam = Integer.parseInt(request.getParameter("idteam"));
            TeamDAO teamdao = new TeamDAO();
            Team activeTeam = teamdao.findTeam(idteam);
            activeTeam.setImagePath(uploadFilePath);
            teamdao.editTeam(activeTeam);
            url += "?idteam=" + String.valueOf(idteam);
%>
        <jsp:forward page="<%=url%>"/>
<%
        } 
} catch(Exception e) {
%>              
        <jsp:forward page="<%=url%>"/>    
<%            
    }
} else {
%>
<jsp:forward page="<%=url%>"/>
<%
}
%>

