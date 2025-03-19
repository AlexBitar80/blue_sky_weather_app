import 'package:blue_sky/core/data/feilures/feilures.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Failure', () {
    test('should create a default Failure object', () {
      const failure = Failure();
      expect(failure.isWarning, true);
      expect(failure.title, 'Erro');
      expect(failure.message, 'Ops! ');
    });

    test('should create a Failure object with custom values', () {
      const failure = Failure(
        isWarning: false,
        title: 'Custom Title',
        message: 'Custom Message',
      );
      expect(failure.isWarning, false);
      expect(failure.title, 'Custom Title');
      expect(failure.message, 'Custom Message');
    });

    test('should have correct props for Equatable', () {
      const defaultFailure = Failure();
      const customFailure = Failure(
        isWarning: false,
        title: 'Custom Title',
        message: 'Custom Message',
      );

      expect(defaultFailure.props, [true, 'Erro', 'Ops! ']);
      expect(customFailure.props, [false, 'Custom Title', 'Custom Message']);
    });

    test('should implement Exception', () {
      const failure = Failure();
      expect(failure, isA<Exception>());
    });
  });
}
