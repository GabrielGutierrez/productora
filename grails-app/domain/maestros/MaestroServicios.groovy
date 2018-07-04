package maestros

class MaestroServicios 
{
	String descripcion

	String toString() { return "${this.descripcion}" }

	static belongsTo = [proveedor:MaestroProveedor]

    static constraints = {  }
}