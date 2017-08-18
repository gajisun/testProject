package controller.dataroom;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.PagingUtil;
import model.dataroom.DataRoomDAO;

//사용자 요청을 받을 수 있도록 서블릿 클래스로 만들기(컨트롤러 만들기)-HttpServlet으로 상속
public class ListController extends HttpServlet{
	/* 2]사용자 요청이 GET방식이면 doGet(), POST방식이면 doPost()오버라이딩
	   	★구분하지 않고 요청을 받으려면 service()를 오버라이딩 하거나 
	   	혹은 위의 두 메소드를 오버라이딩해서 한쪽메소드에서 받은 요청을 다른 쪽으로 전달하면 된다.
	예] 
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//여기서 컨트롤러(서블릿)이 할일 구현
	}
	*/
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//1)사용자 요청 받기
		//2)요청 분석
		//3)모델에서 필요한 로직 호출->결과값이 있음 받기
		DataRoomDAO dao = new DataRoomDAO(req.getServletContext());
		
		//페이징을 위한 로직시작]	
		//전체 레코드 수
		int totalRecordCount = dao.getTotalRecordCount();
		//페이지 사이즈
		int pageSize=Integer.valueOf(this.getInitParameter("PAGE_SIZE"));
		//블락 페이지
		int blockPage=Integer.parseInt(getInitParameter("BLOCK_PAGE"));
		//전체 페이지 수
		int totalPage=(int)Math.ceil((double)totalRecordCount/pageSize);
		//현재 페이지
		int nowPage=req.getParameter("nowPage")==null?1:Integer.parseInt(req.getParameter("nowPage"));
		//시작 및 끝
		int start= (nowPage-1)*pageSize+1;
		int end = nowPage*pageSize;
		//페이징을 위한 로직 끝]

		//페이징용 문자열 생성
		String pagingstring=PagingUtil.pagingText(totalRecordCount, pageSize, blockPage, nowPage, req.getServletContext().getContextPath()+"/DATAROOM/List.do?");
		
		List list=dao.selectList(start, end);
		
		dao.close();
		
		//4)결과값이 있으면 리퀘스트 영역에 저장
		req.setAttribute("list", list);
		req.setAttribute("pagingstring", pagingstring);
		req.setAttribute("nowPage", nowPage);
		req.setAttribute("totalPage", totalPage);
		req.setAttribute("totalRecordCount", totalRecordCount);
		req.setAttribute("pageSize", pageSize);
		
		//5)결과값을 뿌려주거나 이동할 뷰(JSP페이지) 선택후 포워딩
		//뷰 선택]
		RequestDispatcher dispatcher=req.getRequestDispatcher("/DataRoom_13/List.jsp");
		dispatcher.forward(req, resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
	
}
