package org.angularJsDemo.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.angularJsDemo.dao.deptDao;
import org.angularJsDemo.pojo.Dept;

import com.alibaba.fastjson.JSON;

/**
 * Servlet implementation class Servlet04
 */
@WebServlet("/servlet04")
public class Servlet04 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Servlet04() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		deptDao dd = new deptDao();
		List<Dept> dl = dd.selectAll();
		response.setContentType("application/json;charset=utf-8");
		PrintWriter out = response.getWriter();
		String json = JSON.toJSONString(dl);
		out.write(json);

	}

}
