package com.reum.common;

import java.io.Reader;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;


public class MyBatisFactory extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static SqlSessionFactory factory = null;

	public void init(ServletConfig config) throws ServletException {
		System.out.println("MyBatisFactory init 호출");

		String path = "config/mybatis/config-mybatis.xml";
		Reader reader;
		try {
			reader = Resources.getResourceAsReader(path);
			factory = new SqlSessionFactoryBuilder().build(reader);

		} catch(Exception e) {
			e.printStackTrace();
		}

		//		String size = config.getInitParameter("MAX_SIZE");
		//		String updir = config.getInitParameter("UPDIR");
		//		System.out.println(size +"," +updir);
		//		
		//		ServletContext ctx = config.getServletContext();
		//		String comm = ctx.getInitParameter("COMMON");
		//		System.out.println("MyBatisFactory COMMON" + comm);
	}

	public static SqlSessionFactory getFactory(){
		return factory;
	}

}
