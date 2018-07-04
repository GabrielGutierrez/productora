package maestros

import seguridad.Usuario

class MaestroProveedor 
{
	String razonSocial
	String descripcion
	Boolean activo = true

	String toString() { return "${this.razonSocial}" }

	static belongsTo = [usuario:Usuario]

	static hasMany = [servicios:MaestroServicios]

    static constraints = {  }
}