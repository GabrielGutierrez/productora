package maestros

import grails.testing.mixin.integration.Integration
import grails.gorm.transactions.Rollback
import spock.lang.Specification
import org.hibernate.SessionFactory

@Integration
@Rollback
class MaestroProductoraServiceSpec extends Specification {

    MaestroProductoraService maestroProductoraService
    SessionFactory sessionFactory

    private Long setupData() {
        // TODO: Populate valid domain instances and return a valid ID
        //new MaestroProductora(...).save(flush: true, failOnError: true)
        //new MaestroProductora(...).save(flush: true, failOnError: true)
        //MaestroProductora maestroProductora = new MaestroProductora(...).save(flush: true, failOnError: true)
        //new MaestroProductora(...).save(flush: true, failOnError: true)
        //new MaestroProductora(...).save(flush: true, failOnError: true)
        assert false, "TODO: Provide a setupData() implementation for this generated test suite"
        //maestroProductora.id
    }

    void "test get"() {
        setupData()

        expect:
        maestroProductoraService.get(1) != null
    }

    void "test list"() {
        setupData()

        when:
        List<MaestroProductora> maestroProductoraList = maestroProductoraService.list(max: 2, offset: 2)

        then:
        maestroProductoraList.size() == 2
        assert false, "TODO: Verify the correct instances are returned"
    }

    void "test count"() {
        setupData()

        expect:
        maestroProductoraService.count() == 5
    }

    void "test delete"() {
        Long maestroProductoraId = setupData()

        expect:
        maestroProductoraService.count() == 5

        when:
        maestroProductoraService.delete(maestroProductoraId)
        sessionFactory.currentSession.flush()

        then:
        maestroProductoraService.count() == 4
    }

    void "test save"() {
        when:
        assert false, "TODO: Provide a valid instance to save"
        MaestroProductora maestroProductora = new MaestroProductora()
        maestroProductoraService.save(maestroProductora)

        then:
        maestroProductora.id != null
    }
}
