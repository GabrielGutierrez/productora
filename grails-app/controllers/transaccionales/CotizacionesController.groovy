package transaccionales

import maestros.MaestroProductora

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*
import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN', 'ROLE_PRODUCTOR'])
class CotizacionesController 
{
    def springSecurityService

    CotizacionesService cotizacionesService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) 
    {
        params.max = 10
        respond cotizacionesService.list(params), model:[cotizacionesCount: cotizacionesService.count()]
    }

    def show(Long id) { respond cotizacionesService.get(id) }

    def create() { respond new Cotizaciones(params) }

    def save(Cotizaciones cotizaciones) 
    {
        cotizaciones.productora = MaestroProductora.findByUsuarioId(springSecurityService.currentUser.id)
        
        try { cotizacionesService.save(cotizaciones) } 

        catch (ValidationException e) 
        {
            respond cotizaciones.errors, view:'create'
            return
        }

        flash.message = "Tu cotizacion se ha realizado con exito. La respuesta del proveedor llegara a tu correo."
        redirect action:'index'     
    }

    def edit(Long id) { respond cotizacionesService.get(id) }

    def update(Cotizaciones cotizaciones) 
    {
        try { cotizacionesService.save(cotizaciones) } 
        
        catch (ValidationException e) 
        {
            respond cotizaciones.errors, view:'edit'
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'cotizaciones.label', default: 'Cotizaciones'), cotizaciones.id])
        redirect cotizaciones
    }

    def delete(Long id) 
    {
        cotizacionesService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'cotizaciones.label', default: 'Cotizaciones'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }
}