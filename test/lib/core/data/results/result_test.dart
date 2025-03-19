import 'package:blue_sky/core/data/feilures/feilures.dart';
import 'package:blue_sky/core/data/results/result.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_test/flutter_test.dart';

class TestFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class TestData extends Equatable {
  final int value;

  const TestData(this.value);

  @override
  List<Object?> get props => [value];
}

void main() {
  group('Result', () {
    test('should create a successful result', () {
      const data = TestData(10);
      const result = Result<TestData>.success(data);
      expect(result.isSuccess, true);
      expect(result.data, data);
    });

    test('should create a failure result', () {
      final failure = TestFailure();
      final result = Result<TestData>.failure(failure);
      expect(result.isSuccess, false);
      expect(result.error, failure);
    });

    test('should execute success callback when isSuccess is true', () {
      const data = TestData(10);
      const result = Result<TestData>.success(data);
      int successValue = 0;
      result.when(
        success: (d) => successValue = d.value,
        failure: (_) => fail('Should not execute failure callback'),
      );
      expect(successValue, 10);
    });

    test('should execute failure callback when isSuccess is false', () {
      final failure = TestFailure();
      final result = Result<TestData>.failure(failure);
      bool failureCallbackExecuted = false;
      result.when(
        success: (_) => fail('Should not execute success callback'),
        failure: (_) => failureCallbackExecuted = true,
      );
      expect(failureCallbackExecuted, true);
    });

    test('should have correct props for Equatable', () {
      const data = TestData(10);
      final failure = TestFailure();
      const successResult = Result<TestData>.success(data);
      final failureResult = Result<TestData>.failure(failure);

      expect(successResult.props, [data, null]);
      expect(failureResult.props, [null, failure]);
    });

    test('should throw an error when accessing data of a failure result', () {
      final failure = TestFailure();
      final result = Result<TestData>.failure(failure);
      expect(() => result.data, throwsA(isA<TypeError>()));
    });

    test('should throw an error when accessing error of a success result', () {
      const data = TestData(10);
      const result = Result<TestData>.success(data);
      expect(() => result.error, throwsA(isA<TypeError>()));
    });
  });
}
