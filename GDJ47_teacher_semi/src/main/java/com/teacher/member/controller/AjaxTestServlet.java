package com.teacher.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AjaxTestServlet
 */
@WebServlet("/ajaxtest.do")
public class AjaxTestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxTestServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//ajax요청시 서버에서 응답하는 데이터
		//request에 데이터는 넣는다! -> 
		request.setAttribute("test", "유병승");
		//기본적으로 ajax요청에 대한 응답은 스트림으로 직접 데이터방식으로 전송을 한다.
		//한글에 대한 데이터를 전송할때는 인코딩처리, 데이터타입에 대한 설정을 해야한다
//		response.setContentType("text/csv;charset=utf-8");
//		response.getWriter().append("유병승,19,남,경기도 시흥시\n류원희,26,남,경기도부천\n김충열,32,여,인천시");
//		response.getWriter().append("류원희");
//		response.getWriter().append("김충열");
		
		//ajax요청에 대한 json으로 처리하기
		//java클래스와 js객체를 연동해서 사용하는 기술
		//기본 : jsonsimple 라이브러리 / Gson, Jackson
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
