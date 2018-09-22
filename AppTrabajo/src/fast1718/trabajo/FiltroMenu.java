package fast1718.trabajo;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

/**
 * Servlet Filter implementation class FiltroMenu
 */
// TODO MODIFICAR--->Modificado

@WebFilter(urlPatterns = { "/menu" })

public class FiltroMenu implements Filter {

	/**
	 * Default constructor.
	 */
	public FiltroMenu() {
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

		HttpServletRequest req = (HttpServletRequest) request;// mete lo que hay en request en req pero en formato HttpServletRequest
																													// parametro request en el tipo HttpServletRequest no ServletRequest, ese matiz es importante.
		HttpServletResponse res = (HttpServletResponse) response;// same

		// Comprueba si es un login; El objeto request es un objeto usuario que tiene los parámetros usu, contra y Tipo_usu...OK
		String usu = req.getParameter("usu");//getParameter es una funcion para objetos de clase HttpServletRequest!!
		String contra = req.getParameter("contra");

		if (usu != null && contra != null) // si los parametros usu y contra no están vacíos significa que es un login,
		{

			 Usuario usuario = new Usuario();///////////Creamos el objeto usuario que será el de sesión

			// Valida contraseña y usuario
			boolean verificado = false;
			try {// Usamos La base de datos ya definida por el server
				DataSource ds = (DataSource) req.getServletContext().getAttribute("ds");// Saca del contexto de aplicacion la informacion de la base de datos creada en el Listener
																																								//getServletContext es para HttpServletRequest tambien??
				Connection conn = ds.getConnection();

				String sql = "SELECT tipo_usu FROM usuarios WHERE id_usuario=? AND password=?";// selecciona el tipo de usuario del usuario loggeado
				PreparedStatement st = conn.prepareStatement(sql);
				st.setString(1, usu);// mete en la interrogacion primera el valor de usu;
				st.setString(2, contra);//mete en la interrogación segunda el valor de contra
				//rs valdra 0 para ADMIN y 1 para usuarios
				ResultSet rs = st.executeQuery(); // executeQuery es para consultas a la BBDD (SELECT)
				if (rs.next()) {// si la consulta devuelve algo...
					verificado = true;
					// TODO COMPLETAR
					//Asi se rellena un Bean!!...Rellenamos el objeto usuario creado arriba
					usuario.setUsu(usu);//rellenas al objeto usuario con los parámetros
					usuario.setContra(contra);//pertinentes
					usuario.setTipo_usu(rs.getInt(1));//getInt(1) tomo el primer valor, el getInt(0) da problemas chungos, no existe vaya

				}
				rs.close();
				st.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
				System.out.println("Error de acceso a la base de datos. FiltroMenu");
			}

			// Si es correcto, crea objetos en session
			if (verificado) {// Ha pasado por lo anterior

				////////////////////El Objeto de sesión no lo crea el Listener lo crea el propio Tomcat
				req.getSession().setAttribute("usuario", usuario);// Mete en el objeto sesión el objeto usuario
				// Creamos la cookie de nombre usuario
				Cookie usuCookie = new Cookie("usuario", usu);//String usu = req.getParameter("usu");crea una cookie de nombre usuario y valor usu
				res.addCookie(usuCookie);//res es un HttpServletResponse
				/////////////////////////////////

			}

		}
		//////////// Fin Comprueba si es un Login///////////

		// Busca un atributo de sesion de nombre usuario sin depender del if de arriba
		Usuario usuario = (Usuario) req.getSession().getAttribute("usuario");//por que no usu???

		if (usuario != null) {// Si el usuario existe
			// TODO
			if (usuario.getTipo_usu() == 0) {//Si usuario es tipo ADMIN
				req.getRequestDispatcher("/admin/menu.jsp").forward(req, res);//redirige a esa página
			} else// Si no es admin es usuario
				req.getRequestDispatcher("/clientes/menu.jsp").forward(req, res);// reenvia la petición a menu de clientes**
																				

		} else {// Si no encuentra al usuario reenvia la petición al Inicio
			req.getRequestDispatcher("/").forward(req, res);//Si el usuario no existe lo manda a la página de inicio!
		}

	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
	}

}
