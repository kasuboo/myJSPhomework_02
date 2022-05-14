package mybean.data;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.sql.*;
import java.util.*;
public class DeleteAndEdit {
	public void deleteWorker(String names) throws Exception {
		Class.forName("com.mysql.jdbc.Driver"); //载入数据库驱动
		String Url="jdbc:mysql://localhost:3306/site?serverTimezone=UTC&characterEncoding=utf-8"; //数据库
		String userName="test"; //登陆用户
		String userPass="123456";
		Connection con=DriverManager.getConnection(Url,userName,userPass);
		Statement st=con.createStatement(); //用于发送sql语句
		
		String Sql=""; //查询数据库属性
		Sql="delete from workerinfo where workerName=?";
		PreparedStatement pt=con.prepareStatement(Sql);
		pt.setString(1, names);
		pt.executeUpdate();
		
		pt.close();
		st.close();
		con.close();
	}	
}
