package seguridad

import transaccionales.Imagenes

import grails.plugin.springsecurity.annotation.Secured
import services.seguridad.*
import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

@Secured(['ROLE_ADMIN', 'ROLE_PRODUCTOR', 'ROLE_PROVEEDOR'])
class UsuarioController 
{
    UsuarioService usuarioService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) 
    {
        params.max = 10
        respond usuarioService.list(params), model:[usuarioCount: usuarioService.count()]
    }

    def show(Long id) { respond usuarioService.get(id) }

    def create() { respond new Usuario(params) }

    def save(Usuario usuario) 
    {        
        try {
            usuarioService.save(usuario)
        } catch (ValidationException e) {
            respond usuario.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'usuario.label', default: 'Usuario'), usuario.id])
                redirect usuario
            }
            '*' { respond usuario, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond usuarioService.get(id)
    }

    def update(Usuario usuario) 
    {
        try { usuarioService.save(usuario) } 

        catch (ValidationException e) 
        {
            respond usuario.errors, view:'edit'
            return
        }

        flash.message = "Has actualizado correctamente tu perfil."

        redirect usuario
    }

    def delete(Long id) 
    {
        if (id == null) {
            notFound()
            return
        }

        usuarioService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'usuario.label', default: 'Usuario'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    def mostrarImagen = 
    {
        def foto = Imagenes.get(params.id)
        response.outputStream << foto.imagen
        response.outputStream.flush()
    }
}