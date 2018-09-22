package fast1718.trabajo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import javax.sql.DataSource;

/**
 * Application Lifecycle Listener implementation class AppListener
 *
 */
@WebListener//si no pongo nada significará que es al iniciarse la aplicación AppTrabajo
public class AppListener implements ServletContextListener {

	/**
	 * Default constructor.
	 */
	public AppListener() {
	}

	/**
	 * @see ServletContextListener#contextDestroyed(ServletContextEvent)
	 */
	public void contextDestroyed(ServletContextEvent arg0) {
	}

	/**
	 * @see ServletContextListener#contextInitialized(ServletContextEvent)
	 */
	public void contextInitialized(ServletContextEvent event) {// event es el evento que inicia al servlet en java lo
														                             		// definimos nosotros en jsp siempre es application
		String autor = "Cahuana Leon, Luis Rolando - luicahleo";//Se crea una cadena

		// TODO hecho
		event.getServletContext().setAttribute("autor", autor);//Atributo de aplicación(AppTrabajo) "Metemos en la aplicacion AppTrabajo la variable autor y la dejamos ahi flotando ;)"


		System.out.println("Creado atributo autor: " + autor);

		try {
			// Usando DataSource ya definido en el servidor
			InitialContext ctx = new InitialContext();
			// /jdbc/dit is the name of the resource above
			DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/dit");
			Connection conn = ds.getConnection();//PARA ACCEDES A LA BASE DE DATOS 1º METODO

			String sql = "SELECT * FROM tipos_in";//tabla tipos_in
			PreparedStatement st = conn.prepareStatement(sql);
			ResultSet rs = st.executeQuery();
			Map<Integer, String> tipos_in = new HashMap<Integer, String>();
			while (rs.next()) {//okok
				// TODO COMPLETAR, completed
				//tipos_in.put(rs.getInt("id_ti"), rs.getString("des"));//Esto no lo entiendo, preguntar guille
				 Integer id_ti = rs.getInt("id_ti");  
	                String des = rs.getString("des");
	                tipos_in.put(id_ti, des);

			}
			// TODO COMPLETAR, completed

			event.getServletContext().setAttribute("tipos_in", tipos_in);//Creo que atributo en la aplicacion tipos_in que cada usuario rellenará 

			System.out.println("Creado atributo tipos_in: " + tipos_in);

			event.getServletContext().setAttribute("ds", ds);//Meto el atributo ds en el contexto de aplicacion(AppTrabajo)
			System.out.println("Creado atributo ds: " + ds);
			rs.close();
			st.close();
			conn.close();
		} catch (NamingException e) {
			System.out.println("No está definida la base de datos en el servidor. AppListener");
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("Error de acceso a la base de datos. AppListener.");
		}

	}

}
