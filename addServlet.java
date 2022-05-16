package myservlet;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mybean.data.Add;
import mybean.data.workerBean;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
public class addServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String sn=request.getParameter("sites");
		String da=request.getParameter("date");
		String wc=request.getParameter("workercodes");
		String wn=request.getParameter("workernames");
		String se=request.getParameter("sexs");
		String wb=request.getParameter("workerbirth");
		String ph=request.getParameter("phone");
		String dr=request.getParameter("dress");
		String jo=request.getParameter("jobs");
		String po=request.getParameter("positions");
		
		int i=1;
		Add a=new Add();
		try {
			i=a.isYes(wc);			
		} catch (Exception e) {}
		
		Add ad=new Add();
		ad.myAdd(sn,da,wc,wn,se,wb,ph,dr,jo,po);
		
		if(i==1)
		{
			RequestDispatcher dis=request.getRequestDispatcher("workerInfos.jsp");
	        dis.forward(request,response); 
		}
		else if(i==0) //如果编号重复，弹出提示
		{
			RequestDispatcher dis=request.getRequestDispatcher("errorPage.jsp");
	        dis.forward(request,response); 
		}
	}
}


