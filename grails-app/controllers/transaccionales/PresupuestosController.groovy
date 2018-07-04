package transaccionales

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*
import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN', 'ROLE_PRODUCTOR'])
class PresupuestosController 
{
    PresupuestosService presupuestosService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) 
    {
        params.max = 10

        def presupuestos = Presupuestos.createCriteria().list(params) { evento { eq('id', params.evento as Long) } }

        model:[presupuestosCount: presupuestosService.count(), presupuestos:presupuestos]
    }

    def show(Long id) { respond presupuestosService.get(id) }

    def create() { respond new Presupuestos(params) }

    def save(Presupuestos presupuestos) 
    {
        presupuestos.evento = ListadoEventos.get(params.idEvento)

        try { presupuestosService.save(presupuestos) } 

        catch (ValidationException e) 
        {
            respond presupuestos.errors, view:'create'
            return
        }

        flash.message = "Item de presupuesto creado exitosamente."
        redirect action:'index', params:[evento:presupuestos.evento.id]
    }

    def edit(Long id) { respond presupuestosService.get(id) }

    def update(Presupuestos presupuestos) 
    {
        try { presupuestosService.save(presupuestos) } 
        
        catch (ValidationException e) 
        {
            respond presupuestos.errors, view:'edit'
            return
        }

        flash.message = "Item de presupuesto actualizado exitosamente."
        redirect action:'index', params:[evento:presupuestos.evento.id]        
    }

    def delete(Long id) 
    {
        presupuestosService.delete(id)

        flash.message = "Item de presupuesto eliminado exitosamente."
        redirect action:"index", method:"GET"
    }
}