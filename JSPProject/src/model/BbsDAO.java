package model;
/*
 * DAO(Data Access Object):데이터에 접근해서 CRUD작업을 수행하는 업무처리 로직
 */

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletContext;
import javax.sql.DataSource;

public class BbsDAO {
	private Connection conn;
	private ResultSet rs;
	private PreparedStatement psmt;
	
	//public BbsDAO(ServletContext context, JspWriter out) { 원래는 이렇게하는게 맞지만 굳이 OUT필요없음
	public BbsDAO(ServletContext context) {
		/* 커넥션 풀 미 사용-커넥션 객체 메모리에 직접 생성 코드
		try {
			//드라이버 로딩
			Class.forName(context.getInitParameter("ORACLE_DRIVER"));
			//DB연결
			conn=DriverManager.getConnection(context.getInitParameter("ORACLE_URL"),"JSP","JSP");
			
		} catch (Exception e) {
			//try {
			//	out.println("데이터베이스 연결 실패");
			//} catch (IOException e1) {	e1.printStackTrace();	}
			e.printStackTrace();
		}
		*/
		//커텍션 풀 사용:톰캣이 생성해 놓은 커넥션객체 풀에서 가져다 쓰기(7/17)
		try {
			InitialContext ctx = new InitialContext();
			DataSource source=(DataSource)ctx.lookup(context.getInitParameter("TOMCAT_JNDI_ROOT")+"/jdbc/myoracle");
			conn = source.getConnection();
		} catch (NamingException e) {
			e.printStackTrace();
		} catch(SQLException e){
			e.printStackTrace();
		}
		
	}////////생성자
	
	public void close(){
		try{
			if(rs != null) rs.close();
			if(psmt != null) psmt.close();
			if(conn != null) conn.close();
		}catch(Exception e){ e.printStackTrace(); }
	}
	
	public boolean isMember(String id,String pwd){
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
		return true;
	}
	//전체목록 가져오기
	public List <BbsDTO> selectList(Map<String, Object> map){
		
		List <BbsDTO> records = new Vector<BbsDTO>();
		//페이징 미적용
		//String sql = "SELECT b.*,m.name FROM bbs b JOIN member m ON b.id=m.id ORDER BY NO DESC";
		//페이징 적용-구간쿼리로 변경
		String sql="SELECT * FROM (SELECT T.*, ROWNUM R FROM (SELECT b.*,m.name FROM bbs b JOIN member m ON b.id=m.id";
		
		//검색용 쿼리 추가
		if(map.get("searchWord") != null){
			sql+=" WHERE "+map.get("searchColumn")+" LIKE '%"+map.get("searchWord")+"%'";
		}
		
		sql += " ORDER BY NO DESC) T) WHERE R BETWEEN ? AND ?";
			
		try {
			psmt=conn.prepareStatement(sql);
			
			//페이징을 위한 시작 및 종료 rownum설정
			psmt.setInt(1, Integer.parseInt(map.get("start").toString()));
			psmt.setInt(2, Integer.parseInt(map.get("end").toString()));
			
			rs=psmt.executeQuery();
			
			
			while(rs.next()){
				BbsDTO dto = new BbsDTO(
						rs.getString(1),
						rs.getString(2),
						rs.getString(3),
						rs.getString(4),
						rs.getString(5),
						rs.getDate(6)
						);
				dto.setName(rs.getString(7));
				records.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return records;
	}
	//전체레코드 수 얻기
	public int getTotalRecordCount(Map<String,Object> map){
		int totalRecord=0;
		String sql="SELECT COUNT(*) FROM bbs b JOIN member m ON b.id=m.id";

		//검색쿼리 추가
		if(map.get("searchWord") != null){
			sql+=" WHERE "+map.get("searchColumn")+" LIKE '%"+map.get("searchWord")+"%'";
		}
		try {
			psmt = conn.prepareStatement(sql);

			rs=psmt.executeQuery();
			rs.next();
			totalRecord = rs.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return totalRecord;
	}	
	//입력
	public int insert(BbsDTO dto){
		int affected=0;
		String sql="INSERT INTO bbs(no, id, title,content) values(bbs_seq.nextval,?,?,?)";
		try {
			psmt=conn.prepareStatement(sql);
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getContent());
			
			affected = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return affected;
	}
	//상세보기
	public BbsDTO selectOne(String num){
		BbsDTO resultDTO = null;//new BbsDTO();
		String sql = "SELECT b.*,m.name FROM bbs b JOIN member m ON b.id=m.id WHERE no=?";
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, Integer.parseInt(num));
			rs = psmt.executeQuery();
			
			if(rs.next()){
				resultDTO = new BbsDTO(
						rs.getString(1), rs.getString(2),rs.getString(3),rs.getString(4),
						rs.getString(5),rs.getDate(6));
				resultDTO.setName(rs.getString(7));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return resultDTO;
	}
	//조회수 증가
	public void updateVisitCount(String num){

		String sql = "UPDATE bbs SET visitcount=visitcount+1 WHERE no=?";
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, Integer.parseInt(num));
			psmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	//이전글 다음글
	public Map<String,BbsDTO> preNnext(String num){
		Map<String,BbsDTO> map = new HashMap<String,BbsDTO>();
		//이전글 구하기
		String sql="SELECT no, title FROM bbs WHERE NO=(SELECT MIN(no) FROM bbs WHERE no>?)";
		try {
			psmt=conn.prepareStatement(sql);
			psmt.setString(1, num);
			rs=psmt.executeQuery();
			if(rs.next()){//이전글 존재
				map.put("PREV", new BbsDTO(rs.getString(1),null,rs.getString(2),null,null,null));
			}
			//다음글 구하기
			sql="SELECT no, title FROM bbs WHERE NO=(SELECT MAX(no) FROM bbs WHERE no<?)";
			psmt=conn.prepareStatement(sql);
			psmt.setString(1, num);
			rs=psmt.executeQuery();
			if(rs.next()){//다음글 존재
				map.put("NEXT", new BbsDTO(rs.getString(1),null,rs.getString(2),null,null,null));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return map;
	}
	//수정
	public int update(BbsDTO dto){
		int affected=0;
		String sql="UPDATE bbs set title=?,content=? WHERE no=?";
		try {
			psmt=conn.prepareStatement(sql);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getNo());
			
			affected = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return affected;
	}
	//삭제
	public int delete(String no){
		int affected=0;
		String sql="DELETE FROM bbs WHERE no=?";
		try {
			psmt=conn.prepareStatement(sql);
			psmt.setString(1, no);
			
			affected = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return affected;
	}
	
	
}
