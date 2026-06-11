# Checklist operativo - Autopsia Digital

## Regla principal

No subir nunca a GitHub datos reales de clientes.

Los casos reales deben guardarse solo en:

_clientes_privado/

## Abrir nuevo caso

Ejemplo:

.\scripts\nuevo-caso-autopsia.ps1 -NombreProducto "Producto Demo" -Cliente "Cliente Demo" -Plan "Completa"

## Flujo

1. Recibir email.
2. Pedir informacion si falta.
3. Crear caso privado local.
4. Analizar producto.
5. Calcular Autopsia Digital Score.
6. Redactar informe.
7. Entregar informe.
8. Pedir feedback.
9. Cerrar caso.

## No publicar nunca

- Emails reales.
- Datos personales.
- Metricas privadas.
- Capturas privadas.
- Informes reales.
- URLs privadas.
- Estrategias del cliente.
