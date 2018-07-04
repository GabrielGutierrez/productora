package maestros

import transaccionales.Imagenes
import seguridad.Usuario

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*
import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN', 'ROLE_PRODUCTOR', 'ROLE_PROVEEDOR'])
class MaestroProveedorController 
{
    MaestroProveedorService maestroProveedorService

    def springSecurityService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) 
    {
        params.max = 10

        def proveedores = MaestroProveedor.createCriteria().list(params)
        {
            if(params.descripcion) { ilike('descripcion', '%' + params.descripcion + '%') }
            if(params.razonSocial) { ilike('razonSocial', '%' + params.razonSocial + '%') }
            if(params.servicios) { servicios { ilike('descripcion', '%' + params.servicios + '%') } }
        }

        model:[maestroProveedorCount: maestroProveedorService.count(), maestroProveedorList:proveedores]
    }

    def show(Long id) { respond maestroProveedorService.get(id) }

    def create() { respond new MaestroProveedor(params) }

    def save(MaestroProveedor proveedor) 
    {
        proveedor.usuario = springSecurityService.currentUser
        
        try { maestroProveedorService.save(proveedor) } 

        catch (ValidationException e) 
        {
            respond proveedor.errors, view:'create'
            return
        }

        flash.message = "El proveedor se ha actualizado exitosamente."
        redirect proveedor.usuario
    }

    def edit(Long id) { respond maestroProveedorService.get(id) }

    def update(MaestroProveedor maestroProveedor) 
    {
        try { maestroProveedorService.save(maestroProveedor) } 

        catch (ValidationException e) 
        {
            respond maestroProveedor.errors, view:'edit'
            return
        }

        flash.message = "El Proveedor se ha actualizado exitosamente."
        redirect maestroProveedor
    }

    def delete(Long id) 
    {
        maestroProveedorService.delete(id)

        flash.message = "El proveedor se ha eliminado exitosamente."
        redirect action:"index", method:"GET"
    }

    def agregarImagen()
    {
        def proveedor = MaestroProveedor.get(params.proveedor)

        new Imagenes(imagen:params.imagen.bytes, proveedor:proveedor).save flush:true, failOnError:true

        redirect Usuario.get(proveedor.usuario.id)
    }

    def eliminarImagen()
    {
        def imagen = Imagenes.get(params.id)

        imagen.delete flush:true

        flash.message = "La imagen se ha eliminado exitosamente."
        redirect Usuario.get(imagen.proveedor.usuario.id)
    }

    def agregarServicio()
    {
        def proveedor = MaestroProveedor.get(params.proveedor)

        new MaestroServicios(descripcion:params.servicio, proveedor:proveedor).save flush:true, failOnError:true

        redirect Usuario.get(proveedor.usuario.id)
    }

    def eliminarServicio()
    {
        def servicio = MaestroServicios.get(params.id)

        servicio.delete flush:true

        flash.message = "El servicio se ha eliminado exitosamente."
        redirect Usuario.get(imagen.proveedor.usuario.id)
    }

    def mostrarImagen = 
    {
        def foto = Imagenes.get(params.id)
        response.outputStream << foto.imagen
        response.outputStream.flush()
    }
}