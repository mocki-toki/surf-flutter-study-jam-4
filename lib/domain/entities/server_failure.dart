import 'package:dio/dio.dart';
import 'package:surf_practice_magic_ball/domain/entities/failure.dart';

final class ServerFailure extends Failure {
  const ServerFailure({
    this.message,
    required this.exception,
  });

  final String? message;
  final DioException exception;
}
