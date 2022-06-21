package com.teacher.member.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.teacher.member.model.vo.Student;

/**
 * Servlet implementation class AjaxJsonTestServlet
 */
@WebServlet("/ajaxJson.do")
public class AjaxJsonTestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxJsonTestServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//ajax로 보낸 요청에 대해 JSON 응답 서블릿만들기
		Student s=Student.builder().gender("남").name("유병승").age(19).addr("경기도 시흥시").build();
		
		
		List<Student> list=List.of(s,
				Student.builder().gender("남").name("이주호").age(33).addr("경기도 수원시").build()
				,Student.builder().gender("여").name("김도희").age(24).addr("경기도 수원시").build()
				,Student.builder().gender("남").name("이혁주").age(30).addr("서울시 영등포").build());
		
		//List<Student> list=new MemberService().selectMemberList();
		
		response.setContentType("application/json;charset=utf-8");
		
		String data=new Gson().toJson(list);
//		Field[] fields=s.getClass().getDeclaredFields();
//		Method[] methods=s.getClass().getDeclaredMethods();
//		String json="{";
//		for(Field memberVar: fields) {
////			System.out.println(memberVar.getName());
//			String field=memberVar.getName().substring(0,1).toUpperCase()
//						+memberVar.getName().substring(1);
//			for(Method m : methods) {
//				String method=m.getName();
//				if(method.contains("get")&&method.contains(field)) {
//					try {
//						json+="\""+field+"\":"+m.invoke(s,null)+",";
//					} catch (Exception e) {
//						// TODO Auto-generated catch block
//						e.printStackTrace();
//					} 
//				}
//			}
//		}
//		json+="}";
//		System.out.println(json);
		
		System.out.println(data);
		response.getWriter().print(data);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
