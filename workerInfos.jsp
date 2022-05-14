<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.*,java.util.*"%>
<%@page import="java.sql.*" %>
<%@page import="mybean.data.workerBean" %>
<%@page import="mybean.data.ShowList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MysqlWork</title>
</head>
<body>
   <div>
       <form method="post" action="searchServlet" id="myform">
         <fieldset>
            <legend>查询条件</legend>
            工地名称:<input type="text" name="placeName">&nbsp&nbsp&nbsp工人姓名:<input type="text" name="WorkerName"> 
            &nbsp&nbsp&nbsp<input type="submit" value="查询" > &nbsp&nbsp<input type="submit" value="新增" >
            <input type="text" style="display:none" name="index" id="index"/>
         </fieldset>
       </form>  
   </div>
   <div>
      <table border="1">
         <tr><td>工人姓名</td><td>工人编码</td><td>工地名称</td><td>工人生日</td><td>注册时间</td><td>操作</td></tr>  
         <%
            //获取信息
            List<workerBean> list=new ArrayList<workerBean>(); //显示查询信息           
            list=(List<workerBean>)request.getAttribute("list");
            List<workerBean> lists=new ArrayList<workerBean>(); //显示所有信息
            ShowList sl=new ShowList();
            lists=sl.ShowAll();
            if(list!=null){
            for(workerBean wk:list)
            {       
           %>
             <tr>
        	    <td><%=wk.getWorkername() %></td>
        	    <td><%=wk.getWorkercode() %></td>
        	    <td><%=wk.getSitename() %></td>
        	    <td><%=wk.getWorkerbirthday() %></td>
        	    <td><%=wk.getRegistertime() %></td>
        	    <td><a href="#">修改</a>&nbsp&nbsp<a onclick="deleteW(this)" href="#">删除</a></td>
             </tr>
            <%
            }}
            else if(list==null){
            	for(workerBean wks:lists)
            	{ %>
            		<tr>
        	          <td><%=wks.getWorkername() %></td>
        	          <td><%=wks.getWorkercode() %></td>
        	          <td><%=wks.getSitename() %></td>
        	          <td><%=wks.getWorkerbirthday() %></td>
        	          <td><%=wks.getRegistertime() %></td>
        	          <td><a href="#">修改</a>&nbsp&nbsp<a onclick="deleteW(this)" href="#">删除</a></td>
                   </tr>
            	<%}
            }
         %>
    
      </table>  
   </div>   
</body>
<script type="text/javascript">
   function deleteW(el)
   {
	   var isT; 
	   isT=confirm("确定要删除吗?");
	   if(isT==true)
	   {
		   var tr2=el.parentNode.parentNode;
		   var cells=tr2.cells; //获取单元格数
		   var NL=cells[0].innerText; 
		   document.getElementById('index').value=NL; //赋值,用于传值
		   var fr=document.getElementById("myform");
		   fr.action="doDelete.jsp";
		   fr.method="post";
		   fr.submit();
	   }
   }

</script>

</html>
