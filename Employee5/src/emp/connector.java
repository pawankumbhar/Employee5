package emp;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

/**
 * Servlet implementation class connector
 */

public class connector {
//	Connection conn;
//	Connection actual;
	DataSource ds;
	

	public void init() {
	
	   //String driver="org.postgresql.driver";
		 //String url="jdbc:mysql://localhost/emp_recd";
		 //String user="root";
		 //String password="redhat";
		// InitialContext initialContext;
	      
		 try {
			//initialContext=new InitialContext();
			//ds=(DataSource) initialContext.lookup("java:jboss/mysqlds");
			 
			 Context initContext = new InitialContext();
	            Context envContext = (Context) initContext.lookup("java:/comp/env");
	            ds = (DataSource) envContext.lookup("jdbc/mysqlds");
	    //    Connection conn= ds.getConnection();
	           //  actual = ((javax.sql.PooledConnection)conn).getConnection();
	         //   System.out.println("Datasource value:------------"+conn+":::::::::"+actual);
	            
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
	
	
	public Connection getCon()
	{
		Connection conn=null;
		if ( ds == null)
		{

			init();
  	}
	try 
	{
		//System.out.println("Connection value:-------"+conn);
   		if (conn == null)
   		{   			
   		//	System.out.println("Connection value from DS:-------"+ds);
		conn = ds.getConnection();
			//	System.out.println("Connection value from DS:-------"+conn);
  	 }
	}catch (Exception sqle)
	{
			sqle.printStackTrace();
	}		
		return conn;
	}
	
	
	 public void closeConnection(Connection con) 
	 {
         if(con!=null)
             {
               try
               {
                    con.close();
                    
                  }
                catch(Exception e)
                 {
                    e.printStackTrace();
                 }
                finally
                 {
                    if(con!=null)
                     {
                        try{   con.close();  
                        }
                        catch(Exception ee)
                        {  
                        	ee.printStackTrace();
                        	}
                    }
                 }
           }
    }
	 
	 public void closePstmt(PreparedStatement pstmt)
	 {
         if(pstmt!=null)
             {
               try{
                    pstmt.close();
                    
                  }
                catch(Exception e)
                 {
                    e.printStackTrace();
                 }
                finally
                 {
                    if(pstmt!=null)
                     {
                        try
                        {  
                        	pstmt.close();  
                        	}
                        catch(Exception ee){  ee.printStackTrace(); }
                    }
                 }
           }
    }
	 
	 public void closestmt(Statement stmt) 
	 {
         if(stmt!=null)
             {
               try{
                    stmt.close();
                    
                  }
                catch(Exception e)
                 {
                    e.printStackTrace();
                 }
                finally
                 {
                    if(stmt!=null)
                     {
                        try
                        {  
                        	stmt.close();  
                        	}
                        catch(Exception ee){  ee.printStackTrace(); }
                    }
                 }
           }
    }

	 public void closeRS(ResultSet rs)
	 {
         if(rs!=null)
             {
               try{
                    rs.close();
                    
                  }
                catch(Exception e)
                 {
                    e.printStackTrace();
                 }
                finally
                 {
                    if(rs!=null)
                     {
                        try
                        {  
                        	rs.close();  
                        	}
                        catch(Exception ee){  ee.printStackTrace(); }
                    }
                 }
           }

	 }
}