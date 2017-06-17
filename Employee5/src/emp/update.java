package emp;

import java.io.IOException;
import java.sql.Connection;


import java.sql.SQLException;

import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.PreparedStatement;

/**
 * Servlet implementation class update
 */
/*@WebServlet("/update")*/
public class update extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    Connection conn=null;
	PreparedStatement ps=null;
	connector con=new connector();
	
	
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public update() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int id=Integer.parseInt(request.getParameter("id"));
		System.out.println(id);
		String name=request.getParameter("name");
		System.out.println(name);
		String designation=request.getParameter("designation");
		System.out.println(designation);
		String mob_no=request.getParameter("mob_no");
        System.out.println(mob_no);      
		try
		{
			conn=con.getCon();
			ps=conn.prepareStatement("update employee2 SET id=?,name=?,designation=?,mob_no=? where id="+id);
			ps.setInt(1,id);
			ps.setString(2,name);
			ps.setString(3,designation);
			ps.setString(4,mob_no);
			ps.executeUpdate();
			
			
			
			
		}
		catch(Exception se)
		{
			se.printStackTrace();
		}finally {
			if(ps!=null)
			con.closePstmt(ps);
			if(conn!=null)
			con.closeConnection(conn);
		}
		
		RequestDispatcher view=request.getRequestDispatcher("view.jsp");
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}