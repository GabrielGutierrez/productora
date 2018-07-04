package transaccionales

class Presupuestos 
{
	String item
	Integer cantidad
	Integer valorUnitario

	static belongsTo = [evento:ListadoEventos]

    static constraints = {  }
}