package com.mybatis.controller;


import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import static com.mybatis.common.SqlSessionTemplate.getSession;
import org.apache.ibatis.session.*;
/**
 * Servlet implementation class ConnectTestServlet
 */
@WebServlet("/connecttest.do")
public class ConnectTestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ConnectTestServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//mybatis를 이용해서 DB에 접속하기
		// Mybatis.jar에서 제공하는 SqlSession클래스를 이용
		// Template클래스를 이용해서 생성
		SqlSession session = getSession();
		System.out.println(session);
		
		//메인화면으로
		response.sendRedirect(request.getContextPath());
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		doGet(request, response);
	}

}
