<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.*,java.util.*"%>
<%@page import="java.sql.*" %>
<%@page import="mybean.data.workerBean" %>
<%@page import="mybean.data.DaoT" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MysqlWork</title>
</head>
<body>
   <div>
       <form method="post" action="searchServlet">
         <fieldset>
            <legend>查询条件</legend>
            工地名称:<input type="text" name="placeName"> 工人姓名:<input type="text" name="WorkerName"> <input type="submit" value="查询" > 
         </fieldset>
       </form>  
   </div>
   <div>
      <table border="1">
         <tr><td>工人姓名</td><td>工人编码</td><td>工地名称</td><td>工人生日</td><td>注册时间</td><td>操作</td></tr>  
         <%
            //获取信息
            List<workerBean> list=new ArrayList<workerBean>();
            DaoT d=new DaoT();
            list=d.showAll();
            for(workerBean wk:list)
            {    
           %>
             <tr>
        	    <td><%=wk.getWorkername() %></td>
        	    <td><%=wk.getWorkercode() %></td>
        	    <td><%=wk.getSitename() %></td>
        	    <td><%=wk.getWorkerbirthday() %></td>
        	    <td><%=wk.getRegistertime() %></td>
        	    <td><a href="#">修改 删除</a></td>
             </tr>
            <%
            }
         %>
    
      </table>  
   </div>

   
</body>
</html>
