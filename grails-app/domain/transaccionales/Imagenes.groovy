package transaccionales

import maestros.MaestroProveedor
import maestros.MaestroProductora

class Imagenes 
{
	byte[] imagen
	MaestroProveedor proveedor
	MaestroProductora productora 
	Blog blog

    static constraints = 
    {
    	imagen maxSize:1073741824
    	proveedor nullable:true
    	productora nullable:true
    	blog nullable:true
    }
}