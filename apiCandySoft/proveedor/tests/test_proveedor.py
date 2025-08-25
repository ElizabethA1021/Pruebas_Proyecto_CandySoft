import unittest
from proveedor.models import Proveedor
from django.db import IntegrityError


class Colors:
    OKBLUE = '\033[94m'  
    WARNING = '\033[93m'  
    RESET = '\033[0m'


class TestProveedor(unittest.TestCase):
    def test_crear_proveedor_natural(self):
        try:
            proveedor = Proveedor.objects.create(
                tipo_persona="NATURAL",
                tipo_documento="CC",
                numero_documento="1023456789",
                telefono="3001234567",
                email="proveedor.natural@test.com",
                direccion="Calle 10 #5-23",
                ciudad="Bogotá",
                nombre_representante=None,
                apellido_representante=None
            )

            self.assertEqual(proveedor.tipo_persona, "NATURAL")
            self.assertEqual(proveedor.tipo_documento, "CC")
            self.assertEqual(proveedor.estado, "Activo")
            self.assertEqual(proveedor.numero_documento, "1023456789")

            print(f"{Colors.OKBLUE}✔ Proveedor natural creado correctamente: {proveedor.numero_documento}{Colors.RESET}")

        except Exception as e:
            print(f"{Colors.WARNING}⚠ Error al crear proveedor natural: {e}{Colors.RESET}")
            raise e

    def test_crear_proveedor_juridico(self):
        try:
            proveedor = Proveedor.objects.create(
                tipo_persona="JURIDICA",
                tipo_documento="NIT",
                numero_documento="900123456",
                nombre_empresa="Belleza Total S.A.S",
                telefono="6014567890",
                email="empresa@test.com",
                direccion="Carrera 15 #45-67",
                ciudad="Medellín",
                nombre_representante="Laura",
                apellido_representante="Gómez",
                telefono_representante="3109876543",
                email_representante="laura.gomez@test.com"
            )

            self.assertEqual(proveedor.tipo_persona, "JURIDICA")
            self.assertEqual(proveedor.nombre_empresa, "Belleza Total S.A.S")
            self.assertEqual(proveedor.estado, "Activo")
            self.assertEqual(proveedor.nombre_representante, "Laura")

            print(f"{Colors.OKBLUE}✔ Proveedor jurídico creado correctamente: {proveedor.nombre_empresa}{Colors.RESET}")

        except Exception as e:
            print(f"{Colors.WARNING}⚠ Error al crear proveedor jurídico: {e}{Colors.RESET}")
            raise e

    def test_numero_documento_unico(self):
        try:
            Proveedor.objects.create(
                tipo_persona="NATURAL",
                tipo_documento="CC",
                numero_documento="1111111111",
                telefono="3011111111",
                email="unico1@test.com",
                direccion="Calle 1 #1-1",
                ciudad="Bogotá"
            )

            with self.assertRaises(IntegrityError):
                Proveedor.objects.create(
                    tipo_persona="NATURAL",
                    tipo_documento="CC",
                    numero_documento="1111111111", 
                    telefono="3022222222",
                    email="unico2@test.com",
                    direccion="Calle 2 #2-2",
                    ciudad="Bogotá"
                )

            print(f"{Colors.OKBLUE}✔ Validación correcta: número de documento único{Colors.RESET}")

        except Exception as e:
            print(f"{Colors.WARNING}⚠ Error en validación de número de documento único: {e}{Colors.RESET}")
            raise e

    def test_email_unico(self):
        try:
            Proveedor.objects.create(
                tipo_persona="NATURAL",
                tipo_documento="CC",
                numero_documento="2222222222",
                telefono="3033333333",
                email="correo_unico@test.com",
                direccion="Calle 3 #3-3",
                ciudad="Cali"
            )

            with self.assertRaises(IntegrityError):
                Proveedor.objects.create(
                    tipo_persona="NATURAL",
                    tipo_documento="CC",
                    numero_documento="3333333333",
                    telefono="3044444444",
                    email="correo_unico@test.com", 
                    direccion="Calle 4 #4-4",
                    ciudad="Cali"
                )

            print(f"{Colors.OKBLUE}✔ Validación correcta: email único{Colors.RESET}")

        except Exception as e:
            print(f"{Colors.WARNING}⚠ Error en validación de email único: {e}{Colors.RESET}")
            raise e


if __name__ == "__main__":
    unittest.main(verbosity=2)

