package transaccionales

import grails.gorm.services.Service

@Service(ListadoEventos)
interface ListadoEventosService {

    ListadoEventos get(Serializable id)

    List<ListadoEventos> list(Map args)

    Long count()

    void delete(Serializable id)

    ListadoEventos save(ListadoEventos listadoEventos)

}