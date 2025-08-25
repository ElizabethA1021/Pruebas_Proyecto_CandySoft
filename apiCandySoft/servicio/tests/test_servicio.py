import unittest
from servicio.models import Servicio
from datetime import timedelta

class Style:
    SUCCESS = '\033[94m'  # Azul
    ERROR = '\033[93m'    # Amarillo
    RESET = '\033[0m'

class TestServicio(unittest.TestCase):
    def test_crear_servicio_semipermanente(self):
        try:
            # Crear servicio con datos personalizados
            servicio = Servicio.objects.create(
                nombre="Esmaltado Semipermanente",
                descripcion="Color duradero hasta 3 semanas con acabado brillante.",
                precio=95000.00,
                duracion=timedelta(minutes=75),  # 1 hora 15 min
                tipo="Manicure",  # Ajustado según lo solicitado
                url_imagen="https://example.com/imagenes/esmaltado_semipermanente.jpg"
            )

            # Validaciones
            self.assertEqual(servicio.nombre, "Esmaltado Semipermanente")
            self.assertEqual(servicio.precio, 95000.00)
            self.assertEqual(servicio.duracion, timedelta(minutes=75))
            self.assertEqual(servicio.tipo, "Manicure")  
            self.assertTrue(servicio.url_imagen.startswith("https://"))

            print(f"{Style.SUCCESS}✔ Éxito: '{servicio.nombre}' agregado correctamente al sistema.{Style.RESET}")

        except Exception as err:
            print(f"{Style.ERROR}⚠ Error inesperado al crear el servicio: {err}{Style.RESET}")
            raise err


if __name__ == "__main__":
    unittest.main(verbosity=2)
