import unittest
from insumo.models import Insumo, Marca
from django.db import IntegrityError


class Colors:
    OKBLUE = '\033[94m'   
    WARNING = '\033[93m' 
    RESET = '\033[0m'


class TestInsumo(unittest.TestCase):
    def test_crear_insumo_con_estado_automatico(self):
        try:
            
            marca = Marca.objects.create(nombre="CND")

            
            insumo = Insumo.objects.create(
                nombre="Aceite para cutículas",
                stock=8,
                marca_id=marca
            )

            
            self.assertEqual(insumo.nombre, "Aceite para cutículas")
            self.assertEqual(insumo.stock, 8)
            self.assertEqual(insumo.estado, "Activo") 
            self.assertEqual(insumo.marca_id.nombre, "CND")

            print(f"{Colors.OKBLUE}✔ Insumo creado con éxito: {insumo.nombre}, Estado: {insumo.estado}{Colors.RESET}")

        except Exception as e:
            print(f"{Colors.WARNING}⚠ Error al crear insumo: {e}{Colors.RESET}")
            raise e

    def test_estados_automaticos_bajo_y_agotado(self):
        try:
            marca = Marca.objects.create(nombre="Essie")

            
            insumo_bajo = Insumo.objects.create(
                nombre="Toallas desechables",
                stock=4,
                marca_id=marca
            )
            self.assertEqual(insumo_bajo.estado, "Bajo")

            
            insumo_agotado = Insumo.objects.create(
                nombre="Quitaesmalte en gel",
                stock=0,
                marca_id=marca
            )
            self.assertEqual(insumo_agotado.estado, "Agotado")

            print(f"{Colors.OKBLUE}✔ Estados validados: Bajo ({insumo_bajo.estado}), Agotado ({insumo_agotado.estado}){Colors.RESET}")

        except Exception as e:
            print(f"{Colors.WARNING}⚠ Error al validar estados automáticos: {e}{Colors.RESET}")
            raise e

    def test_nombre_no_puede_ser_nulo(self):
        try:
            marca = Marca.objects.create(nombre="Revlon")

            with self.assertRaises(IntegrityError):
                Insumo.objects.create(
                    nombre=None,  
                    stock=15,
                    marca_id=marca
                )

            print(f"{Colors.OKBLUE}✔ Validación correcta: nombre nulo no permitido{Colors.RESET}")

        except Exception as e:
            print(f"{Colors.WARNING}⚠ Error en validación de nombre obligatorio: {e}{Colors.RESET}")
            raise e


if __name__ == "__main__":
    unittest.main(verbosity=2)

