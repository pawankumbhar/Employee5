package emp;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import emp.connector;
import java.sql.PreparedStatement;

/**
 * Servlet implementation class Insert_emp
 */
/*@WebServlet("/Insert_emp")*/
public class Insert_emp extends HttpServlet {
	private static final long serialVersionUID = 1L;
	connector con=new connector();
	Connection conn=null;
	PreparedStatement ps;
	connector co=new connector();
	ResultSet rs;
       
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Insert_emp() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		String select=request.getParameter("s");
	
		
		if(select.equals("Add"))
		{
			try
			{
				int id=Integer.parseInt(request.getParameter("id"));
				String name=request.getParameter("name");
				String designation=request.getParameter("Designation");
				String mob_no=request.getParameter("Mob_no");
				conn=con.getCon();
				
				System.out.println(conn);
				ps=conn.prepareStatement("insert into employee2 values(?,?,?,?)");
				ps.setInt(1,id);
				ps.setString(2,name);
				ps.setString(3,designation);
				ps.setString(4,mob_no);
				ps.executeUpdate();
				HttpSession sess=request.getSession();
				sess.getAttribute("loggedin");
			  RequestDispatcher rd=request.getRequestDispatcher("view.jsp");
				rd.forward(request, response);
				
			}
			catch(Exception se)
			{
				se.printStackTrace();
			} finally {
				if(ps!=null)
				con.closePstmt(ps);
				if(conn!=null)
				con.closeConnection(conn);
			}
			
		}
		else if(select.equals("View"))
		{
			RequestDispatcher rd=request.getRequestDispatcher("view.jsp");
			rd.forward(request, response);
		}
		else if(select.equals("Serch"))
	{
			RequestDispatcher rd=request.getRequestDispatcher("search.jsp");
			rd.forward(request, response);
		}
		
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
