import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:surf_practice_magic_ball/domain/entities/domain_failure.dart';
import 'package:surf_practice_magic_ball/domain/entities/failure.dart';
import 'package:surf_practice_magic_ball/domain/entities/network_failure.dart';
import 'package:surf_practice_magic_ball/domain/entities/reading.dart';
import 'package:surf_practice_magic_ball/domain/entities/server_failure.dart';
import 'package:surf_practice_magic_ball/domain/services/reading_service.dart';
import 'package:surf_practice_magic_ball/infrastructure/constants.dart';

final class ReadingServiceImpl implements ReadingService {
  ReadingServiceImpl(this._dio);

  final Dio _dio;

  @override
  Future<Either<Failure, Reading>> getReading() async {
    try {
      final response = await _dio.get(Constants.baseUrl);
      return Right(
        Reading.fromJson(response.data as Map<String, dynamic>),
      );
    } catch (e) {
      switch (e) {
        case DioException():
          return Left(
            ServerFailure(
              message: e.response?.statusMessage,
              exception: e,
            ),
          );
        case SocketException():
          return Left(
            NetworkFailure(exception: e),
          );
        default:
          return Left(DomainFailure(exception: e));
      }
    }
  }
}
