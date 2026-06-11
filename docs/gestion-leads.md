# Gestion de leads - Autopsia Digital

## Objetivo

Registrar localmente a las personas que escriben interesadas en Autopsia Digital / Product Autopsy AI.

Los datos reales no se suben a GitHub.

Se guardan en:

_clientes_privado/leads.csv

## Registrar un nuevo interesado

Ejemplo:

.\scripts\nuevo-lead.ps1 -Nombre "Juan Perez" -Email "juan@example.com" -Producto "Mi App" -Origen "LinkedIn" -Plan "Completa"

## Ver leads registrados

.\scripts\listar-leads.ps1

## Estados recomendados

- Nuevo
- Respondido
- Pendiente de informacion
- Plan recomendado
- Confirmado
- Perdido
- Convertido en cliente

## Regla importante

No copiar datos reales de leads en README, documentos publicos, issues de GitHub ni publicaciones.

## Proceso recomendado

1. Llega email a aambroj@yahoo.es.
2. Registrar lead con nuevo-lead.ps1.
3. Responder usando plantilla de email.
4. Si envia informacion suficiente, crear caso privado con nuevo-caso-autopsia.ps1.
5. Actualizar estado manualmente en _clientes_privado/leads.csv.
