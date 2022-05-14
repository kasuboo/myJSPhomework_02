<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="mybean.data.DeleteAndEdit" %>
<%@page import="mybean.data.workerBean" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <%
      DeleteAndEdit de=new DeleteAndEdit();
      de.deleteWorker(request.getParameter("name"));
   %>
   <jsp:forward page="workerInfos.jsp"></jsp:forward>
   
</body>
</html>
