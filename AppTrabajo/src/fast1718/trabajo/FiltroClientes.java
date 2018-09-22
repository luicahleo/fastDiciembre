package fast1718.trabajo;

import java.io.IOException;
//import java.sql.Connection;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//import java.sql.SQLException;

//import javax.naming.NamingException;
//import javax.naming.InitialContext;
//import javax.naming.NamingException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
//import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//import javax.sql.DataSource;

/**
 * Servlet Filter implementation class FiltroMenu
 */
// TODO MODIFICAR

@WebFilter(urlPatterns = { "/clientes/*" })

public class FiltroClientes implements Filter {

	/**
	 * Default constructor.
	 */


	public FiltroClientes() {
	}

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
		throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		Usuario usuario = (Usuario) req.getSession().getAttribute("usuario");

		if(usuario==null)//Comprueba que existe el atributo sesión!
			res.sendError(HttpServletResponse.SC_FORBIDDEN, "Acceso prohibido");
		else
			chain.doFilter(req,  res);//Sigue con la petición
		
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		
	}
}
