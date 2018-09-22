package fast1718.trabajo;



import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;


/**
 * Servlet implementation class ServletInterfaces
 */
@WebServlet(urlPatterns={"/clientes/verEquipos", "/admin/verEquipos"})
public class ServletEquipos extends HttpServlet {
	private static final long serialVersionUID = 1L;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletEquipos() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		try {
			Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
			@SuppressWarnings({ "unchecked", "unused" })
			Map<Integer,String> tipos_in = (Map<Integer, String>) request.getServletContext().getAttribute("tipos_in");
			DataSource ds = (DataSource) request.getServletContext().getAttribute("ds");//consigue el atributo ds de la aplicacion AppTrabajo
			Connection conn = ds.getConnection();

			String sql="";
			// TODO MODIFICAR
			if (usuario.getTipo_usu() !=Usuario.ADMINISTRADOR)//si el usuario no es admin...
				sql = "select id_eq, id_usuario from equipos where id_usuario=?";//sólo muestra los equipos del usuario que entra
			else
				sql = "select id_eq, id_usuario from equipos";//si es admin muestra todo!
			PreparedStatement st = conn.prepareStatement(sql);
			// TODO MODIFICAR
			if (usuario.getTipo_usu() !=Usuario.ADMINISTRADOR)
				st.setString(1, usuario.getUsu());//rellena la '?' de si no es admin!

			ResultSet rs = st.executeQuery();//rs es un array con todas las respuestas del SELECT
			out.println("[");//le damos formato de tabla de objetos (JSON)
			boolean hayDato = rs.next();
			while (hayDato) {
				out.print("  {");
				String id_eq = rs.getString(1);//saca el primer parámetro del primer objeto de la respuesta...etc...
				String id_usuario = rs.getString(2);
				out.print("\"id_eq\": \""+id_eq+"\",");
				out.print("\"id_usuario\": \""+id_usuario+"\"");
				out.print("}");
				hayDato = rs.next();
				if (hayDato)
					out.println(",");
			}
			out.println("\n]");

			rs.close();
			st.close();
			conn.close();

		} catch (SQLException e) {
			out.println("[]");
			e.printStackTrace();
			System.out.println("Error de acceso a la base de datos. ServletIntsinAsignar");
		}
	}
}

