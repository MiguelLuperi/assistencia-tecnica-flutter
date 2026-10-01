import 'package:flutter/material.dart';
import '../../components/editor.dart';
import '../../models/reparo.dart';

class FormularioReparo extends StatefulWidget {
  const FormularioReparo({super.key});

  @override
  State<FormularioReparo> createState() => FormularioReparoState();
}

class FormularioReparoState extends State<FormularioReparo> {
  final TextEditingController _controladorOrdemServico = TextEditingController();
  final TextEditingController _controladorValor = TextEditingController();

  static const _tituloAppBar = 'Novo Reparo';
  static const _rotuloOrdemServico = 'Ordem de serviço';
  static const _dicaOrdemServico = '0000';
  static const _rotuloValor = 'Valor do reparo';
  static const _dicaValor = '0.00';
  static const _textoBotaoConfirmar = 'Registrar reparo';

  @override
  void dispose() {
    _controladorOrdemServico.dispose();
    _controladorValor.dispose();
    super.dispose();
  }

  void _criaReparo() {
    final int? ordemServico = int.tryParse(_controladorOrdemServico.text);
    final double? valor =
        double.tryParse(_controladorValor.text.replaceAll(',', '.'));

    if (ordemServico != null && valor != null) {
      Navigator.pop(context, Reparo(valor, ordemServico));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Informe a ordem de serviço e o valor com números válidos.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(_tituloAppBar)),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(
              controlador: _controladorOrdemServico,
              rotulo: _rotuloOrdemServico,
              dica: _dicaOrdemServico,
            ),
            Editor(
              controlador: _controladorValor,
              rotulo: _rotuloValor,
              dica: _dicaValor,
              icone: Icons.build,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: _criaReparo,
                child: const Text(_textoBotaoConfirmar),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
