<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html><body>
  <h1>Contador de visitas</h1>
  <%@ page import="java.io.*" %>
  <%! int visitas=0;
      String ficheroContador="/tmp/visitas.hex";

  // Método llamado al acceder a la página la primera vez. Carga fichero visitas
  public void jspInit() {

    try { // Leer contador
     FileInputStream fichero = new FileInputStream(ficheroContador);
     DataInputStream datos = new DataInputStream(fichero);
     visitas = datos.readInt();
     datos.close();

    } catch( Exception ie ) {
      try { // Si "/tmp/visitas.hex" no existe, se crea
         FileOutputStream ficheros = new FileOutputStream (ficheroContador);
         DataOutputStream datoss = new DataOutputStream( ficheros );
         datoss.writeInt( visitas );
         datoss.close();

      } catch( Exception oe ) {}
    }
  }

 // Metodo llamado en la destruccion. Guarda numero de visitas
  public void jspDestroy() {
    try { // Guardar contador
      FileOutputStream fichero=new FileOutputStream(ficheroContador);
     DataOutputStream datos = new DataOutputStream( fichero );
      datos.writeInt( visitas );
      datos.close();
    } catch( Exception e ) {
      e.printStackTrace(); }
    }
%>

<p>Esta p&aacute;gina ha recibido <b>
<%-- “synchronized” para evitar condiciones de carrera --%>
<% synchronized( page ) { // Incrementa el número de visitas e imprime
     visitas++;
     out.print( visitas );
     } %>
</b> visitas</p>
</body></html>
