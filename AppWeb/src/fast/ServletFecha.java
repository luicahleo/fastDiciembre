package fast;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ServletFecha extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		PrintWriter salida = response.getWriter();
		java.util.Date hoy = new java.util.Date();

		salida.println("<!DOCTYPE html>");
		salida.println("<html><body><div style='text-align:center'>" +
				"<h1>Ejemplo1 de servlet</h1><br/>"	+
				"<p> La fecha actual es: " +
				hoy +
				"</p>" +
				"</div>" +
				"</body></html>");
	}
}
