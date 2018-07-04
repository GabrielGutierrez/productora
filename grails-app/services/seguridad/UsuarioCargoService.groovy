package seguridad

import grails.gorm.services.Service

@Service(UsuarioCargo)
interface UsuarioCargoService {

    UsuarioCargo get(Serializable id)

    List<UsuarioCargo> list(Map args)

    Long count()

    void delete(Serializable id)

    UsuarioCargo save(UsuarioCargo usuarioCargo)

}