package maestros

import seguridad.Usuario
import transaccionales.Imagenes
import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*
import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN', 'ROLE_PRODUCTOR'])
class MaestroProductoraController 
{
    def springSecurityService

    MaestroProductoraService maestroProductoraService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) 
    {
        params.max = 10

        respond maestroProductoraService.list(params), model:[maestroProductoraCount: maestroProductoraService.count()]
    }

    def show(Long id) { respond maestroProductoraService.get(id) }

    def create() { respond new MaestroProductora(params) }

    def save(MaestroProductora productora) 
    {
        productora.usuarioId = springSecurityService.currentUser.id

        try { maestroProductoraService.save(productora) } 

        catch (ValidationException e) 
        {
            println "EXCEPCION: $e"

            respond productora.errors, view:'create'
            return
        }

        flash.message = "Los datos de la productora se han actualizado exitosamente."
        redirect springSecurityService.currentUser
    }

    def edit(Long id) { respond maestroProductoraService.get(id) }

    def update(MaestroProductora productora) 
    {
        try { maestroProductoraService.save(productora) } 
        
        catch (ValidationException e) 
        {
            respond productora.errors, view:'edit'
            return
        }

        flash.message = "La productora se ha actualizado exitosamente."
        redirect Usuario.get(productora.usuarioId)
    }

    def delete(Long id) 
    {
        if (id == null) {
            notFound()
            return
        }

        maestroProductoraService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'maestroProductora.label', default: 'MaestroProductora'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    def agregarImagen()
    {
        def productora = MaestroProductora.get(params.productora)

        new Imagenes(imagen:params.imagen.bytes, productora:productora).save flush:true, failOnError:true

        redirect Usuario.get(productora.usuarioId)
    }

    def eliminarImagen()
    {
        def imagen = Imagenes.get(params.id)

        imagen.delete flush:true

        flash.message = "La imagen se ha eliminado exitosamente."
        redirect Usuario.get(imagen.productora.usuarioId)
    }
}