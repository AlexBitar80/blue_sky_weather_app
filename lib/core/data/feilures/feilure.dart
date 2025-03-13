import 'package:equatable/equatable.dart';

class Failure extends Equatable implements Exception {
  final bool isWarning;
  final String title;
  final String message;

  const Failure({
    this.isWarning = true,
    this.title = 'Erro',
    this.message = 'Ops! ',
  });

  @override
  List<Object?> get props => [
        isWarning,
        title,
        message,
      ];
}
