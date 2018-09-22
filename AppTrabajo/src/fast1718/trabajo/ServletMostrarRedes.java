	package fast1718.trabajo;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

/**
 * Servlet implementation class ServletMostrarRedes
 */
//TODO MODIFICAR-->Modified

@WebServlet(urlPatterns={"/admin/mostrarRedes"})//Added

public class ServletMostrarRedes extends HttpServlet {
	private static final long serialVersionUID = 1L;


    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletMostrarRedes() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequ	est request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {//Lo llama ipForm.jsp
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		String paramIp = request.getParameter("ip");//Ip sacada del formulario
		if (paramIp != null) {//Si el campo ip está relleno...
			try {
				int ipNueva = OperacionesIP.ipToInt(paramIp);//Convierte la Ip del formulario a números enteros

				DataSource ds = (DataSource) request.getServletContext().getAttribute("ds");
				Connection conn = ds.getConnection();

				String sql = "";
				sql = "SELECT ip, masc, ip_gw from direcciones_ip";
				PreparedStatement st = conn.prepareStatement(sql);

				ResultSet rs = st.executeQuery();//rs tiene los campos de ip, masc y ip_gw de la tabla direcciones_ip
				out.println("[");//		PrintWriter out = response.getWriter()...out es una variable que escribe en response!
				boolean hayDato = rs.next();//si hay datos devuelve true...
				boolean ponerComa = false;
				while (hayDato) {//si rs devuelve algo...

					String ip = rs.getString(1);//parametro ip del elemento de la base de datos correspondiente
					int maskBits = rs.getInt(2);//la mascara del elemento correspondiente de la base de datos
					String ip_gw = rs.getString(3);//La Gw del elemento correspondiente de la base de datos

					// Comprobar si la IP pertenece a la misma subred
					// TODO MODIFICAR--->modified
					int ipInt = OperacionesIP.ipToInt(ip);//Convierte ip a ip entero
					int mask = OperacionesIP.bitsToMask(maskBits);

					int ip_gw_int = OperacionesIP.ipToInt(ip_gw);//paso la ip del gw a enteros para usar la funcion sameSubnet

					if (OperacionesIP.sameSubnet(ipNueva, ip_gw_int, mask)) {//Si la Ip del form entra en la subred del gw con su mascara correspondiente...
						if (ponerComa)
							out.println(",");
						out.print("  {");
						out.print("\"ip\": \"" + ip + "\",");
						out.print("\"masc\": \"" + maskBits + "\",");
						out.print("\"ip_gw\": \"" + ip_gw + "\"");
						out.print("}");
						ponerComa = true;
					} else {//Si la Ip del form no se encuentra en esta Subred...
						ponerComa = false;
				   	  } 

					hayDato = rs.next();
				}//fin del while!
				out.println("\n]");

				rs.close();
				st.close();
				conn.close();

			} catch (Exception e) {
				out.println("[]");
				e.printStackTrace();
				System.out.println("Error de acceso a la base de datos. ServletMostrar");
			}
		} else {
			out.println("[]");
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}


}
