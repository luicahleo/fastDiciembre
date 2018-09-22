package fast1718.trabajo;

/**
 * Clase con funciones útiles para el manejo de direcciones IP
 * @author dit
 *
 */
public class OperacionesIP {
	/**
	 * Convierte una cadena de caracteres conteniendo una IPv4
	 * a un número entero
	 * @param ip Cadena con la dirección IP
	 * @return número entero
	 */
	public static int ipToInt(String ip) {
		int value = -1;

		try {
			String[] parts = ip.split("\\.");
			if (parts.length == 4) {
				for (int i = 0; i < 4; i++) {
				    value += Integer.parseInt(parts[i]) << (24 - (8 * i));
				}
			}
		} catch (NumberFormatException e) {
			value = -1;
		}
		
		return value;
	}
	
	/**
	 * Devuelve un entero de 32 bits con tantos 1 como indique
	 * maskBits
	 * @param maskBits número de unos
	 * @return máscara como un entero
	 */
	public static int bitsToMask(int maskBits) {
		return (-1 << (32 - maskBits));
	}
	
	/**
	 * Comprueba si dos IP están en la misma subred
	 * @param ip1 Primera IP
	 * @param ip2 Segunda IP
	 * @param mask Máscara de subred
	 * @return Verdadero si están en la misma subred
	 */
	public static boolean sameSubnet(int ip1, int ip2, int mask) {
		return ((ip1 & mask) == (ip2 & mask));
	}
	
	/**
	 * Verifica que una IP, máscara y pasarela pasados como cadenas de 
	 * caracteres son correctos.
	 * @param ip Dirección IP
	 * @param maskBits Número de bits 1 de la máscara (como string)
	 * @param gw Dirección de la pasarela
	 * @return Verdadero si todo es correcto.
	 */
	public static boolean checkGw(String ip, String maskBits, String gw) {
		boolean res = false;
		
		try {
			int ipInt = OperacionesIP.ipToInt(ip);
			int gwInt = OperacionesIP.ipToInt(gw);
			int mask = bitsToMask(Integer.parseInt(maskBits));
			if (ipInt!=0 && gwInt!=0)
				res = sameSubnet(ipInt, gwInt, mask);
		} catch (NumberFormatException e) {
			//Error convirtiendo de string a número
		}
		
		return res;
	}
}

