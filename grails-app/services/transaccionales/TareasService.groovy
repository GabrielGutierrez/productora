package transaccionales

import grails.gorm.services.Service

@Service(Tareas)
interface TareasService {

    Tareas get(Serializable id)

    List<Tareas> list(Map args)

    Long count()

    void delete(Serializable id)

    Tareas save(Tareas tareas)

}