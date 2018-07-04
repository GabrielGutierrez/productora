package transaccionales

import grails.testing.mixin.integration.Integration
import grails.gorm.transactions.Rollback
import spock.lang.Specification
import org.hibernate.SessionFactory

@Integration
@Rollback
class CotizacionesServiceSpec extends Specification {

    CotizacionesService cotizacionesService
    SessionFactory sessionFactory

    private Long setupData() {
        // TODO: Populate valid domain instances and return a valid ID
        //new Cotizaciones(...).save(flush: true, failOnError: true)
        //new Cotizaciones(...).save(flush: true, failOnError: true)
        //Cotizaciones cotizaciones = new Cotizaciones(...).save(flush: true, failOnError: true)
        //new Cotizaciones(...).save(flush: true, failOnError: true)
        //new Cotizaciones(...).save(flush: true, failOnError: true)
        assert false, "TODO: Provide a setupData() implementation for this generated test suite"
        //cotizaciones.id
    }

    void "test get"() {
        setupData()

        expect:
        cotizacionesService.get(1) != null
    }

    void "test list"() {
        setupData()

        when:
        List<Cotizaciones> cotizacionesList = cotizacionesService.list(max: 2, offset: 2)

        then:
        cotizacionesList.size() == 2
        assert false, "TODO: Verify the correct instances are returned"
    }

    void "test count"() {
        setupData()

        expect:
        cotizacionesService.count() == 5
    }

    void "test delete"() {
        Long cotizacionesId = setupData()

        expect:
        cotizacionesService.count() == 5

        when:
        cotizacionesService.delete(cotizacionesId)
        sessionFactory.currentSession.flush()

        then:
        cotizacionesService.count() == 4
    }

    void "test save"() {
        when:
        assert false, "TODO: Provide a valid instance to save"
        Cotizaciones cotizaciones = new Cotizaciones()
        cotizacionesService.save(cotizaciones)

        then:
        cotizaciones.id != null
    }
}
