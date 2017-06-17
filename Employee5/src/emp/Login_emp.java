package emp;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
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



/**
 * Servlet implementation class Login_emp
 */
/*@WebServlet("/Login_emp")*/
public class Login_emp extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 Connection conn=null;
	 	ResultSet rs=null;
	 	PreparedStatement ps=null;
	 	connector con=new connector();
	    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login_emp() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out=response.getWriter();
		try
		{
			
			conn=con.getCon();
			System.out.println("Connection id=:2"+conn);
					
			 String user=request.getParameter("user");
			 String password=request.getParameter("password");
			 System.out.println(user);
			 System.out.println(password);
			 ps=conn.prepareStatement("select * from emp123 where user=? and password=?");
				ps.setString(1,user);
				ps.setString(2,password);
				
				System.out.println("Connection id bfore executequery=:2"+conn);
				rs=ps.executeQuery();
				
				
				
				if(rs.next())
				{
			//	HttpSession session=request.getSession();
			 //   session.setAttribute("Login_emp",user);
					System.out.println("hii");
					
				    RequestDispatcher rd=request.getRequestDispatcher("view.jsp");
			        rd.forward(request,response);
				 }
				
				
				
				
					else
					{
					out.println("<b>Invalid user and password !</b><br>");
					out.println("<a href='log.jsp'>login again</a>" );
					}
				
				

			//	rs.close();
			//	ps.close();
	
				
				
				
			 
		}
		catch(SQLException s)
		{
			s.printStackTrace();
			
		} finally {
	
			if(rs!=null)
			con.closeRS(rs);
			if(ps!=null)
			con.closePstmt(ps);
			if(conn!=null)
			con.closeConnection(conn);
	}
		
	}
	
	

	 
	 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
