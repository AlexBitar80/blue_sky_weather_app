import 'package:blue_sky/routes/routes.dart';
import 'package:blue_sky/weather/presentation/pages/blueSkyOnboardingPage/blue_sky_onboarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('should test navigation during onboarding',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        routes: {
          AppRoutes.weatherHome: (context) => const Scaffold(
                body: Center(child: Text('Tela Inicial')),
              ),
        },
        home: const BlueSkyOnboardingPage(),
      ),
    );

    // Verifica se a primeira página do onboarding aparece
    expect(find.text('Boas-Vindas ao Blue Sky'), findsOneWidget);

    // Clica no botão "Próximo" para avançar para a próxima página
    await tester.tap(find.byIcon(Icons.arrow_forward));
    await tester.pumpAndSettle();
    expect(find.text('Descubra os Níveis de Umidade'), findsOneWidget);

    // Avança para a terceira página
    await tester.tap(find.byIcon(Icons.arrow_forward));
    await tester.pumpAndSettle();
    expect(find.text('Previsão de Chuvas'), findsOneWidget);

    // Avança para a quarta página
    await tester.tap(find.byIcon(Icons.arrow_forward));
    await tester.pumpAndSettle();
    expect(find.text('Acompanhe o Vento'), findsOneWidget);

    // Avança para a quinta e última página
    await tester.tap(find.byIcon(Icons.arrow_forward));
    await tester.pumpAndSettle();
    expect(find.text('Previsão do Tempo em Tempo Real'), findsOneWidget);

    // Clica no botão "Começar" para finalizar o onboarding
    await tester.tap(find.text('Começar'));
    await tester.pumpAndSettle();

    // Verifica se a navegação para a tela inicial ocorreu
    expect(find.text('Tela Inicial'), findsOneWidget);
  });

  testWidgets('should must skip onboarding by clicking the "Pular" button',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        routes: {
          AppRoutes.weatherHome: (context) => Scaffold(
                backgroundColor: Colors.blue[300],
                body: const Center(
                  child: Text('Tela Inicial'),
                ),
              ),
        },
        home: const BlueSkyOnboardingPage(),
      ),
    );

    // Clica no botão "Pular"
    await tester.tap(find.text('Pular'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Começar'));
    await tester.pumpAndSettle();

    // Verifica se a navegação para a tela inicial ocorreu
    expect(find.text('Tela Inicial'), findsOneWidget);
  });
}
