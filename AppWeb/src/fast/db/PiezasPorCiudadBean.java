/**
 * 
 */
package fast.db;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.InitialContext;
import javax.sql.DataSource;

/**
 * @author dit
 *
 */
public class PiezasPorCiudadBean implements Serializable {

	private static final long serialVersionUID = 1L;

	String ciudad;
	Connection conn;
	PreparedStatement st;
	boolean conError = false;

	public PiezasPorCiudadBean() {
		try {
			// Usando DataSource ya definido en el servidor
			InitialContext ctx = new InitialContext();
			// /jdbc/dit is the name of the resource above
			DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/dit");
			conn = ds.getConnection();

			String sql = "SELECT * FROM p WHERE ciudad=?";
			// Statement st = conn.createStatement();
			st = conn.prepareStatement(sql);
		} catch (Exception e) {
			conError = true;
		}
	}

	public void setCiudad(String ciudad) {
		this.ciudad = ciudad;
	}

	public List<Pieza> getPiezas() throws SQLException {
		List<Pieza> resultado = null; // null = error
		if (!conError) {
			st.setString(1, ciudad);
			ResultSet rs = st.executeQuery();
			resultado = new ArrayList<Pieza>();
			while (rs.next()) {
				Pieza aux = new Pieza();
				aux.setIdp(rs.getInt("idp"));
				aux.setNombre(rs.getString("nomp"));
				aux.setColor(rs.getString("color"));
				aux.setPeso(rs.getInt("peso"));
				aux.setCiudad(rs.getString("ciudad"));
				resultado.add(aux);
			}
			rs.close();

		}
		return resultado;
	}

}
