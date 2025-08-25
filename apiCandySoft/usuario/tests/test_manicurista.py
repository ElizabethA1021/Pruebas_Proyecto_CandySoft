import unittest
from usuario.models.usuario import Usuario
from usuario.models.manicurista import Manicurista
from rol.models import Rol

class Colors:
    OKBLUE = '\033[94m'    # Azul para éxito
    WARNING = '\033[93m'   # Amarillo para error
    RESET = '\033[0m'

class TestManicurista(unittest.TestCase):
    def test_crear_y_validar_manicurista(self):
        try:
            # Crear rol si no existe
            rol, _ = Rol.objects.get_or_create(nombre="Manicurista")

            # Crear usuario asociado
            user = Usuario.objects.create_user(
                username="karla_gar",
                password="karla123*",
                nombre="Karla",
                apellido="García",
                correo="karla.garcia@example.com",
                rol_id=rol
            )

            # Crear manicurista relacionado con el usuario
            manicurista = Manicurista.objects.create(
                usuario=user,
                nombre="Karla",
                apellido="García",
                tipo_documento="CC",
                numero_documento="1098765432",
                correo="karla.garcia@example.com",
                celular="3007896541",
                fecha_nacimiento="1998-07-15",
                fecha_contratacion="2022-11-10"
            )

            # Validaciones principales
            self.assertEqual(manicurista.nombre, "Karla")
            self.assertEqual(manicurista.apellido, "García")
            self.assertEqual(manicurista.correo, "karla.garcia@example.com")
            self.assertEqual(user.username, "karla_gar")
            self.assertEqual(manicurista.usuario.rol_id.nombre, "Manicurista")

            print(f"{Colors.OKBLUE}✔ Manicurista creado y validado correctamente: {user.username}{Colors.RESET}")

        except Exception as e:
            print(f"{Colors.WARNING}⚠ Error al registrar la manicurista: {e}{Colors.RESET}")
            raise e


if __name__ == "__main__":
    unittest.main(verbosity=2)
