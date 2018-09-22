// jspJB.java
/* Clase Java que sigue la convencion JavaBean
* Bean que describe la propiedad saludo. Constructor por defecto, sin
* argumentos, necesario para que esta clase sea un JavaBean.
*/
package ej_jbean;
public class jspJB {
  private String saludo = "Hola";
  // Métodos set/get para asignar/recuperar el valor de la propiedad
  public void setSaludo( String _saludo ) {
    saludo = _saludo;
  }
  public String getSaludo() {
    return( saludo );
  }
  public String saludoCompleto() {
    return( saludo+", dit" );
  }
}

