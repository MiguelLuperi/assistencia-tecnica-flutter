# Assistência Técnica

Aplicativo Flutter para controle de reparos de uma assistência técnica, adaptado do Projeto Bank estudado em aula (Programação para Dispositivos Móveis II, FATEC Franca).

## Funcionalidades
- Lista de ordens de serviço com valor do reparo formatado em reais (intl).
- Cadastro de novo reparo (número da ordem de serviço e valor), com validação via tryParse.
- Dados mantidos somente em memória (sem camada database).

## Estrutura
- lib/main.dart
- lib/components/editor.dart
- lib/models/reparo.dart
- lib/screens/reparos/lista.dart
- lib/screens/reparos/formulario.dart

## Como executar
    flutter pub get
    flutter run

## Evidências
- evidencias/formulario.png
- evidencias/lista.png
