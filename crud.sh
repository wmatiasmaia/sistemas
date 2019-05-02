#!/usr/bin/env bash

# crud.sh - Ferramenta para controle de inventário
#
# Site:       https://wesllenmatias.com.br
# Autor:      Wesllen Matias
# Manutenção: Wesllen Matias
#
# ------------------------------------------------------------------------ #
# Uma ferramenta para controle de inventário.
#
# ------------------------------------------------------------------------ #
# Histórico:
#
#   v0.1 - Versão inicial
# ------------------------------------------------------------------------ #
# Testado em:
#   bash 4.4.19
# ------------------------------------------------------------------------ #

function Cad_Marca() {
  yad --title "Cadastro de Marca" \
  --width=400 \
  --height=200 \
  --center \
  --form \
  --field="Descrição:" \
  --button=gtk-save:0
}

function Cadastro_Modelo() {
  yad --title "Cadastro de Modelo" \
  --width=400 \
  --height=200 \
  --center \
  --form \
  --field="Descrição do Modelo:" \
  --button=gtk-save:0
}

function Entrada() {
  yad --title "Entrada no Inventário" \
  --width=400 \
  --height=200 \
  --center \
  --form \
  --field="Marca":CB DELL\!HP\!MIRANDA \
  --field="Modelo":CB DESKTOP\!NOTEBOOK\!RASPBERRY  \
  --field="Descrição do Equipamento:" \
  --field="Data de entrada:":DT \
  --field="N/S:" \
  --field="Quantidade:":num
}

export -f Cad_Marca
export -f Cadastro_Modelo
export -f Entrada

yad --title "Inventário" \
--width=600 \
--height=400 \
--center \
--buttons-layout start \
--dialog-sep \
--form \
--field="Cadastro de Marcas":fbtn '1' \
--button="Cadastro de Modelo":"bash -c Cadastro_Modelo" \
--button="Cadastrar Entrada":"bash -c Entrada"

case $? in
      1) Cad_Marca;;
esac
