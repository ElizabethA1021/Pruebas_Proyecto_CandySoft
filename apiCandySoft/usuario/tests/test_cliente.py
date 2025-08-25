import unittest
from usuario.models.usuario import Usuario
from usuario.models.cliente import Cliente
from rol.models import Rol

class Colors:
    OKBLUE = '\033[94m'  
    WARNING = '\033[93m'  
    ENDC = '\033[0m'

class TestCliente(unittest.TestCase):
    def test_registro_cliente(self):
        """
        Prueba la creación de un cliente asociado a un usuario y rol 'Cliente'.
        """

        try:
            
            rol_cliente, _ = Rol.objects.get_or_create(nombre="Cliente")

           
            usuario = Usuario.objects.create_user(
                username="Carlos_R",
                password="car12345**",
                nombre="Carlos",
                apellido="Ramirez",
                correo="carlos.ramirez@example.com",
                rol_id=rol_cliente
            )

            
            cliente = Cliente.objects.create(
                usuario=usuario,
                nombre="Carlos",
                apellido="Ramirez",
                tipo_documento="CC",
                numero_documento="1010234567",
                correo="carlos.ramirez@example.com",
                celular="3204567890"
            )

            
            self.assertEqual(cliente.nombre, "Carlos")
            self.assertEqual(cliente.apellido, "Ramirez")
            self.assertEqual(cliente.correo, "carlos.ramirez@example.com")
            self.assertEqual(usuario.username, "Carlos_R")

            print(f"{Colors.OKBLUE}✓ Cliente registrado exitosamente: {usuario.username}{Colors.ENDC}")

        except Exception as e:
            print(f"{Colors.WARNING}✗ Fallo al registrar cliente: {e}{Colors.ENDC}")
            raise e

if __name__ == "__main__":
    unittest.main(verbosity=2)

