import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group("Calculator App", () {
    final resultTextFinder = find.byValueKey("result");

    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test("result should start at 0", () async {
      expect(await driver.getText(resultTextFinder), "0");
    });

    test('calculate 5 + 8', () async {
      await driver.tap(find.text("5"));
      await Future.delayed(Duration(seconds: 1));
      await driver.tap(find.text("+"));
      await Future.delayed(Duration(seconds: 1));
      await driver.tap(find.text("8"));
      await Future.delayed(Duration(seconds: 1));
      await driver.tap(find.text("="));
      await Future.delayed(Duration(seconds: 1));

      expect(await driver.getText(resultTextFinder), "13.0");
    });
  });
}
