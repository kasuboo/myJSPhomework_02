package mybean.data;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.sql.*;
import java.util.*;
public class ShowList {
	public List<workerBean> ShowAll() throws Exception
	{
		Class.forName("com.mysql.jdbc.Driver"); //载入数据库驱动
		String Url="jdbc:mysql://localhost:3306/site?serverTimezone=UTC&characterEncoding=utf-8"; //数据库
		String userName="test"; //登陆用户
		String userPass="123456";
		
		List<workerBean> list=new ArrayList<workerBean>();
		Connection con=DriverManager.getConnection(Url,userName,userPass);
		Statement st=con.createStatement(); //用于发送sql语句
		String Sql=""; //查询数据库属性
		Sql="select * from workerinfo";
		ResultSet rs=st.executeQuery(Sql); //执行statement对象	
		while(rs.next()) {
			workerBean wk=new workerBean(); //创建对象
			wk.setSitename(rs.getString("siteName")); 
			wk.setWorkername(rs.getString("workerName"));
			wk.setWorkercode(rs.getString("workerCode"));
			wk.setWorkerbirthday(rs.getString("workerBirthday"));
			wk.setRegistertime(rs.getString("registerTime"));
			list.add(wk); //添加到列表中
		}
		rs.close();
		st.close();
		con.close();	
		return list;
	}
}
