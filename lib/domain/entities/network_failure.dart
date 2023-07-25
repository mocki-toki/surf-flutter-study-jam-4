import 'package:surf_practice_magic_ball/domain/entities/failure.dart';

final class NetworkFailure extends Failure {
  const NetworkFailure({
    required this.exception,
  });

  final dynamic exception;
}
