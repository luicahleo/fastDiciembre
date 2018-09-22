/**
 * 
 */
package fast;


/**
 * @author fjfj
 * Almacena variables utilizadas en las paginas de Bloc de Notas
 *
 */
public class DatosPaginaBloc {
	
	/**
	 * Titulo de la pagina
	 */
	private String titulo;
	/**
	 * Indica si esta pagina es la inicial (el comportamiento 
	 *				varia si es la primera)
	 */
	private Boolean esPaginaInicial;
	/**
	 * Si verdadero, se cierra la sesion
	 */
	private Boolean hayQueCerrarSesion;
	/**
	 * Si no es null indica que el usuario se ha
	 *				autenticado correctamente
	 */
	private String usuario;
	
	
	public DatosPaginaBloc() {
		//Valores por defecto
		this.titulo = null;
		this.esPaginaInicial = false;
		this.hayQueCerrarSesion = false;
		this.usuario = null;
	}
	
	
	public String getTitulo() {
		return titulo;
	}
	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}
	public Boolean getEsPaginaInicial() {
		return esPaginaInicial;
	}
	public void setEsPaginaInicial(Boolean esPaginaInicial) {
		this.esPaginaInicial = esPaginaInicial;
	}
	public Boolean getHayQueCerrarSesion() {
		return hayQueCerrarSesion;
	}
	public void setHayQueCerrarSesion(Boolean hayQueCerrarSesion) {
		this.hayQueCerrarSesion = hayQueCerrarSesion;
	}
	public String getUsuario() {
		return usuario;
	}
	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}
	
}
