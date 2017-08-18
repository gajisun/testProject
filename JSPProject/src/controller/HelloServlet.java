package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HelloServlet extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//리퀘스트 영역에 데이터 저장
		req.setAttribute("message", "Servlet Success!!!");
		//서블릿 초기화(나중에)
		
		//포워드]
		req.getRequestDispatcher("/HelloWorld.jsp").forward(req, resp);

	}
}
