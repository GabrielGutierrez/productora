package transaccionales

import grails.gorm.services.Service

@Service(Cotizaciones)
interface CotizacionesService {

    Cotizaciones get(Serializable id)

    List<Cotizaciones> list(Map args)

    Long count()

    void delete(Serializable id)

    Cotizaciones save(Cotizaciones cotizaciones)

}