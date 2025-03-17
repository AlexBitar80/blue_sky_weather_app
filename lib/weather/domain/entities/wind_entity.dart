import 'package:equatable/equatable.dart';

class WindEntity extends Equatable {
  final double speed;
  final int deg;

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
