package mimemi.mvc.util;

import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;



/**
 * DB연동을 위한 로드, 연결, 닫기 기능 클래스
 * */
public class DbUtil {
	static DataSource ds;
	
    /**
     * 로드
     * */
	static {
		try {
		  Context initContext = new InitialContext();
		  ds = (DataSource)initContext.lookup("java:/comp/env/jdbc/myoracle");
		  
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 연결
	 * */
	public static Connection getConnection() throws SQLException{
		return  ds.getConnection();
	} 
	
	/**
	 * 닫기 (insert, update ,delete 인경우 )
	 * */
	public static void dbClose(Statement st, Connection con){
		try {
		  if(st!=null) st.close();
		  if(con!=null) con.close();
		}catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 닫기(select 인경우)
	 * */
    public static void dbClose(ResultSet rs , Statement st, Connection con){
    	try {
		  if(rs!=null)rs.close();
		  dbClose(st, con);
    	}catch (SQLException e) {
			e.printStackTrace();
		}
	}
}








