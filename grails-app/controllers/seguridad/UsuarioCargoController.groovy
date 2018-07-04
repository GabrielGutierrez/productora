package seguridad

import grails.plugin.springsecurity.annotation.Secured
import services.seguridad.*
import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

@Secured('ROLE_ADMIN')
class UsuarioCargoController {

    UsuarioCargoService usuarioCargoService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        println "${usuarioCargoService.list(params)}"
        respond usuarioCargoService.list(params), model:[usuarioCargoCount: usuarioCargoService.count()]
    }

    def show(Long id) {
        respond usuarioCargoService.get(id)
    }

    def create() {
        respond new UsuarioCargo(params)
    }

    def save(UsuarioCargo usuarioCargo) {
        if (usuarioCargo == null) {
            notFound()
            return
        }

        try {
            usuarioCargoService.save(usuarioCargo)
        } catch (ValidationException e) {
            respond usuarioCargo.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'usuarioCargo.label', default: 'UsuarioCargo'), usuarioCargo.id])
                redirect action:'index'
            }
            '*' { respond usuarioCargo, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond usuarioCargoService.get(id)
    }

    def update(UsuarioCargo usuarioCargo) {
        if (usuarioCargo == null) {
            notFound()
            return
        }

        try {
            usuarioCargoService.save(usuarioCargo)
        } catch (ValidationException e) {
            respond usuarioCargo.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'usuarioCargo.label', default: 'UsuarioCargo'), usuarioCargo.id])
                redirect usuarioCargo
            }
            '*'{ respond usuarioCargo, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        usuarioCargoService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'usuarioCargo.label', default: 'UsuarioCargo'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'usuarioCargo.label', default: 'UsuarioCargo'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
