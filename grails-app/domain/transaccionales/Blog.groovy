package transaccionales

import maestros.MaestroProveedor

class Blog 
{
	String titulo
	String articulo

	static belongsTo = [proveedor:MaestroProveedor]

    static constraints = {  }
}