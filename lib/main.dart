import 'package:flutter/material.dart';
import 'screens/reparos/lista.dart';

void main() => runApp(const AssistenciaTecnicaApp());

class AssistenciaTecnicaApp extends StatelessWidget {
  const AssistenciaTecnicaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Assistência Técnica',
      theme: ThemeData(colorSchemeSeed: Colors.blueGrey, useMaterial3: true),
      home: const ListaReparos(),
    );
  }
}
