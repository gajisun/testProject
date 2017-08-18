package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class setContentType extends HttpServlet{
	// JSP에서 페이지 이동 안하고 서블릿에서 웹브라우저로 직접 출력]
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//컨텐츠 타입 응답헤더에 설정]
		resp.setContentType("text/html; charset=UTF-8");
		//웹브라우저로 출력하기위한 출력 스트림 생성]
		PrintWriter out = resp.getWriter();
		//웹브라우저 출력]
		out.println("<!DOCTYPE html>");
		out.println("<html>");
		out.println("<head>");
		out.println("<title>서블릿에서 직접 출력</title>");
		out.println("<meta charset='UTF-8'>");
		out.println("<body>");
		out.println("<h2>서블릿입니다.</h2>");
		out.println("</body>");
		out.println("</head>");
		out.println("</html>");
		
		out.close();
	}
	
}
