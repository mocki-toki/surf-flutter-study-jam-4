import 'package:fpdart/fpdart.dart';
import 'package:surf_practice_magic_ball/domain/entities/failure.dart';
import 'package:surf_practice_magic_ball/domain/entities/reading.dart';

abstract interface class ReadingService {
  Future<Either<Failure, Reading>> getReading();
}
