package transaccionales

class ListadoEventos 
{
	String nombre
	String fecha
	String descripcion
	String locacion
	String horaInicio
	String horaFin
	String nombreCliente
	String telefonoCliente
	String correoCliente

    static constraints = 
    {
    	descripcion nullable:true
    	locacion nullable:true
    	horaInicio nullable:true
    	horaFin nullable:true
    	nombreCliente nullable:true
    	telefonoCliente nullable:true
    	correoCliente nullable:true
    }
}