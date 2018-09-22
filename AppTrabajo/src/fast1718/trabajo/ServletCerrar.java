package fast1718.trabajo;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.NamingException;
import javax.naming.InitialContext;
import javax.naming.NamingException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
//import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//import javax.sql.DataSource;

@WebServlet("/cerrar")
public class ServletCerrar extends HttpServlet {


	/**
	 *
	 */
	private static final long serialVersionUID = 1L;//Valor por defecto

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getSession().invalidate();//Elimina la sesión
		request.getRequestDispatcher("/").forward(request, response);//Reenvía a la página de inicio
		for(int i=0 ; i<request.getCookies().length ; i++ ) {
		request.getCookies()[i].setMaxAge(0);//Para borrar todas las cookies
		}

	}
}
