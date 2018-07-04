package myapp

import seguridad.*

class BootStrap 
{
    def init = 
    { 
		def adminRole = new Cargo(authority: 'ROLE_ADMIN').save()
        def proveedorRole = new Cargo(authority: 'ROLE_PROVEEDOR').save()
        def productorRole = new Cargo(authority: 'ROLE_PRODUCTOR').save()

        def testUser = new Usuario(username: 'yo', password: '12345').save()
        def testUser2 = new Usuario(username: 'proveedor', password: '12345').save()
        def testUser3 = new Usuario(username: 'productor', password: '12345').save()
	    
	    UsuarioCargo.create testUser, adminRole
        UsuarioCargo.create testUser2, proveedorRole
        UsuarioCargo.create testUser3, productorRole
	    
	    UsuarioCargo.withSession 
	    {
            it.flush()
            it.clear()
        }

        assert Usuario.count() == 3
        assert Cargo.count() == 3
        assert UsuarioCargo.count() == 3
    }

    def destroy = {  }
}