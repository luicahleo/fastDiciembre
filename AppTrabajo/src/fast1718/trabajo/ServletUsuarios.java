package fast1718.trabajo;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

/**
 * Servlet implementation class ServletUsuarios
 */
//TODO MODIFICAR
@WebServlet("/admin/verUsuarios")//Debe estar asociado a una URL permitida sólo para administradores (ver filtros). La URL debe terminar
												 //en verEquipos. Debe devolver todos los usuarios existentes en la base de datos (sólo el identificador).

public class ServletUsuarios extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletUsuarios() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json");//¿Qué devuelve?**
		PrintWriter out = response.getWriter();
		try {
			DataSource ds = (DataSource) request.getServletContext().getAttribute("ds");
			Connection conn = ds.getConnection();

			//TODO MODIFICAR
			String sql = "select id_usuario from usuarios";//No sé si está correcta la petición, HELP
			PreparedStatement st = conn.prepareStatement(sql);

			ResultSet rs = st.executeQuery();
			out.println("[");
			boolean hayDato = rs.next();
			while (hayDato) {
				out.print("  {");
				String id_usuario = rs.getString(1);
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
			System.out.println("Error de acceso a la base de datos. ServletUsuarios");
		}
	}

}
