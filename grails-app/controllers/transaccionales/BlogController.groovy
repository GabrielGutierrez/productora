package transaccionales

import maestros.MaestroProveedor

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*
import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN', 'ROLE_PRODUCTOR', 'ROLE_PROVEEDOR'])
class BlogController 
{
    def springSecurityService

    BlogService blogService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) 
    {
        params.max = 10
        respond blogService.list(params), model:[blogCount: blogService.count()]
    }

    def show(Long id) {  }

    def create() { respond new Blog(params) }

    def save(Blog blog) 
    {
        blog.proveedor = MaestroProveedor.findByUsuario(springSecurityService.currentUser)
        
        try { blogService.save(blog) } 
        
        catch (ValidationException e) 
        {
            respond blog.errors, view:'create'
            return
        }

        new Imagenes(imagen:params.imagen.bytes, blog:blog).save flush:true, failOnError:true

        flash.message = "El Articulo se ha creado exitosamente."
        redirect action:'index'
    }

    def edit(Long id) { respond blogService.get(id) }

    def update(Blog blog) 
    {
        try { blogService.save(blog) } 
        
        catch (ValidationException e) 
        {
            respond blog.errors, view:'edit'
            return
        }

        flash.message = "El Articulo del blog se ha actualizado exitosamente."
        redirect action:'index'
    }

    def delete(Long id) 
    {
        Imagenes.findByBlog(Blog.get(id)).delete flush:true
        
        blogService.delete(id)

        flash.message = "El Artículo del Blog se ha eliminado exitosamente."
        redirect action:"index", method:"GET"
    }
}