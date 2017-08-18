package controller.dataroom;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dataroom.DataRoomDAO;
import model.dataroom.DataRoomDTO;
import model.dataroom.FileUtils;

public class DeleteController extends HttpServlet{

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String no = req.getParameter("no");
		//레코드 삭제 성공 후 파일 삭제
		DataRoomDAO dao = new DataRoomDAO(req.getServletContext());
		
		DataRoomDTO dto = dao.selectOne(no);
		String original = dto.getAttachedfile();
		
		int sucOrFail = dao.delete(no);
		
		if(sucOrFail == 1){
			//레코드 삭제 성공시 업로드된 파일 삭제
			FileUtils.delete(req, "/Upload", original);
		}
		dao.close();
		//리퀘스트 영역에 데이터 저장]
		req.setAttribute("SUC_FAIL", sucOrFail);
		req.setAttribute("THISIS", "DEL");
		
		req.getRequestDispatcher("/DataRoom_13/Message.jsp").forward(req, resp);
	}
	
	
}
