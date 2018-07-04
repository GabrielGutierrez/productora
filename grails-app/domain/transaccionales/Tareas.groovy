package transaccionales

class Tareas 
{
	String descripcion
	Boolean realizada
	
	static belongsTo = [evento:ListadoEventos]
	
 	static constraints = {  }
}