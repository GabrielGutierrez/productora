package maestros

import grails.gorm.services.Service

@Service(MaestroProveedor)
interface MaestroProveedorService {

    MaestroProveedor get(Serializable id)

    List<MaestroProveedor> list(Map args)

    Long count()

    void delete(Serializable id)

    MaestroProveedor save(MaestroProveedor maestroProveedor)

}