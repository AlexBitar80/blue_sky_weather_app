import 'dart:io';
import 'package:blue_sky/shared/shared.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final properties = [
    ImagesString.weatherHumidity,
    ImagesString.weatherMainIcon,
    ImagesString.weatherRain,
    ImagesString.weatherTemp,
    ImagesString.weatherWind,
  ];

  group('ImagesString', () {
    test('should be strings non-null and non-empty', () {
      for (final property in properties) {
        expect(property, isNotNull, reason: '$property should not be null');
        expect(property, isNotEmpty, reason: '$property should not be empty');
      }
    });

    test('should call images with existing paths', () {
      for (final path in properties) {
        final file = File(path);
        expect(file.existsSync(), isTrue, reason: '$path should exist');
      }
    });
  });
}
