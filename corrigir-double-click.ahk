; ============================================================
;  Correção de double click fantasma (mouse com switch gasto)
;  Requer AutoHotkey v2: https://www.autohotkey.com/
; ============================================================
;  Um clique que chega poucos ms depois do anterior é tratado
;  como "bounce" do switch e ignorado.
;
;  Ctrl+Alt+F12  -> liga/desliga a correção
;  Ctrl+Alt+F11  -> fecha o script
; ============================================================
#Requires AutoHotkey v2.0
#SingleInstance Force

; Intervalo mínimo (ms) entre soltar o botão e o próximo clique.
; Se ainda der double click, aumente (ex.: 100). Se atrapalhar
; seus double clicks de propósito, diminua (ex.: 50).
LIMIAR_MS := 80

ultimoUp := 0
bloqueado := false

A_IconTip := "Correção de double click (" LIMIAR_MS " ms)"
TrayTip "Correção de double click ativa", "Limiar: " LIMIAR_MS " ms", 1

*LButton:: {
    global ultimoUp, bloqueado
    if (A_TickCount - ultimoUp < LIMIAR_MS) {
        bloqueado := true   ; clique fantasma: ignora
        return
    }
    bloqueado := false
    Send "{Blind}{LButton Down}"
}

*LButton Up:: {
    global ultimoUp, bloqueado
    ultimoUp := A_TickCount
    if bloqueado {
        bloqueado := false
        return
    }
    Send "{Blind}{LButton Up}"
}

^!F12:: {
    Suspend -1
    TrayTip "Correção de double click", A_IsSuspended ? "DESLIGADA" : "LIGADA", 1
}

^!F11::ExitApp
