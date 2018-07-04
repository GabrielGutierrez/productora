package transaccionales

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class TareasController {

    TareasService tareasService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond tareasService.list(params), model:[tareasCount: tareasService.count()]
    }

    def show(Long id) {
        respond tareasService.get(id)
    }

    def create() {
        respond new Tareas(params)
    }

    def save(Tareas tareas) {
        if (tareas == null) {
            notFound()
            return
        }

        try {
            tareasService.save(tareas)
        } catch (ValidationException e) {
            respond tareas.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'tareas.label', default: 'Tareas'), tareas.id])
                redirect tareas
            }
            '*' { respond tareas, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond tareasService.get(id)
    }

    def update(Tareas tareas) {
        if (tareas == null) {
            notFound()
            return
        }

        try {
            tareasService.save(tareas)
        } catch (ValidationException e) {
            respond tareas.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'tareas.label', default: 'Tareas'), tareas.id])
                redirect tareas
            }
            '*'{ respond tareas, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        tareasService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'tareas.label', default: 'Tareas'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'tareas.label', default: 'Tareas'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
