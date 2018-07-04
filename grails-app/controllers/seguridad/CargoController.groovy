package seguridad

import grails.plugin.springsecurity.annotation.Secured
import services.seguridad.*
import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

@Secured('ROLE_ADMIN')
class CargoController {

    CargoService cargoService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond cargoService.list(params), model:[cargoCount: cargoService.count()]
    }

    def show(Long id) {
        respond cargoService.get(id)
    }

    def create() {
        respond new Cargo(params)
    }

    def save(Cargo cargo) {
        if (cargo == null) {
            notFound()
            return
        }

        try {
            cargoService.save(cargo)
        } catch (ValidationException e) {
            respond cargo.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'cargo.label', default: 'Cargo'), cargo.id])
                redirect cargo
            }
            '*' { respond cargo, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond cargoService.get(id)
    }

    def update(Cargo cargo) {
        if (cargo == null) {
            notFound()
            return
        }

        try {
            cargoService.save(cargo)
        } catch (ValidationException e) {
            respond cargo.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'cargo.label', default: 'Cargo'), cargo.id])
                redirect cargo
            }
            '*'{ respond cargo, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        cargoService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'cargo.label', default: 'Cargo'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'cargo.label', default: 'Cargo'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
