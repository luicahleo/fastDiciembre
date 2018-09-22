package fast;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.management.ManagementFactory;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ServletFechaInfo extends HttpServlet {
	
  private static final long serialVersionUID = 1L;

  public void doGet(HttpServletRequest request, 
		  	        HttpServletResponse response)
    throws IOException {
    
	PrintWriter salida = response.getWriter();
    java.util.Date hoy = new java.util.Date();
    salida.println("<!DOCTYPE html>");
    salida.println(
      "<html><body><div style='text-align:center'>" +
      "<h1>Ejemplo con fecha e información del servlet</h1><br/>" + 
      "<p> La fecha actual: " + hoy + "</p>" +
      "<p> El PID es: "+ 
           ManagementFactory.getRuntimeMXBean().getName() +"</p>"+ 
      "<p> El ID del thread (hilo) es: "+ 
           Thread.currentThread().getId() +"</p>"+ 
      "<p> El objeto (this) es: "+ this +"</p>"+ 
      "<p> this.toString() es: "+ this.toString() +"</p>"+ 
      "<p> this.hashCode() es: "+ this.hashCode() +"</p>"+ 
      "<p> this.getClass() es: "+ this.getClass() +"</p>"+ 
      "</div>" +
      "</body></html>");
  }
}

