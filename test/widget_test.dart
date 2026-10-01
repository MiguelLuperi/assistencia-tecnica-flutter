import 'package:flutter_test/flutter_test.dart';
import 'package:assistencia_tecnica/main.dart';

void main() {
  testWidgets('Mostra a lista de reparos', (tester) async {
    await tester.pumpWidget(const AssistenciaTecnicaApp());
    expect(find.text('Ordens de Serviço'), findsOneWidget);
  });
}
