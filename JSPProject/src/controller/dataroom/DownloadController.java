package controller.dataroom;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dataroom.DataRoomDAO;
import model.dataroom.FileUtils;

public class DownloadController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String filename = req.getParameter("filename");
		String no = req.getParameter("no");
		//다운로드관련 모델 호출
		//1.파일다운로드 로직 호출
		FileUtils.download(req,resp,"/Upload",filename);
		//다운로드 수 조회용
		DataRoomDAO dao = new DataRoomDAO(req.getServletContext());
		dao.updateDownCount(no);
		dao.close();
		
		
		
	}
	
	
}
