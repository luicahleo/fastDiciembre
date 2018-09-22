/*FJFJ*/
package fast;

import java.util.HashMap;
import java.util.Map;

public class GestorUsuarios {
	Map<String, Usuario> usuarios;

	public GestorUsuarios() {
		usuarios = new HashMap<String, Usuario>();
		crearUsuarios();
	}

	
	/**
	 * Comprueba credenciales y devuelve datos del usuario
	 * @param usuario
	 * @param clave
	 * @return null en caso de error
	 */
	public Usuario getUsuario(String usuario, String clave) {
		Usuario res = null;
		if ( usuarios.containsKey(usuario) ) {  //Busca en el mapa
			Usuario encontrado = usuarios.get(usuario);
			if (encontrado.getClave().equals(clave)) //Comprueba clave
				res = encontrado;
		}
		
		return res;
	}
	
	/**
	 * Metodo que crea usuarios de ejemplos. Podrian sacarse de un
	 * fichero, o de una base de datos
	 */
	private void crearUsuarios() {
		Usuario u1 = new Usuario("dit", "Alumno de FAST", "dit");
		usuarios.put(u1.getUsuario(), u1); //Indexado por nombre de usuario
		Usuario u2 = new Usuario("fast", "Alumno de FAST 2", "clave");
		usuarios.put(u2.getUsuario(), u2);
		Usuario u3 = new Usuario("admin", "Administrador del sistema", "root");
		usuarios.put(u3.getUsuario(), u3);
		Usuario u4 = new Usuario("usuario", "Usuario de prueba", "clave");
		usuarios.put(u4.getUsuario(), u4);
	}
	
}
