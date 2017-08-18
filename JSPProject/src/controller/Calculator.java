package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Calculator extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//사용자 입력 혹은 선택값 받기]
		int firstNum=Integer.parseInt(req.getParameter("firstNum"));
		int secondNum=Integer.parseInt(req.getParameter("secondNum"));
		String op=req.getParameter("operator");
		
		int value;
		
		switch(op){
		case "+": value=firstNum+secondNum; 	break;
		case "-": value=firstNum-secondNum; 	break;
		case "*": value=firstNum*secondNum; 	break;
		default:value=firstNum/secondNum; 	break;	
		}
		
		req.setAttribute("calculateValue", value);
		
		req.getRequestDispatcher("/HelloWorld.jsp").forward(req, resp);

		
	}
}
