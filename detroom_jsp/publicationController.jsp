<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="org.apache.commons.io.output.*" %>
<%@ page import="detroom_java.*"%>
<%@ page import="java.sql.Timestamp"%>
<%@ page import="java.lang.Integer"%>

<% 
if (session.getAttribute("activeUser") == null) {
  response.sendRedirect("login.jsp");
  return;
}
User activeUser = (User) session.getAttribute("activeUser");
String typeUser = (String) session.getAttribute("userType");
int teamid = Integer.parseInt(request.getParameter("teamid"));
String url = request.getParameter("url");
if (url.equals("teamprofile.jsp")){
    url += "?idteam=" + String.valueOf(teamid);
}
%>
 
 <%
   File file ;
   int maxFileSize = 5000 * 1024;
   int maxMemSize = 5000 * 1024;
   String filePath = "C:/Program Files/Apache Software Foundation/Tomcat 6.0/webapps/ismgroup20/publicationFiles";
 
   String contentType = request.getContentType();
   if ((contentType.indexOf("multipart/form-data") >= 0)) {
 
      DiskFileItemFactory factory = new DiskFileItemFactory();
      factory.setSizeThreshold(maxMemSize);
      factory.setRepository(new File("c:\\temp"));
      ServletFileUpload upload = new ServletFileUpload(factory);
      upload.setSizeMax( maxFileSize );
      String content = "";
      String vision = "";
      String uploadFilePath = "";
      try{ 
         List fileItems = upload.parseRequest(request);
         Iterator i = fileItems.iterator();
         Iterator k = fileItems.iterator();
         int count = 0;
         while (k.hasNext()){
            FileItem fi = (FileItem)k.next();
            if (fi.isFormField()) {
                if (count == 0) {
                    content = new String(fi.getString().getBytes("ISO-8859-1"), "UTF-8");
                }
                if (count == 1) {
                    vision = fi.getString();
                }
                count++;
            }
         }
         while ( i.hasNext () ) {
            FileItem fi = (FileItem)i.next();
            if (!fi.isFormField () )  {
                String fieldName = fi.getFieldName();
                String fileName = new String(fi.getName().getBytes("ISO-8859-1"), "UTF-8");
                boolean isInMemory = fi.isInMemory();
                long sizeInBytes = fi.getSize();
                file = new File( filePath + "/" + fileName);
                uploadFilePath = "publicationFiles/" + fileName;
                fi.write( file ) ;
            }
         }
         Publication pub;
         if (vision.equals("")){
            request.setAttribute("info","You have to select the vision of publication!");
%>
         <jsp:forward page="<%=url%>"/>    
<%            
         }
         if (!content.equals("")){
             pub = new Publication(activeUser.getUserid(),teamid,content,uploadFilePath,new Timestamp(System.currentTimeMillis()),0,vision);
         } else {
             pub = new Publication(activeUser.getUserid(),teamid,null,uploadFilePath,new Timestamp(System.currentTimeMillis()),0,vision);
         }
         PublicationDAO pubdao = new PublicationDAO();
         String message = pubdao.post(pub);
         request.setAttribute("info", message);
%>
         <jsp:forward page="<%=url%>"/>          
<%   
         }catch(Exception e) {
            if (!content.equals("")){
                if (vision.equals("")){
                    request.setAttribute("info","You have to select the vision of publication!");
%>              
                    <jsp:forward page="<%=url%>"/>    
<%            
                }
                Publication pub = new Publication(activeUser.getUserid(),teamid,content,null,new Timestamp(System.currentTimeMillis()),0,vision);
                PublicationDAO pubdao = new PublicationDAO();
                String message = pubdao.post(pub);
                request.setAttribute("info", message);
%>
                <jsp:forward page="<%=url%>"/>
<%
            } else {
                request.setAttribute("info","You did not post anything!");
%>  
                <jsp:forward page="<%=url%>"/>
<%
            }
         }        
    } else {
        request.setAttribute("info","Wrong");
%>
        <jsp:forward page="<%=url%>"/>          
<%
    }
%>
