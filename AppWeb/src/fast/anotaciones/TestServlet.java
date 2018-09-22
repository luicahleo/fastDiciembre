/**
 * 
 */
package fast.anotaciones;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.annotation.WebServlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
//import javax.servlet.annotation.WebInitParam;

/**
 * @author dit
 *
 */
//Lo más sencillo es poner solo:
@WebServlet(urlPatterns={"/test", "*.test"})
//@WebServlet(name = "testServlet", description = "Ejemplo de Servlet con anotaciones", urlPatterns = {
//		"/test" }, initParams = { @WebInitParam(name = "n1", value = "v1"), @WebInitParam(name = "n2", value = "v2") })
public class TestServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		PrintWriter salida = resp.getWriter();
		
		salida.println("<!DOCTYPE html>");
		salida.println("<html><body><div>" +
				"<h1>Test con anotaciones</h1><br/>"	+
				"<p>Así no hace falta tener que modificar el fichero web.xml</p>" +
				"</div>" +
				"</body></html>");
	}

}
