package eltag;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletContext;

import model.BbsDAO;

public class MyTagLibrary {
	//메소드는 public하고 static해야한다.
	public static boolean isNumber(String value){
		char[] values=value.toCharArray();
		for(char ch: values){
			if(!(ch >='0' && ch<='9')) return false;
		}
		return true;
	}///////////////isNumber
	//문]주민번호를 인자로 받아 남성인 경우 "남자" 여성인 경우 "여자"를 반환하는 메소드 정의
	//그리고 이를 tld파일에 정의하여라.
	public static String getGender(String ssn){
		if(ssn.split("-")[1].startsWith("1"))
			return "남자";
		else
			return "여자";	
		//return ssn.split("-")[1].startsWith("1")?"남자":"여자";
	}
		
	/*public static boolean isMember(String id, String pwd){
		Connection conn;
		ResultSet rs;
		PreparedStatement psmt;
		
		try {
			//드라이버 로딩
			Class.forName("oracle.jdbc.OracleDriver");
			//DB연결
			conn=DriverManager.getConnection("jdbc:oracle:thin://localhost:1521:orcl","JSP","JSP");
			
			String sql="SELECT COUNT(*) FROM member WHERE id=? AND pwd=?";
			try {
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, id);
				psmt.setString(2, pwd);
				
				rs = psmt.executeQuery();
				
				rs.next();
				if(rs.getInt(1)	!=	1)	return false;
				
			} catch (SQLException e) {
				e.printStackTrace();
				return false;
			}
			try{
				if(rs != null) rs.close();
				if(psmt != null) psmt.close();
				if(conn != null) conn.close();
			}catch(Exception e){ e.printStackTrace();	}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return true;		
	}*/
	//회원판단용
	public static boolean isMember(String id, String pwd, ServletContext context){
		BbsDAO dao = new BbsDAO(context);
		boolean flag=dao.isMember(id, pwd);
		dao.close();
		return flag;
	}
	//url인코딩용 메소드
	public static String urlEncoder(String name){
		String nameEncoding = null;
		
		try {
			nameEncoding = URLEncoder.encode(name, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return nameEncoding;
	}
	
}
