package model.dataroom;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletContext;
import javax.sql.DataSource;

//데이터베이스와 관련된  CRUD작업을 하는 로직을 갖고 있는 클래스
public class DataRoomDAO {

	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;

	//톰캣이 만들어 놓은 커넥션을 커넥션 풀에서 가져다 쓰기
	public DataRoomDAO(ServletContext context) {
		try{
			Context ctx = new InitialContext();
			DataSource source=(DataSource)ctx.lookup(context.getInitParameter("TOMCAT_JNDI_ROOT")+"/jdbc/mvc");
			conn=source.getConnection();

		}catch(NamingException e){e.printStackTrace();
		}catch(SQLException e){e.printStackTrace();}
	}//////생성자
	//자원반납용-사용한 커넥션 객체를 다시 풀에 반납
	public void close(){
		try{
			//메모리 해제
			if(rs != null) rs.close();
			if(ps != null) ps.close();
			//커넥션 풀에 커넥션 객체 반납-메모리 해제X
			if(conn != null) conn.close();
		}catch(Exception e){e.printStackTrace();}
	}/////////close()

	/*
	 * 페이징 순서]
	 * 1.전체 목록용 쿼리를 구간쿼리로 변경
	 * 2.전체 레코드 수 얻기용 메소드 추가
	 * 3.페이징 로직을 리스트 컨트롤러에 추가
	 * 4.리스트.jsp페이지에 결과값 출력
	 */
	
	//전체목록용]
	public List selectList(int start, int end){
		List list = new Vector();
		String sql="SELECT * FROM (SELECT T.*, ROWNUM R FROM (SELECT * FROM DATAROOM ORDER BY NO DESC) T) WHERE R BETWEEN ? AND ?";
		try{
			ps = conn.prepareStatement(sql);
			ps.setInt(1, start);
			ps.setInt(2, end);
			rs = ps.executeQuery();
			while(rs.next()){
				DataRoomDTO dto = new DataRoomDTO();
				
				dto.setNo(rs.getString(1));
				dto.setName(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setPass(rs.getString(4));
				dto.setContent(rs.getString(5));
				dto.setDowncount(rs.getString(6));
				dto.setAttachedfile(rs.getString(7));
				dto.setPostdate(rs.getDate(8));
				
				list.add(dto);
			}
		}catch(SQLException e){ e.printStackTrace(); }
		
		return list;
	}////////selectList()
	
	//총 레코드 수 얻기용]
	public int getTotalRecordCount(){
		int total = 0;
		String sql="SELECT COUNT(*) FROM DATAROOM";
		
		try {
			ps=conn.prepareStatement(sql);
			rs = ps.executeQuery();
			rs.next();
			total = rs.getInt(1);			
			
		} catch (SQLException e) {	e.printStackTrace();	}
		
		return total;
	}
	
	
	public int insert(DataRoomDTO dto) {
		int affected=0;
		String sql = "INSERT INTO DATAROOM VALUES(SEQ_DATAROOM.NEXTVAL,?,?,?,?,DEFAULT,?,DEFAULT)";
		try{
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getName());
			ps.setString(2, dto.getTitle());
			ps.setString(3, dto.getPass());
			ps.setString(4, dto.getContent());
			ps.setString(5, dto.getAttachedfile());
			
			affected = ps.executeUpdate();
			
		}catch(SQLException e){e.printStackTrace();}
		
		return affected;
	}//////insert()
	
	public DataRoomDTO selectOne(String no) {
		DataRoomDTO dto = null;
		String sql = "SELECT * FROM DATAROOM WHERE no=?";
		try{
			ps = conn.prepareStatement(sql);
			ps.setString(1, no);
			
			rs = ps.executeQuery();
			if(rs.next()){
				dto = new DataRoomDTO();
				dto.setAttachedfile(rs.getString(7));
				dto.setContent(rs.getString(5));
				dto.setDowncount(rs.getString(6));
				dto.setName(rs.getString(2));
				dto.setNo(rs.getString(1));
				dto.setPass(rs.getString(4));
				dto.setPostdate(rs.getDate(8));
				dto.setTitle(rs.getString(3));
			}
			
		}catch(SQLException e){e.printStackTrace();}
		
		
		return dto;
	}////////selectOne()
	
	public boolean isCorrectPassword(String no, String pass) {
		boolean isCorrect = false;
		String sql="SELECT COUNT(*) FROM DATAROOM WHERE no=? AND pass=?";
		try{
			ps = conn.prepareCall(sql);
			ps.setString(1, no);
			ps.setString(2, pass);
			rs = ps.executeQuery();
			rs.next();
			if(rs.getInt(1)==1) isCorrect = true;
			
			
		}catch(SQLException e){e.printStackTrace();}
	
		return isCorrect;
	}///////////isCorrectPassword()
		
	public int update(DataRoomDTO dto) {
		int affected=0;
		String sql="UPDATE DATAROOM set name=?, title=?,content=?, pass=?, attachedfile=? WHERE no=?";
		try{
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, dto.getName());
			ps.setString(2, dto.getTitle());
			ps.setString(4, dto.getPass());
			ps.setString(3, dto.getContent());
			ps.setString(5, dto.getAttachedfile());
			ps.setString(6, dto.getNo());
			
			affected = ps.executeUpdate();
			
		}catch(SQLException e){e.printStackTrace();}
		
		return affected;
	}//////update()
	
	public int delete(String no) {
		int affected=0;
		String sql="DELETE DATAROOM  WHERE no=?";
		try{
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, no);
						
			affected = ps.executeUpdate();
			
		}catch(SQLException e){e.printStackTrace();}
		
		return affected;
	}////////delete()
	
	public void updateDownCount(String no) {
		String sql="UPDATE DATAROOM SET DOWNCOUNT=DOWNCOUNT+1 WHERE no=?";
		try{
			ps=conn.prepareStatement(sql);
			ps.setString(1, no);
			
			ps.executeUpdate();
		}catch(SQLException e){e.printStackTrace();}
		
	}///////updateDownCount()
	
}///////DataRoomDAO