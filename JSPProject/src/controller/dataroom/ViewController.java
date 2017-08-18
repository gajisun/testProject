package controller.dataroom;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dataroom.DataRoomDAO;
import model.dataroom.DataRoomDTO;

public class ViewController extends HttpServlet{

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//3]요청분석
		String no=req.getParameter("no");
		//4]모델 호출 및 결과값 받기
		DataRoomDAO dao = new DataRoomDAO(req.getServletContext());
		DataRoomDTO dto = dao.selectOne(no);
		dto.setContent(dto.getContent().replace("\r\n", "<br/>"));
		dao.close();
		
		//5]필요한 값 리퀘스트 영역에 저장
		req.setAttribute("dto", dto);
		req.setAttribute("THISIS", "UPD");
		//6]뷰 선택 후 포워딩
		req.getRequestDispatcher("/DataRoom_13/View.jsp").forward(req, resp);
	}
	
	
	
	
	
}
