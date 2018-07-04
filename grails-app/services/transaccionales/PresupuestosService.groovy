package transaccionales

import grails.gorm.services.Service

@Service(Presupuestos)
interface PresupuestosService {

    Presupuestos get(Serializable id)

    List<Presupuestos> list(Map args)

    Long count()

    void delete(Serializable id)

    Presupuestos save(Presupuestos presupuestos)

}