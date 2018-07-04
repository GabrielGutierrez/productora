package maestros

import grails.testing.mixin.integration.Integration
import grails.gorm.transactions.Rollback
import spock.lang.Specification
import org.hibernate.SessionFactory

@Integration
@Rollback
class MaestroProveedorServiceSpec extends Specification {

    MaestroProveedorService maestroProveedorService
    SessionFactory sessionFactory

    private Long setupData() {
        // TODO: Populate valid domain instances and return a valid ID
        //new MaestroProveedor(...).save(flush: true, failOnError: true)
        //new MaestroProveedor(...).save(flush: true, failOnError: true)
        //MaestroProveedor maestroProveedor = new MaestroProveedor(...).save(flush: true, failOnError: true)
        //new MaestroProveedor(...).save(flush: true, failOnError: true)
        //new MaestroProveedor(...).save(flush: true, failOnError: true)
        assert false, "TODO: Provide a setupData() implementation for this generated test suite"
        //maestroProveedor.id
    }

    void "test get"() {
        setupData()

        expect:
        maestroProveedorService.get(1) != null
    }

    void "test list"() {
        setupData()

        when:
        List<MaestroProveedor> maestroProveedorList = maestroProveedorService.list(max: 2, offset: 2)

        then:
        maestroProveedorList.size() == 2
        assert false, "TODO: Verify the correct instances are returned"
    }

    void "test count"() {
        setupData()

        expect:
        maestroProveedorService.count() == 5
    }

    void "test delete"() {
        Long maestroProveedorId = setupData()

        expect:
        maestroProveedorService.count() == 5

        when:
        maestroProveedorService.delete(maestroProveedorId)
        sessionFactory.currentSession.flush()

        then:
        maestroProveedorService.count() == 4
    }

    void "test save"() {
        when:
        assert false, "TODO: Provide a valid instance to save"
        MaestroProveedor maestroProveedor = new MaestroProveedor()
        maestroProveedorService.save(maestroProveedor)

        then:
        maestroProveedor.id != null
    }
}
