import 'package:blue_sky/shared/week_day_to_string.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  setUpAll(() async {
    await initializeDateFormatting('pt_BR', null);
  });
  group('StringFormatter', () {
    group('stringToDateTime', () {
      test('should correctly format a date string to day abbreviation', () {
        const dateString = '2023-11-15 10:30:00';
        final formattedDate = StringFormatter.stringToDateTime(dateString);
        expect(formattedDate, 'qua');
      });

      test('should handle different date strings correctly', () {
        const dateString = '2023-11-12 15:45:00';
        final formattedDate = StringFormatter.stringToDateTime(dateString);
        expect(formattedDate, 'dom');
      });

      test('Should parse date strings with different times', () {
        const dateString = '2023-11-16 00:00:00';
        final formattedDate = StringFormatter.stringToDateTime(dateString);
        expect(formattedDate, 'qui');
      });
    });

    group('hourFormatter', () {
      test('should correctly format a time string to HH:mm', () {
        const timeString = '2023-11-15 10:30:00';
        final formattedTime = StringFormatter.hourFormatter(timeString);
        expect(formattedTime, '10:30');
      });

      test('should handle different time strings correctly', () {
        const timeString = '2023-11-12 15:45:00';
        final formattedTime = StringFormatter.hourFormatter(timeString);
        expect(formattedTime, '15:45');
      });

      test('should handle midnight correctly', () {
        const timeString = '2023-11-15 00:00:00';
        final formattedTime = StringFormatter.hourFormatter(timeString);
        expect(formattedTime, '00:00');
      });

      test('should handle noon correctly', () {
        const timeString = '2023-11-15 12:00:00';
        final formattedTime = StringFormatter.hourFormatter(timeString);
        expect(formattedTime, '12:00');
      });

      test('Should parse time strings with different days', () {
        const timeString = '2023-11-16 10:30:00';
        final formattedTime = StringFormatter.hourFormatter(timeString);
        expect(formattedTime, '10:30');
      });
    });
  });
}
