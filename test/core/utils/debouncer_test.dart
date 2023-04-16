import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ciss_test/ciss_test_exports.dart';

void main() {
  group('Debouncer', () {
    testWidgets('calls callback after delay', (tester) async {
      var called = false;
      final debouncer = Debouncer(milliseconds: 100);

      debouncer(() {
        called = true;
      });

      // Ensure the callback hasn't been called yet
      expect(called, false);

      // Wait for the delay to expire
      await tester.pump(const Duration(milliseconds: 100));

      // Ensure the callback has been called
      expect(called, true);
    });

    testWidgets('cancels previous callback', (tester) async {
      var callCount = 0;
      final debouncer = Debouncer(milliseconds: 100);

      // Schedule first callback
      debouncer(() {
        callCount++;
      });

      // Schedule second callback (should cancel first callback)
      debouncer(() {
        callCount++;
      });

      // Wait for the delay to expire
      await tester.pump(const Duration(milliseconds: 100));

      // Ensure only the second callback was called
      expect(callCount, 1);
    });
  });
}
