# Activar Stripe Payment Links

## Objetivo

Activar botones reales de pago cuando existan los enlaces de Stripe.

La web puede funcionar primero solo por email. Stripe se activa cuando ya tengas los Payment Links reales.

## Antes de activar Stripe

Crear en Stripe los siguientes enlaces:

- Autopsia Express: 49 EUR
- Autopsia Completa: 149 EUR
- Premium + Mercado: 399 EUR
- Express Autopsy: 49 USD
- Full Autopsy: 149 USD
- Premium + Market: 399 USD

## Regla comercial recomendada

Aunque existan botones de pago, mantener visible la advertencia:

Antes de pagar, envia tu caso por email para confirmar que encaja.

Esto evita pagos de casos que no se puedan aceptar.

## Activar enlaces

Ejemplo:

.\scripts\configurar-stripe-links.ps1 `
  -EsExpress "https://buy.stripe.com/ENLACE_REAL_EXPRESS_ES" `
  -EsCompleta "https://buy.stripe.com/ENLACE_REAL_COMPLETA_ES" `
  -EsPremium "https://buy.stripe.com/ENLACE_REAL_PREMIUM_ES" `
  -EnExpress "https://buy.stripe.com/ENLACE_REAL_EXPRESS_EN" `
  -EnFull "https://buy.stripe.com/ENLACE_REAL_FULL_EN" `
  -EnPremium "https://buy.stripe.com/ENLACE_REAL_PREMIUM_EN"

## Revisar antes de publicar

Abrir:

- pago-seguro.html
- en/secure-payment.html

Comprobar:

- Los botones llevan a Stripe.
- Los precios son correctos.
- El texto de consultar antes de pagar sigue siendo claro.
- No hay enlaces de prueba por error.

## Publicar

.\scripts\publicar.ps1 -Mensaje "Activar enlaces reales de Stripe Payment Links"

## Desactivar temporalmente

Si hay dudas, volver a dejar los botones apuntando a:

- contacto.html
- en/contact.html

No borrar la advertencia de confirmacion previa.
