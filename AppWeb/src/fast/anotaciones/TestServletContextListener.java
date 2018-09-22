package fast.anotaciones;

import java.util.Date;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

@WebListener
public class TestServletContextListener implements ServletContextListener {

	@Override
	public void contextDestroyed(ServletContextEvent contextEvent) {
		System.out.println("TestServletContextListener: Detectado el cierre de la aplicación web de FAST.");
		System.out.println(
				"TestServletContextListener: Si hay que guardar o cerrar algún recurso, este es el momento .");
	}

	@Override
	public void contextInitialized(ServletContextEvent contextEvent) {
		System.out.println("TestServletContextListener: Inicializando la aplicación web de FAST.");
		System.out.println("TestServletContextListener: "+
				"Los ficheros de la aplicación están en el directorio " +
				contextEvent.getServletContext().getRealPath("/"));
		contextEvent.getServletContext().setAttribute("fechaInicio", new Date());
		System.out.println("TestServletContextListener: "+
				"Creo la variable fechaInicio con valor "+
				contextEvent.getServletContext().getAttribute("fechaInicio")
				);
			
	}

}
