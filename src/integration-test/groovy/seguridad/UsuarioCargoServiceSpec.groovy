package seguridad

import grails.testing.mixin.integration.Integration
import grails.gorm.transactions.Rollback
import spock.lang.Specification
import org.hibernate.SessionFactory

@Integration
@Rollback
class UsuarioCargoServiceSpec extends Specification {

    UsuarioCargoService usuarioCargoService
    SessionFactory sessionFactory

    private Long setupData() {
        // TODO: Populate valid domain instances and return a valid ID
        //new UsuarioCargo(...).save(flush: true, failOnError: true)
        //new UsuarioCargo(...).save(flush: true, failOnError: true)
        //UsuarioCargo usuarioCargo = new UsuarioCargo(...).save(flush: true, failOnError: true)
        //new UsuarioCargo(...).save(flush: true, failOnError: true)
        //new UsuarioCargo(...).save(flush: true, failOnError: true)
        assert false, "TODO: Provide a setupData() implementation for this generated test suite"
        //usuarioCargo.id
    }

    void "test get"() {
        setupData()

        expect:
        usuarioCargoService.get(1) != null
    }

    void "test list"() {
        setupData()

        when:
        List<UsuarioCargo> usuarioCargoList = usuarioCargoService.list(max: 2, offset: 2)

        then:
        usuarioCargoList.size() == 2
        assert false, "TODO: Verify the correct instances are returned"
    }

    void "test count"() {
        setupData()

        expect:
        usuarioCargoService.count() == 5
    }

    void "test delete"() {
        Long usuarioCargoId = setupData()

        expect:
        usuarioCargoService.count() == 5

        when:
        usuarioCargoService.delete(usuarioCargoId)
        sessionFactory.currentSession.flush()

        then:
        usuarioCargoService.count() == 4
    }

    void "test save"() {
        when:
        assert false, "TODO: Provide a valid instance to save"
        UsuarioCargo usuarioCargo = new UsuarioCargo()
        usuarioCargoService.save(usuarioCargo)

        then:
        usuarioCargo.id != null
    }
}
