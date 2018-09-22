<%--FJFJ--%>
<%@ page language="java" import="java.sql.*"%>
<%
	//Verificamos que estamos en una sesion
	if(session.getAttribute("usuario")!=null) {
   				// Creamos respuesta en formato JSON 
		// Hay que obtener los campos nota y urlimagen de la nota 
		//   con id=(el pasado en la peticion)
		String mensajeError = "";
		String nota = "";
		String urlimagen = "";
		//Nos conectamos a la base de datos
		try {
			Class.forName("org.postgresql.Driver").newInstance();

			String url = "jdbc:postgresql://localhost:5432/notasfast";
			String user = "dit";
			String pass = "dit";
			try {
				Connection conn = DriverManager.getConnection(url,
						user, pass);
				try {
					String sql = "SELECT nota, urlimagen FROM notas WHERE id="
							+ request.getParameter("id");
					Statement st = conn.createStatement();
					ResultSet rs = st.executeQuery(sql);
					if (rs.next()) {
						//Generamos JSON
						nota = rs.getString(1);
						urlimagen = rs.getString(2);
					} else {
						mensajeError = "La nota no existe.";
					}
					rs.close();
					st.close();
				} catch (SQLException e) {
					mensajeError = "No se ha podido obtener la nota."
							+ e;
				}
				conn.close();
			} catch (SQLException e) {
				mensajeError = "Imposible acceder a la base de datos.";
			}

		} catch (Exception e) {
			mensajeError = "Driver no soportado.";
		}
		out.println("{ \"nota\":\"" + nota + "\" , \"imagen\":\""
				+ urlimagen + "\", \"error\":\"" + mensajeError
				+ "\" }");
	}
%>
