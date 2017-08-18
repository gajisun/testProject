package controller.dataroom;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import model.dataroom.DataRoomDAO;
import model.dataroom.DataRoomDTO;
import model.dataroom.FileUtils;

public class EditController extends HttpServlet{

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//요청분석]
		if(req.getMethod().toUpperCase().equals("GET")){//수정
			String no = req.getParameter("no");
			DataRoomDAO dao = new DataRoomDAO(req.getServletContext());
			DataRoomDTO dto = dao.selectOne(no);

			dao.close();

			req.setAttribute("dto", dto);

			req.getRequestDispatcher("/DataRoom_13/Edit.jsp").forward(req, resp);
		}
		else{//수정처리
			req.setCharacterEncoding("UTF-8");
			
			MultipartRequest mr=FileUtils.upload(req, req.getServletContext().getRealPath("/Upload"));
			
			int sucOrFail=0;//DB수정 성공시에는 1, 실패시에는 0, 파일용량 초과시에는 -1
			
			if(mr != null){
				String no = mr.getParameter("no");
				//파라미터로 전달된 값들을 MultipartRequest가 가로채서 
				//상세보기로 이동하기 위해 영역에 키값 저장]
				req.setAttribute("no", no);
				
				String title = mr.getParameter("title");
				String name = mr.getParameter("name");
				String pass = mr.getParameter("pass");
				String content = mr.getParameter("content");
				String attachedfile = mr.getFilesystemName("attachedfile");
				
				//데이터베이스 CRUD작업과 관련된 모델 호출] 
				DataRoomDAO dao = new DataRoomDAO(req.getServletContext());
				//dao.update(no);
				
				if(attachedfile==null){//파일미교체
					attachedfile = mr.getParameter("originalName");
				}
					DataRoomDTO dto = new DataRoomDTO();
					dto.setName(name);
					dto.setPass(pass);
					dto.setContent(content);
					dto.setNo(no);
					dto.setTitle(title);
					dto.setAttachedfile(attachedfile);
					
					sucOrFail=dao.update(dto);
					//DB업데이트 성공 및 파일 교체시 기존 업로드된 파일 삭제
					if(sucOrFail==1 && mr.getFilesystemName("attachedfile")!=null){
						//기존 업로드 파일 삭제
						FileUtils.delete(req, "/Upload", mr.getParameter("originalName"));
						
					}
			dao.close();					
			}////파일업로드 성공
					
			////파일용량 초과
			else sucOrFail=-1;
				
			//리퀘스트 영역에 결과값 혹은 필요한 값 저장
			//DB성공 여부 및 파일용량 초과 판단용 속성 저장
			req.setAttribute("SUC_FAIL", sucOrFail);
			req.setAttribute("THISIS", "UPD");
			
			req.getRequestDispatcher("/DataRoom_13/Message.jsp").forward(req, resp);
		}
		
	}
}
