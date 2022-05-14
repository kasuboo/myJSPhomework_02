package myservlet;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.*;
import java.sql.*;
import java.util.*;
import mybean.data.workerBean;
public class searchServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//获取用户传来的参数
		String place=request.getParameter("placeName"); //工地名称
		String WN=request.getParameter("WorkerName");
		//查询数据库获取参数
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
			Sql="select * from workerinfo where workerName like'%"+WN+"%'";
		}	
		ResultSet rs=st.executeQuery(Sql); //执行statement对象		
		List<workerBean> list=new ArrayList<workerBean>(); //list对象
		while(rs.next())
		{
			workerBean wk=new workerBean(); //创建对象
			wk.setSitename(rs.getString("siteName")); 
			wk.setWorkername(rs.getString("workerName"));
			wk.setWorkercode(rs.getString("workerCode"));
			wk.setWorkerbirthday(rs.getString("workerBirthday"));
			wk.setRegistertime(rs.getString("registerTime"));
			list.add(wk); //添加到列表中
		}
		request.setAttribute("list", list);
		
		rs.close();
		st.close();
		con.close();
		} catch (SQLException e) {}
		RequestDispatcher dis=request.getRequestDispatcher("workerInfos.jsp");
		dis.forward(request,response); 
	}

}





























