import 'package:flutter_explained_calculator/main.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group("Calculator App", () {
    testWidgets("result should start at 0", (WidgetTester tester) async {
      await tester.pumpWidget(MyApp());
      await tester.pumpAndSettle();
      expect(find.text("0"), findsNWidgets(2));
    });

    testWidgets('calculate 5 + 8', (WidgetTester tester) async {
      await tester.pumpWidget(MyApp());
      await tester.pumpAndSettle();
      await tester.tap(find.text("5"));
      await Future.delayed(Duration(seconds: 1));
      await tester.pumpAndSettle();
      await tester.tap(find.text("+"));
      await Future.delayed(Duration(seconds: 1));
      await tester.pumpAndSettle();
      await tester.tap(find.text("8"));
      await Future.delayed(Duration(seconds: 1));
      await tester.pumpAndSettle();
      await tester.tap(find.text("="));
      await Future.delayed(Duration(seconds: 1));
      await tester.pumpAndSettle();

      expect(find.text('13,0'), findsOneWidget);
    });
  });
}
