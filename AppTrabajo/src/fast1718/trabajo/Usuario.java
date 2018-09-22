//TODO BORRAR Y CREAR NUEVO
package fast1718.trabajo;

public class Usuario{
	//ES UN JAVABEAN
	public static final int ADMINISTRADOR = 0;
	public static final int CLIENTE = 1;
//Boton derecho sources create constructor super class para un bean, gracias guille!
/*	public Usuario(String usu, String contra, int tipo_usu) {
		super();
		this.usu = usu;
		this.contra = contra;
		this.tipo_usu = tipo_usu;
	}*/
	private String usu;
	private String contra;
	private int tipo_usu;

	public String getUsu() {
		return usu;
	}
	public void setUsu(String usu) {
		this.usu = usu;
	}
	public String getContra() {
		return contra;
	}
	public void setContra(String contra) {
		this.contra = contra;
	}
	public int getTipo_usu() {
		return tipo_usu;
	}
	public void setTipo_usu(int tipo_usu) {
		this.tipo_usu = tipo_usu;
	}

}
