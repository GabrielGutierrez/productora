package transaccionales

import grails.testing.mixin.integration.Integration
import grails.gorm.transactions.Rollback
import spock.lang.Specification
import org.hibernate.SessionFactory

@Integration
@Rollback
class TareasServiceSpec extends Specification {

    TareasService tareasService
    SessionFactory sessionFactory

    private Long setupData() {
        // TODO: Populate valid domain instances and return a valid ID
        //new Tareas(...).save(flush: true, failOnError: true)
        //new Tareas(...).save(flush: true, failOnError: true)
        //Tareas tareas = new Tareas(...).save(flush: true, failOnError: true)
        //new Tareas(...).save(flush: true, failOnError: true)
        //new Tareas(...).save(flush: true, failOnError: true)
        assert false, "TODO: Provide a setupData() implementation for this generated test suite"
        //tareas.id
    }

    void "test get"() {
        setupData()

        expect:
        tareasService.get(1) != null
    }

    void "test list"() {
        setupData()

        when:
        List<Tareas> tareasList = tareasService.list(max: 2, offset: 2)

        then:
        tareasList.size() == 2
        assert false, "TODO: Verify the correct instances are returned"
    }

    void "test count"() {
        setupData()

        expect:
        tareasService.count() == 5
    }

    void "test delete"() {
        Long tareasId = setupData()

        expect:
        tareasService.count() == 5

        when:
        tareasService.delete(tareasId)
        sessionFactory.currentSession.flush()

        then:
        tareasService.count() == 4
    }

    void "test save"() {
        when:
        assert false, "TODO: Provide a valid instance to save"
        Tareas tareas = new Tareas()
        tareasService.save(tareas)

        then:
        tareas.id != null
    }
}
