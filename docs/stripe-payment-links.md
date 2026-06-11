# Configuracion de Stripe Payment Links - Autopsia Digital

## Recomendacion

Usar Stripe Payment Links, no una integracion completa con API.

Motivo:

- No requiere backend.
- Funciona con GitHub Pages.
- Permite crear enlaces de pago desde el panel de Stripe.
- Permite compartir enlaces por email.
- Permite insertar botones de pago en la web mas adelante.

## Links que hay que crear

### EUR

1. Autopsia Express
   - Precio: 49 EUR
   - Tipo: pago unico
   - Descripcion: Diagnostico breve para ideas, landings o productos pequenos.

2. Autopsia Completa
   - Precio: 149 EUR
   - Tipo: pago unico
   - Descripcion: Informe completo para productos digitales que no venden o no convierten.

3. Autopsia Premium + Estudio de Mercado Estrategico
   - Precio: 399 EUR
   - Tipo: pago unico
   - Descripcion: Diagnostico profundo con estudio de mercado estrategico y plan de accion.

### USD

1. Express Autopsy
   - Price: 49 USD
   - Type: one-time payment

2. Full Autopsy
   - Price: 149 USD
   - Type: one-time payment

3. Premium Autopsy + Strategic Market Study
   - Price: 399 USD
   - Type: one-time payment

## Datos recomendados a recoger en Stripe

- Email del cliente.
- Nombre del cliente.
- Nombre de empresa, si aplica.
- Direccion de facturacion, si aplica.
- Telefono solo si realmente hace falta.

## Regla operativa

No enviar link de pago hasta confirmar por email:

- Que el producto encaja.
- Que el cliente entiende el alcance.
- Que el plan elegido es correcto.
- Que el precio y plazo estan claros.

## Enlaces reales

Pegar aqui los enlaces cuando existan:

STRIPE_ES_EXPRESS=
STRIPE_ES_COMPLETA=
STRIPE_ES_PREMIUM=

STRIPE_EN_EXPRESS=
STRIPE_EN_FULL=
STRIPE_EN_PREMIUM=

## Flujo recomendado

1. Cliente escribe por email.
2. Se registra como lead.
3. Se revisa si encaja.
4. Se recomienda plan.
5. Se envia link de Stripe correspondiente.
6. Tras el pago, se crea caso privado local.
7. Se realiza la Autopsia Digital.
8. Se entrega informe.

## Nota fiscal

Revisar con asesoria la forma correcta de facturar y declarar ingresos antes de operar de forma continuada.
