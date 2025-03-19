import 'package:equatable/equatable.dart';

class WindEntity extends Equatable {
  final num speed;
  final num deg;

  const WindEntity({
    required this.speed,
    required this.deg,
  });

  @override
  List<Object> get props => [
        speed,
        deg,
      ];
}
