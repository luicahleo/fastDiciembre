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
@WebServlet(urlPatterns={"/clientes/verIntSinAsignar", "/admin/verIntSinAsignar"})//Para Acceder como usuario ó Admin
public class ServletIntSinAsignar extends HttpServlet {
	private static final long serialVersionUID = 1L;//Valor por defecto

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletIntSinAsignar() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json");// Get the printwriter object from response to write the required json object to the output stream
		PrintWriter out = response.getWriter();//Escribe en el html I think*
		try {//Conexion con la base de Datos
			Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");//Consigo el objeto usuario de la sesión
			@SuppressWarnings("unchecked")
			Map<Integer,String> tipos_in = (Map<Integer, String>) request.getServletContext().getAttribute("tipos_in");
			DataSource ds = (DataSource) request.getServletContext().getAttribute("ds");
			Connection conn = ds.getConnection();


			String sql="";//Definición del String
			// TODO MODIFICAR

			if (usuario.getTipo_usu()!=Usuario.ADMINISTRADOR)//Devuelve Interfaces de los equipos del usuario en cuestión
				sql = "select id_eq, num_in, id_ti, ip, masc, ip_gw from interfaces natural left join direcciones_ip where direcciones_ip.ip is NULL and interfaces.id_eq in (select id_eq from equipos where id_usuario=?)  ORDER BY id_eq, num_in";
			else   //	Debe devolver en un Array de objetos JSON todas las interfaces de todos los equipos de todos los
						//usuarios, que no tengan ninguna dirección IP asignada, si el usuario autenticado es administrador
				sql = "select id_eq, num_in, id_ti, ip, masc, ip_gw from interfaces natural left join direcciones_ip where direcciones_ip.ip is NULL ORDER BY id_eq, num_in";//
			PreparedStatement st = conn.prepareStatement(sql);
			// TODO MODIFICAR
			if (usuario.getTipo_usu()!=Usuario.ADMINISTRADOR)
				st.setString(1, usuario.getUsu());

			ResultSet rs = st.executeQuery();
			out.println("[");
			boolean hayDato = rs.next();
			while (hayDato) {
				out.print("  {");//out es una variable definida arriba del tiop PrintWriter
				String id_eq = rs.getString(1);
				int num_in = rs.getInt(2);
				String des = tipos_in.get(rs.getInt(3));//*****Modificar--->String id_ti = tipos_in.get(rs.getInt(3));************¿Qué es id_ti?
				String ip = rs.getString(4);
				String masc = rs.getString(5);
				String ip_gw = rs.getString(6);
				out.print("\"id_eq\": \""+id_eq+"\",");
				out.print("\"num_in\": \""+num_in+"\",");
				out.print("\"des\": \""+des+"\",");//*****Modificar--->String id_ti = tipos_in.get(rs.getInt(3));************¿Qué es id_ti?
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
			System.out.println("Error de acceso a la base de datos. ServletIntsinAsignar");
		}
	}
}
