package transaccionales

import grails.testing.mixin.integration.Integration
import grails.gorm.transactions.Rollback
import spock.lang.Specification
import org.hibernate.SessionFactory

@Integration
@Rollback
class PresupuestosServiceSpec extends Specification {

    PresupuestosService presupuestosService
    SessionFactory sessionFactory

    private Long setupData() {
        // TODO: Populate valid domain instances and return a valid ID
        //new Presupuestos(...).save(flush: true, failOnError: true)
        //new Presupuestos(...).save(flush: true, failOnError: true)
        //Presupuestos presupuestos = new Presupuestos(...).save(flush: true, failOnError: true)
        //new Presupuestos(...).save(flush: true, failOnError: true)
        //new Presupuestos(...).save(flush: true, failOnError: true)
        assert false, "TODO: Provide a setupData() implementation for this generated test suite"
        //presupuestos.id
    }

    void "test get"() {
        setupData()

        expect:
        presupuestosService.get(1) != null
    }

    void "test list"() {
        setupData()

        when:
        List<Presupuestos> presupuestosList = presupuestosService.list(max: 2, offset: 2)

        then:
        presupuestosList.size() == 2
        assert false, "TODO: Verify the correct instances are returned"
    }

    void "test count"() {
        setupData()

        expect:
        presupuestosService.count() == 5
    }

    void "test delete"() {
        Long presupuestosId = setupData()

        expect:
        presupuestosService.count() == 5

        when:
        presupuestosService.delete(presupuestosId)
        sessionFactory.currentSession.flush()

        then:
        presupuestosService.count() == 4
    }

    void "test save"() {
        when:
        assert false, "TODO: Provide a valid instance to save"
        Presupuestos presupuestos = new Presupuestos()
        presupuestosService.save(presupuestos)

        then:
        presupuestos.id != null
    }
}
