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
@WebServlet(urlPatterns={"/clientes/verInterfaces", "/admin/verInterfaces"})
public class ServletInterfaces extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletInterfaces() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		try {
			Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");//Consigo el objeto usuario de la sesión
			@SuppressWarnings("unchecked")
			Map<Integer,String> tipos_in = (Map<Integer, String>) request.getServletContext().getAttribute("tipos_in");
			DataSource ds = (DataSource) request.getServletContext().getAttribute("ds");
			Connection conn = ds.getConnection();


			String sql="";
			// TODO MODIFICAR
			if (usuario.getTipo_usu()!=Usuario.ADMINISTRADOR)//Estudiar peticion why and how//Cuando sea cliente solo te lo da de los clientes//Similar a ServletIntSinAsignar
				sql = "select id_eq, num_in, id_ti, ip, masc, ip_gw from interfaces natural left join direcciones_ip where interfaces.id_eq in (select id_eq from equipos where id_usuario=?)  ORDER BY id_eq, num_in";
			else {//Cuando sea admin te da todos
				sql = "select id_eq, num_in, id_ti, ip, masc, ip_gw from interfaces natural left join direcciones_ip ORDER BY id_eq, num_in";//direcciones IP de todas las interfaces de todos los
				//equipos de todos los usuarios, si el usuario autenticado es administrador
			}
			PreparedStatement st = conn.prepareStatement(sql);
			// TODO MODIFICAR
			if (usuario.getTipo_usu()!=Usuario.ADMINISTRADOR)//Cambiar por CLIENTE
				st.setString(1, usuario.getUsu());

			ResultSet rs = st.executeQuery();
			out.println("[");
			boolean hayDato = rs.next();
			while (hayDato) {//Creo que hay que cambiarlo
				out.print("  {");
				String id_eq = rs.getString(1);
				int num_in = rs.getInt(2);
				String des = tipos_in.get(rs.getInt(3));
				String ip = rs.getString(4);
				String masc = rs.getString(5);
				String ip_gw = rs.getString(6);
				out.print("\"id_eq\": \""+id_eq+"\",");
				out.print("\"num_in\": \""+num_in+"\",");
				out.print("\"des\": \""+des+"\",");
				out.print("\"ip\": \""+ip+"\",");
				out.print("\"masc\": \""+masc+"\",");
				out.print("\"ip_gw\": \""+ip_gw+"\"");
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
			System.out.println("Error de acceso a la base de datos. ServletInterfaces");
		}
	}
}
