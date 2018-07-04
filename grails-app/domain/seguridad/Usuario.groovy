package seguridad

import groovy.transform.EqualsAndHashCode
import groovy.transform.ToString
import grails.compiler.GrailsCompileStatic

@GrailsCompileStatic
@EqualsAndHashCode(includes='username')
@ToString(includes='username', includeNames=true, includePackage=false)
class Usuario implements Serializable 
{

    private static final long serialVersionUID = 1

    String nombre
    String apellido
    String direccion
    String correo
    String telefono
    String username
    String password
    boolean enabled = true
    boolean accountExpired
    boolean accountLocked
    boolean passwordExpired

    String toString() { return "${this.username}" }

    Set<Cargo> getAuthorities() { (UsuarioCargo.findAllByUsuario(this) as List<UsuarioCargo>)*.cargo as Set<Cargo> }

    static constraints = 
    {
        password  nullable: false, blank: false, password: true
        username  nullable: false, blank: false, unique: true
        nombre    nullable: true
        apellido  nullable: true
        direccion nullable: true
        correo    nullable: true
        telefono  nullable: true
    }

    static mapping = { password column: '`password`' }
}