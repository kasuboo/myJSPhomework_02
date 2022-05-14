<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*"%>
<%@page import="java.sql.*" %>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MysqlWork</title>
</head>
<body>
   <div>
       <form method="post" action="workerInfos.jsp">
         <fieldset>
            <legend>查询条件</legend>
            工地名称:<input type="text" name="placeName"> 工人姓名:<input type="text" name="WorkerName"> <input type="submit" value="查询" > 
         </fieldset>
       </form>  
   </div>
   
   <%
      request.setCharacterEncoding("utf-8");
      //获取查询传递参数
      String place=request.getParameter("placeName");
      String WN=request.getParameter("WorkerName");
      //查询数据库
      try {
		  Class.forName("com.mysql.jdbc.Driver"); //载入数据库驱动
	  } catch (ClassNotFoundException e) {}
	  String Url="jdbc:mysql://localhost:3306/site?useSSL=false&serverTimezone=CST&characterEncoding=utf-8"; //数据库
	  String userName="test"; //登陆用户
	  String userPass="123456";
	  try {
		  Connection con=DriverManager.getConnection(Url,userName,userPass);
		  Statement st=con.createStatement(); //用于发送sql语句
		  String Sql=""; //查询数据库属性
		  if(place!=null||WN!=null)
		  {
			  Sql="select siteName,workerCode,workerName,workerSex,workerBirthday,workerAddress,workerPhone,workerJob,workerPosition,registerTime from workerinfo";
		  }	
		  ResultSet rs=st.executeQuery(Sql); //执行statement对象			
	  
    %>
   <div>
      <table border="1">
         <tr><td>工人姓名</td><td>工人编码</td><td>工地名称</td><td>工人生日</td><td>注册时间</td><td>操作</td></tr>
    <%
        while(rs.next())
        {        
           if(rs.getString("siteName")==place && place!=null && WN==null) //按照工地名称查询
           {%>
             <tr>
        	    <td><%=rs.getString("workerName") %></td>
        	    <td><%=rs.getString("workerCode") %></td>
        	    <td><%=rs.getString("siteName") %></td>
        	    <td><%=rs.getString("workerBirthday") %></td>
        	    <td><%=rs.getString("registerTime") %></td>
        	    <td><a href="#">修改 删除</a></td>
             </tr>
         <%} 
           else if(rs.getString("workerName")==WN && WN!=null && place==null) //按照工人名称查询
           {%>
        	 <tr>
        	    <td><%=rs.getString("workerName") %></td>
        	    <td><%=rs.getString("workerCode") %></td>
        	    <td><%=rs.getString("siteName") %></td>
        	    <td><%=rs.getString("workerBirthday") %></td>
        	    <td><%=rs.getString("registerTime") %></td>
        	    <td><a href="#">修改 删除</a></td>
             </tr>
           <%}
           else if(rs.getString("workerName")==WN && WN!=null && rs.getString("siteName")==place && place!=null) //按照工人名称和工地名称查询
           {%>
        	 <tr>
        	    <td><%=rs.getString("workerName") %></td>
        	    <td><%=rs.getString("workerCode") %></td>
        	    <td><%=rs.getString("siteName") %></td>
        	    <td><%=rs.getString("workerBirthday") %></td>
        	    <td><%=rs.getString("registerTime") %></td>
        	    <td><a href="#">修改 删除</a></td>
             </tr>
           <%}
         }
	   } catch (SQLException e) {}
	  %>
      
      </table>  
   </div>

   
</body>
</html>
