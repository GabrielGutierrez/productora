package transaccionales

import grails.plugin.springsecurity.annotation.Secured
import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

@Secured(['ROLE_ADMIN', 'ROLE_PRODUCTOR'])
class ListadoEventosController 
{
    ListadoEventosService listadoEventosService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) 
    {
        params.max = 10
        
        respond listadoEventosService.list(params), model:[listadoEventosCount: listadoEventosService.count()]
    }

    def show(Long id) { respond listadoEventosService.get(id) }

    def create() { respond new ListadoEventos(params) }

    def save(ListadoEventos listadoEventos) 
    {        
        try { listadoEventosService.save(listadoEventos) } 

        catch (ValidationException e) 
        {
            respond listadoEventos.errors, view:'create'
            return
        }

        flash.message = "El evento se ha creado exitosamente."
        redirect listadoEventos        
    }

    def edit(Long id) { respond listadoEventosService.get(id) }

    def update(ListadoEventos listadoEventos) 
    {
        try { listadoEventosService.save(listadoEventos) } 

        catch (ValidationException e) 
        {
            respond listadoEventos.errors, view:'edit'
            return
        }

        flash.message = "El evento se ha actualizado exitosamente."
        redirect listadoEventos
    }

    def delete(Long id) 
    {
        listadoEventosService.delete(id)

        flash.message = message(code: 'default.deleted.message', args: [message(code: 'listadoEventos.label', default: 'ListadoEventos'), id])
        redirect action:"index", method:"GET"
    }
}