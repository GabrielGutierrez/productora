package maestros

import grails.gorm.services.Service

@Service(MaestroProductora)
interface MaestroProductoraService {

    MaestroProductora get(Serializable id)

    List<MaestroProductora> list(Map args)

    Long count()

    void delete(Serializable id)

    MaestroProductora save(MaestroProductora maestroProductora)

}