import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../models/reparo.dart';
import 'formulario.dart';

class ListaReparos extends StatefulWidget {
  const ListaReparos({super.key});

  @override
  State<ListaReparos> createState() => ListaReparosState();
}

class ListaReparosState extends State<ListaReparos> {
  static const _tituloAppBar = 'Ordens de Serviço';

  final List<Reparo> _reparos = [
    Reparo(150.00, 1001),
    Reparo(89.90, 1002),
  ];

  void _atualiza(Reparo? reparoRecebido) {
    if (reparoRecebido != null) {
      Future.delayed(const Duration(seconds: 1), () {
        if (!mounted) return;
        setState(() {
          _reparos.add(reparoRecebido);
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(_tituloAppBar)),
      body: ListView.builder(
        itemCount: _reparos.length,
        itemBuilder: (context, indice) => ItemReparo(_reparos[indice]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push<Reparo>(
            context,
            MaterialPageRoute<Reparo>(
              builder: (context) => const FormularioReparo(),
            ),
          ).then((reparoRecebido) => _atualiza(reparoRecebido));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class ItemReparo extends StatelessWidget {
  final Reparo _reparo;

  const ItemReparo(this._reparo, {super.key});

  @override
  Widget build(BuildContext context) {
    final NumberFormat formatoMoeda =
        NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');

    return Card(
      child: ListTile(
        leading: const Icon(Icons.build),
        title: Text(formatoMoeda.format(_reparo.valor)),
        subtitle: Text('Ordem de serviço: ${_reparo.ordemServico}'),
      ),
    );
  }
}
