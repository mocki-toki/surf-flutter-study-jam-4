import 'package:surf_practice_magic_ball/domain/entities/failure.dart';

final class DomainFailure extends Failure {
  const DomainFailure({
    required this.exception,
  });

  final dynamic exception;
}
