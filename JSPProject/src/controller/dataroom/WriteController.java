package controller.dataroom;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import model.dataroom.DataRoomDAO;
import model.dataroom.DataRoomDTO;
import model.dataroom.FileUtils;

public class WriteController extends HttpServlet{
	/*
	@Override
	protected void service(HttpServletRequest arg0, HttpServletResponse arg1) throws ServletException, IOException {
		service(arg0, arg1);
		
		((HttpServletRequest)arg0).getMethod(); //get방식인지 post방식인지 알 수 있음
		
	}
	*/
	//입력 폼으로 이동]
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//요청분석-입력폼 요청
		//모델호출 및 결과값 받기
		//결과값이 있으면, 리퀘스트 영역에 저장
		//뷰 선택
		/*
		 * 절대경로 지정시 
		 * 포워딩:컨텍스트 루트 경로 미 포함
		 * 리다이렉트:컨텍스트 루트 경로 포함
		 * 단, server.xml에 Context태그의 path속성 값을 지울시에는 신경 쓸 필요 없다.
		 */
		//포워드
		req.getRequestDispatcher("/DataRoom_13/Write.jsp").forward(req, resp);
		
		//리다이렉트
		//resp.sendRedirect(req.getContextPath()+"/DataRoom_13/Write.jsp");
	}
	//입력처리 즉,파일 업로드 및 데이터 베이스 입력
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//req.setCharacterEncoding("UTF-8");
		//요청분석-입력처리 요청
		//모델 호출 및 결과값 받기
		//파일업로드와 관련된 모델(비지니스로직) 호출
		
		MultipartRequest mr=FileUtils.upload(req, req.getServletContext().getRealPath("/Upload"));
		//파일용량 초과시에도 입력폼이 지워지지 않도록
		DataRoomDTO dto=null;
		int sucOrFail;//DB입력 성공시에는 1, 실패시에는 0, 파일용량 초과시에는 -1
		
		if(mr != null){//파일업로드 성공시 DB입력처리
			//기타 파라미터 받아서 테이블에 입력 처리
			String name = mr.getParameter("name");
			String title = mr.getParameter("title");
			String pass = mr.getParameter("pass");
			String content = mr.getParameter("content");
			String attachedfile = mr.getFilesystemName("attachedfile");
			//데이터베이스 CRUD작업과 관련된 모델 호출]
			DataRoomDAO dao = new DataRoomDAO(req.getServletContext());
			dto = new DataRoomDTO(null, name, title, pass, content, null, attachedfile, null);
			
			sucOrFail=dao.insert(dto); 
			dao.close();
		}
		//용량초과
		else{	
			sucOrFail=-1;
			//mr로 전달받아야 하는데 mr이 null이기 때문에 새로 인스턴스화
			mr= new MultipartRequest(req, req.getServletContext().getRealPath("/Upload"), "UTF-8");
			
		}
		
		//리퀘스트 영역에 결과값 혹은 필요한 값 저장
		//DB입력 성공 여부 및 파일용량 초과 판단용 속성 저장
		req.setAttribute("SUC_FAIL", sucOrFail);
		//컨트롤러 구분용-입력:INS,수정:UPD,삭제:DEL
		req.setAttribute("THISIS", "INS");
		
		if(sucOrFail == 1){//입력 성공
			//★입력 후 바로목록으로 이동]-반드시 List.jsp가 아닌 List.do로
			req.getRequestDispatcher("/DATAROOM/List.do").forward(req, resp);
		}
		else{//입력실패 || 파일용량 초과
			/*방법1]
			req.setAttribute("errorMessage", sucOrFail==0?"입력실패": "파일용량 초과");
			String name = mr.getParameter("name");
			String title = mr.getParameter("title");
			String pass = mr.getParameter("pass");
			String content = mr.getParameter("content");
			String attachedfile = mr.getFilesystemName("attachedfile");
			
			dto = new DataRoomDTO(null, name, title, pass, content, null, attachedfile, null);
			req.setAttribute("dto", dto);
			req.getRequestDispatcher("/DataRoom_13/Write.jsp").forward(req, resp);
			*/
			//방법2] 이 방법이 가장 쉬움
			resp.setContentType("text/html; charset=UTF-8");
			PrintWriter out=resp.getWriter();
			out.println("<script>");
			String errorMessage=sucOrFail==0?"입력실패":"파일용량 초과";
			out.println("alert('"+errorMessage+"')");
			out.println("history.back();");
			out.println("</script>");
		}
				
		/*	자바스크립트로 입력성공시에는 "입력성공" 입력실패시에는 "입력실패"
		 *  용량초과시에는 "파일용량 초과"라는 메시지를 alert()로 띄운 후 
		 *  입력성공시에는 목록으로 실패시(용량초과 포함)에는 다시 입력페이지로 이동하여라.
		 */
		//답]-메세지를 자스로 뿌려주는 페이지로 포워딩
		//req.getRequestDispatcher("/DataRoom_13/Message.jsp").forward(req, resp);		
	}
}
