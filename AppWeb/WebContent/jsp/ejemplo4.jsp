<%@ page import="java.lang.management.*" %>
<!DOCTYPE html>
<html>
 <body>
   <div style="text-align:center">
    <h1>Ejemplo 4 de JSP</h1>
    <br/>
    <p> El PID es:
    <%= ManagementFactory.getRuntimeMXBean().getName() %>
    </p>
    <p> El ID del thread (hilo) es:
    <%= Thread.currentThread().getId() %>
    </p>
    <p> El objeto (this) es:
    <%= this %>
    </p>
    <p> this.toString() es:
    <%= this.toString() %>
    </p>
    <p> this.hashCode() es:
    <%= this.hashCode() %>
    </p>
    <p> this.getClass() es:
    <%= this.getClass() %>
    </p>
   </div>
 </body>
</html>
