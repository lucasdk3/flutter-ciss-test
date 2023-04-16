import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ciss_test/ciss_test_exports.dart';

void main() {
  group('SplashBloc', () {
    test('emits SplashLoading and Authorized when SplashInitEvent is added',
        () {
      final bloc = SplashBloc();

      emitsInOrder([
        SplashLoading(),
        Authorized(),
      ]);

      bloc.add(SplashInitEvent());
    });
  });
}
