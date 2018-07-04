package transaccionales

import maestros.MaestroProveedor
import maestros.MaestroProductora

class Cotizaciones 
{
	String fecha
	String servicio
	String comentario

	static belongsTo = [proveedor:MaestroProveedor, productora:MaestroProductora]

    static constraints = {  }
}