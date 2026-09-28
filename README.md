# Correção de double click

Script para mouses que dão **double click sozinhos** (switch gasto). Ele ignora
cliques do botão esquerdo que chegam em menos de `LIMIAR_MS` (padrão 80 ms)
depois do anterior.

## Como usar (Windows)

1. Instale o **AutoHotkey v2**: https://www.autohotkey.com/
2. Baixe `corrigir-double-click.ahk` e dê dois cliques nele.
3. Um ícone aparece na bandeja: a correção já está funcionando.

Atalhos:

- `Ctrl+Alt+F12` liga/desliga a correção
- `Ctrl+Alt+F11` fecha o script

### Iniciar junto com o Windows

Pressione `Win+R`, digite `shell:startup` e coloque um atalho do
`corrigir-double-click.ahk` na pasta que abrir.

## Ajuste

Edite `LIMIAR_MS` no início do script:

- ainda dá double click → aumente (ex.: `100` ou `120`)
- seus double clicks de propósito deixaram de funcionar → diminua (ex.: `50`)

> O script contorna o defeito, mas a solução definitiva é trocar o microswitch
> ou o mouse (muitos têm garantia justamente por esse problema).
